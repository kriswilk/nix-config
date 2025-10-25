{ ... }:

{
  users.users.kris = {
    isNormalUser = true;
    description = "Kris Wilk";
    password = "abc123";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}