{ lib, config, ... }:
{
  options = {
    userList."altr".enable = lib.mkEnableOption {
      description = "Enable user: altr";
      default = true;
    };
  };

  config = lib.mkIf config.userList."altr".enable {
    users.users."altr" = {
      name = "altr";
      description = "altr";
      isNormalUser = true;
      initialPassword = "123";
      extraGroups = [ "wheel" "networkmanager" ];
    };

    home-manager.users."altr" = import ./home.nix;
  };
}
