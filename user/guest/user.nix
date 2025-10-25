{ ... }:

{
  users.users.guest = {
    isNormalUser = true;
    description = "Guest User";
    password = "guest";
    extraGroups = [ "networkmanager" ];
  };
}