{ config, lib, pkgs, ... }:

{
  # home.sessionVariables = {
  #   #BEMOJI_DB_LOCATION="$XDG_DATA_HOME/bemoji"; # where the emoji lists reside
  #   #BEMOJI_HISTORY_LOCATION="$XDG_STATE_HOME"; # where the state file resides
  #   #BEMOJI_CUSTOM_LIST=""; # the custom emoji list to display
  #   BEMOJI_DOWNLOAD_LIST="all"; # the default emoji lists to download to database
  #   BEMOJI_DEFAULT_COMMAND="fuzzel -d"; # which command to invoke by default
  #   #BEMOJI_PICKER_CMD="bemenu"; # which picker tool to use
  #   #BEMOJI_CLIP_CMD="wl-copy"; # which clipboard tool to use
  #   #BEMOJI_TYPE_CMD="wtype"; # which typing tool to use (ydotool will NOT work)
  #   BEMOJI_PRIVATE_MODE=true; # whether to save new entries
  #   BEMOJI_LIMIT_RECENT=0; # whether to display recent entries
  #   BEMOJI_ECHO_NEWLINE=false; # whether to end the output with a newline character
  # };

  home.packages = with pkgs; [
    bemoji
  ];
}