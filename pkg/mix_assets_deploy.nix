{ stdenvNoCC, lib, elixir, MIX_ENV, LANG, MIX_PATH }:

# needs local deps & _build before (mix deps.get & mix compile)
stdenvNoCC.mkDerivation rec {
  name = "priv_static";
  local_deps = ../deps;
  local_build = ../_build/${MIX_ENV};
  esbuild_bin = ../_build/esbuild-linux-64;
  assets = ../assets;
  config_exs = ../config/config.exs;
  config_env = ../config/${MIX_ENV}.exs;
  config_runtime = ../config/runtime.exs;
  priv_static = ../priv/static;
  mix_exs = ../mix.exs;
  mix_lock = ../mix.lock;
  inherit MIX_ENV MIX_PATH LANG;
  nativeBuildInputs = [
    elixir
  ];
  builder = builtins.toFile "builder.sh" ''
    source $stdenv/setup

    ln -s $mix_exs mix.exs
    ln -s $mix_lock mix.lock

    # config
    mkdir -p config
    ln -s $config_exs config/config.exs
    ln -s $config_env config/$MIX_ENV.exs
    ln -s $config_runtime config/runtime.exs

    # deps
    cp -r $local_deps/. deps/
    chmod -R 700 deps

    # _build
    mkdir -p _build
    cp -r $local_build/. _build/$MIX_ENV
    chmod -R 700 _build

    ln -s $esbuild_bin _build/esbuild-linux-64

    # assets
    cp -r $assets/. assets/
    chmod -R 700 assets

    # priv
    mkdir -p priv
    cp -r $priv_static/. priv/static/
    chmod -R 700 priv/static

    mix assets.deploy

    mkdir $out
    cp -r priv/static/. $out
  '';
}
