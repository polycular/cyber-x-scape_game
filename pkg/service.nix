{ config, pkgs, lib, ... }:

let
  release = (import ../default.nix { }).release_local;
  release_name = "cxs";
  working_directory = "/home/main/app/cxs";
in
{
  systemd.services.${release_name} = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    requires = [ "network-online.target" ];
    description = release_name;
    serviceConfig = {
      Type = "exec";
      User = "main";
      WorkingDirectory = working_directory;
      ExecStart = ''
        ${release}/bin/${release_name} start
      '';
      ExecStop = ''
        ${release}/bin/${release_name} stop
      '';
      ExecReload = ''
        ${release}/bin/${release_name} restart
      '';
      Restart = "on-failure";
      RestartSec = 5;
    };
    # disksup requires bash
    path = [ pkgs.bash ];
  };

  environment.systemPackages = [ release ];
}
