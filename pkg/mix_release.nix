{ stdenvNoCC, lib, elixir, MIX_ENV, LANG, MIX_PATH, priv_static, release_name }:

# needs local deps & _build before (mix deps.get & mix compile)
stdenvNoCC.mkDerivation rec {
  name = "mix_release";
  app_name = "phx_game";
  local_deps = ../deps;
  local_build = ../_build/${MIX_ENV};
  config_exs = ../config/config.exs;
  config_env = ../config/${MIX_ENV}.exs;
  config_runtime = ../config/runtime.exs;
  rel = ../rel;
  mix_exs = ../mix.exs;
  mix_lock = ../mix.lock;
  inherit MIX_ENV LANG MIX_PATH priv_static release_name;
  nativeBuildInputs = [
    elixir
  ];
  builder = builtins.toFile "builder.sh" ''
    source $stdenv/setup

    ln -s $mix_exs mix.exs
    ln -s $mix_lock mix.lock
    ln -s $rel rel

    # config
    mkdir -p config
    ln -s $config_exs config/config.exs
    ln -s $config_env config/$MIX_ENV.exs
    ln -s $config_runtime config/runtime.exs

    # deps
    cp -r $local_deps/. deps/
    chmod -R 700 deps

    # build
    mkdir -p _build/$MIX_ENV
    cp -r $local_build/. _build/$MIX_ENV
    chmod -R 700 _build

    mkdir $out
    mix release $release_name --no-compile --path $out --quiet

    # replace priv/static with deployed assets (digest)
    RELEASE_VSN=$(cut -d' ' -f2 "$out/releases/start_erl.data")

    rm -rf $out/lib/$app_name-$RELEASE_VSN/priv/static
    mkdir -p $out/lib/$app_name-$RELEASE_VSN/priv/static
    cp -r $priv_static/. $out/lib/$app_name-$RELEASE_VSN/priv/static/
  '';
}
