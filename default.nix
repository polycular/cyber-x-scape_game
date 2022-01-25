{ pkgs ? import ./pkg/_pkgs.nix, MIX_ENV ? "prod", release_name ? "cxs" }:

rec {
  elixir = pkgs.beam.packages.erlangR24.elixir_1_13;
  nodejs = pkgs.nodejs-17_x;

  LANG = "C.UTF-8";
  MIX_PATH = "${hex}/archives/hex-${hex.version}/hex-${hex.version}/ebin";

  hex = pkgs.callPackage ./pkg/hex.nix {
    inherit elixir LANG;
  };

  # Needs `--relaxed-sandbox` (impure fetch)
  node_modules = pkgs.callPackage ./pkg/node_modules.nix {
    inherit nodejs;
  };

  priv_static = pkgs.callPackage ./pkg/mix_assets_deploy.nix {
    inherit elixir MIX_ENV LANG MIX_PATH;
  };

  release = pkgs.callPackage ./pkg/mix_release.nix {
    inherit elixir MIX_ENV LANG MIX_PATH;
    inherit priv_static;
    inherit release_name;
  };

  release_local = pkgs.callPackage ./pkg/mix_release_local.nix {
    inherit MIX_ENV;
    inherit priv_static;
    inherit release_name;
  };
}
