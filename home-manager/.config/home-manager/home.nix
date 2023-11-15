{ config, pkgs, ... }:

let 
  username = "etienne";
  flatpakHelper = import ./flatpak-helper.nix;
  passmenumore = import ./passmenumore.nix { pkgs = pkgs; };
  pwolf = import ./librewolf-private.nix { pkgs = pkgs; };

  steam = flatpakHelper { pkgs = pkgs; filename = "steam"; flatpakid = "com.valvesoftware.Steam"; };
  discord = flatpakHelper { pkgs = pkgs; filename = "discord"; flatpakid = "com.discordapp.Discord"; };
in
{
  nixpkgs.overlays = [ (final: prev: {
      jmeter = prev.jmeter.overrideAttrs (old: {
        installPhase = old.installPhase + ''
          sed -i '2 i export _JAVA_AWT_WM_NONREPARENTING=1' $out/bin/jmeter
          sed -i '$s/^/JVM_ARGS="-Xms10g -Xmx10g" /' $out/bin/jmeter
        '';
      });
    })
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.


  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pwolf
    passmenumore
    steam
    discord

    pkgs.clang-tools
    pkgs.vscode
    pkgs.nodejs
    pkgs.unzip
    pkgs.jmeter
    pkgs.azuredatastudio
    pkgs.brave
    pkgs.libreoffice
    pkgs.librewolf
    pkgs.lm_sensors
    pkgs.nb
    pkgs.direnv
    pkgs.nix-direnv
    #pkgs.postman
    pkgs.yazi
    pkgs.remmina
    pkgs.taskwarrior
    pkgs.timewarrior
    pkgs.htop
    pkgs.tmux
    pkgs.stow
    pkgs.bat
    pkgs.sxiv
    pkgs.rust-script
    pkgs.zoxide

    pkgs.tmate
    pkgs.jq

    # Screenshot
    pkgs.grim
    pkgs.swappy

    pkgs.ripgrep
    pkgs.fzf
    pkgs.fd

    # BTRFS tools
    pkgs.compsize
    pkgs.btdu

    pkgs.galculator
  ];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
