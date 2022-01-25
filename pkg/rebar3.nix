{ stdenvNoCC, erlang }:

stdenvNoCC.mkDerivation rec {
  pname = "rebar3";
  version = "3.18.0";
  # How to obtain hash:
  # nix-prefetch-url https://github.com/erlang/rebar3/releases/download/<version>/rebar3
  hash = "sha256:1w3g2dz1zcz4578wjkf4qqmkkyv33kk3x174dh3j7ki3x4dn9qpk";
  src = import <nix/fetchurl.nix> {
    url = "https://github.com/erlang/rebar3/releases/download/${version}/rebar3";
    inherit hash;
  };
  nativeBuildInputs = [
    erlang
  ];
  builder = builtins.toFile "builder.sh" ''
    source $stdenv/setup
    mkdir -p $out/bin
    cp $src $out/bin/rebar3
    chmod +x $out/bin/rebar3
    patchShebangs $out/bin/rebar3
  '';
}
