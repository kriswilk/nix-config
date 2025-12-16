{ inputs, config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    # profiles.default = {
    #   settings = {
    #     #"dom.security.https_only_mode" = true;
    #     #"browser.download.panel.shown" = true;
    #     #"identity.fxaccounts.enabled" = false;
    #     #"signon.rememberSignons" = false;
    #   };

    #   # userChrome = ''                         
    #   #   /* some css */                        
    #   # '';                                      

    # };

    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFirefoxAccounts = true;
      DisableFormHistory = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "never";

      ExtensionSettings = {
        "*" = {
          installation_mode = "blocked";
        };
        
        # augmented steam          
        "{1be309c5-3e4f-4b99-927d-bb500eb4fa88}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/augmented-steam/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };

        # bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
        };

        # clearurls
        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };

        # keepa
        "amptra@keepa.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepa/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };

        # web edit
        "webedit@ryanluu.dev" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/web-edit/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };

        # raindrop.io
        "jid0-adyhmvsP91nUO8pRv0Mn2VKeB84@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/raindropio/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
        };

        # sink it for reddit
        "{09acf9ff-55d4-4366-a1a9-c9b3c8877c09}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sink-it-for-reddit/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };

        # sponsorblock
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };

        # ublock-origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
        };
      };

      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        Stories = false;
        SponsoredPocket = false;
        SpomoredStories = false;
        Snippets = false;
        Locked = true;
      };

      FirefoxSuggest = {
        WebSuggestions = true;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
        Locked = true;
      };

      GenerativeAI = {
        Enabled = false;
        Chatbot = true;
        LinkPreviews = false;
        TabGroups = false;
        Locked = true;
      };

      HttpsOnlyMode = "force_enabled";
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      PasswordManagerEnabled = false;

      Preferences = {
        "browser.startup.homepage" = "about:newtab";
      };

      SearchEngines.Add = [
        {
          Name = "Nix Packages";
          URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
          IconURL = "https://nixos.org/favicon.ico";
          Alias = "@np";
        }
        {
          Name = "Nix Options";
          URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
          IconURL = "https://nixos.org/favicon.ico";
          Alias = "@no";
        }
      ];

      ShowHomeButton = false;
      SkipTermsOfUse = true;
    };

  };

  home.packages = with pkgs; [
    lynx
  ];
}