{ config, pkgs, lib, ... }:

let
  systemUsers = config.users.users;

 usersDir = "./home";
  
  mkUserHomeManager = userName: userConfig:
    let
      userDir = usersDir + "/${userName}";
      
      # Check if the user-specific directory exists and contains a configuration.
      # This ensures the configuration doesn't break if a user doesn't have a custom file.
      userFileExists = lib.fileExists (userDir + "/home.nix");

      # List of modules to import for this user.
      userModules = [
        # Always import the default shared configuration
         usersDir + "/home.nix")
      ] 
      # Conditionally add the user-specific configuration if it exists
      ++ lib.optionals userFileExists (
        (userDir + "/home.nix")
      );
      
    in
    # Return the Home Manager module configuration for this user
    {
      # The user's configuration is composed of the dynamic imports
      imports = userModules;
      
      # NOTE: It's good practice to set home.username and home.homeDirectory 
      # in the user's specific module (e.g., default/home.nix) to ensure 
      # Home Manager knows who it's configuring, although in a NixOS module
      # setup, it often auto-detects based on the key ('userName').
      
      # You MUST set the stateVersion in one of the imported modules (like default/home.nix).
    };

in
{
  # 4. Use mapAttrs to apply the function to every user in the system
  # The result is an attribute set: { kriswilk = { imports = [...]; }; otheruser = { imports = [...]; }; }
  # This matches the structure expected by 'home-manager.users'.
  home-manager.users = lib.mapAttrs mkUserHomeManager systemUsers;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = lib.mapAttrs mkUserHomeManager systemUsers;
  };
}