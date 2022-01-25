{ stdenvNoCC, lib, MIX_ENV, priv_static, release_name }:

# needs local _build/prod/rel/ before (mix release)
stdenvNoCC.mkDerivation rec {
  name = "mix_release";
  app_name = "phx_game";
  local_release = ../_build/${MIX_ENV}/rel/${release_name};
  inherit priv_static release_name;
  builder = builtins.toFile "builder.sh" ''
    source $stdenv/setup

    mkdir release
    cp -r $local_release/. release
    chmod -R 700 release

    # replace priv/static with deployed assets (digest)
    RELEASE_VSN=$(cut -d' ' -f2 "release/releases/start_erl.data")

    rm -rf release/lib/$app_name-$RELEASE_VSN/priv/static
    mkdir -p release/lib/$app_name-$RELEASE_VSN/priv/static
    cp -r $priv_static/. release/lib/$app_name-$RELEASE_VSN/priv/static/

    mkdir $out
    cp -r release/. $out
  '';
}
