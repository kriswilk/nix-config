{ ... }:

{
  users.mutableUsers = false;
  
  users.users.kris = {
    isNormalUser = true;
    description = "Kris Wilk";
    password = "abc123";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  users.users.guest = {
    isNormalUser = true;
    description = "Guest User";
    password = "guest";
    extraGroups = [ "networkmanager" ];
  };
}