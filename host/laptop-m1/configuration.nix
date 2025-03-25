{ pkgs, apple-silicon-support, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    apple-silicon-support.nixosModules.default
  ];

  # Adds patched Mesa GPU Driver and Stuff
  nixpkgs.overlays = [ apple-silicon-support.overlays.apple-silicon-overlay ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #home-manager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  networking.hostName = "nixos-mac"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
    #   useXkbConfig = true; # use xkb.options in tty.
  };

  hardware.asahi = {
    enable = true;
    withRust = true;
    useExperimentalGPUDriver = true;
    experimentalGPUInstallMode = "replace";
    setupAsahiSound = true;
  };
  hardware.asahi.peripheralFirmwareDirectory = ./firmware;

  services.xserver.xkb.layout = "de";
  services.xserver.xkb.options = "eurosign:e,caps:escape";

  # CUPS
  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users.users.josef = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    cargo
    wget
    zsh
    kitty
    fastfetch
    git
    nurl
    nh
    nom
    fzf
    eza
    zoxide
    ghostty
    imagemagick
    home-manager
    nixfmt-classic
    btop
    tlp
    light
    actkbd
    lazygit

    # for neovim
    gcc
    clang
    cl
    zig

  ];
  # Hyprland
  programs.hyprland.enable = true;
  environment.sessionVariables = {
    WLR_DRM_DEVICES = "/dev/dri/card0";
    AQ_DRM_DEVICES = "/dev/dri/card0";
  };
  services.tlp.settings = { STOP_CHARGE_THRESH_BAT0 = 80; };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # dont edit
  system.stateVersion = "25.05";

}
