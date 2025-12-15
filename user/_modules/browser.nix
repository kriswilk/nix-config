{ inputs, config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.default = {
      # search.engines = {
      #   "Nix Packages" = {
      #     definedAliases = [ "@np" ];
      #     icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      #     urls = [{
      #       template = "https://search.nixos.org/packages";
      #       params = [
      #         { name = "type"; value = "packages"; }
      #         { name = "query"; value = "{searchTerms}"; }
      #       ];
      #     }];
      #   };
      #   "Nix Options" = {
      #     definedAliases = [ "@no" ];
      #     icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      #     urls = [{
      #       template = "https://search.nixos.org/options";
      #       params = [
      #         { name = "type"; value = "options"; }
      #         { name = "query"; value = "{searchTerms}"; }
      #       ];
      #     }];
      #   };
      # };
      # search.force = true;

      # bookmarks = [
      #   {
      #     name = "wikipedia";
      #     tags = [ "wiki" ];
      #     keyword = "wiki";
      #     url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
      #   }
      # ];

      settings = {
        #"dom.security.https_only_mode" = true;
        #"browser.download.panel.shown" = true;
        #"identity.fxaccounts.enabled" = false;
        #"signon.rememberSignons" = false;
      };

      # userChrome = ''                         
      #   /* some css */                        
      # '';                                      

      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        #bitwarden
        ublock-origin
        #sponsorblock
        #keepa???
        #webedit???
        #sinkitforreddit???
        #clearurls???
        #augmentedsteam???
        #raindropio???

        #darkreader
        #tridactyl
        #youtube-shorts-block
      ];

    };
  };

  home.packages = with pkgs; [
    lynx
  ];
}