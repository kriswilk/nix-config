{
  "kris" = {
    isNormalUser = true;
    description = "Kris Wilk";
    password = "abc123";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  "guest" = {
    isNormalUser = true;
    description = "Guest User";
    password = "guest";
    extraGroups = [ "networkmanager" ];
  };
}