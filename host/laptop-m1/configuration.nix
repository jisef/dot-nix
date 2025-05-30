{ pkgs, apple-silicon-support, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    apple-silicon-support.nixosModules.default
  ];

  # Adds patched Mesa GPU Driver and Stuff
  nixpkgs.overlays = [ apple-silicon-support.overlays.apple-silicon-overlay ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Logitech support
  #hardware.logitech.wireless.enable = true;
  #hardware.logitech.wireless.enableGraphical = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.supportedFilesystems = [ "ntfs" ];

  # when lid closed -> gibernation
  services.logind = {
    extraConfig = ''
      HandleLidSwitch=hibernate
    '';
  };

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
    useExperimentalGPUDriver = false;
    experimentalGPUInstallMode = "replace";
    setupAsahiSound = true;
  };
  hardware.asahi.peripheralFirmwareDirectory = ./firmware;
  services.xserver.enable = false;
  hardware.graphics.enable = true;

  services.xserver.xkb.layout = "de";
  services.xserver.xkb.options = "eurosign:e,caps:escape";

  # CUPS
  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.josef = {
    isNormalUser = true;
    extraGroups =
      [ "wheel" "docker" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    lua
    neovim
    cargo
    wget
    zsh
    nurl
    nh
    imagemagick
    home-manager
    nixfmt-classic
    light
    actkbd
    rofi-wayland
    chafa
    yazi
    unzip
    vitetris
    libreoffice
    vlc

    # ####################
    # tools
    # ####################
    btop
    ripgrep
    inxi
    nom
    fzf
    eza
    zoxide
    lazydocker
    fastfetch
    pipes
    isd
    boot
    zip
    dnslookup
    sl
    bat
    usbutils
    rclone
    ungoogled-chromium
    quickemu
    iotop
    sysstat

    # ####################
    # Proton
    # ####################
    protonvpn-gui

    # ####################
    # Terminals
    # ####################
    kitty

    # ####################
    # For Neovim
    # ####################
    gcc
    clang
    cl
    zig
  ];

  # Hyprland
  #programs.hyprland.enable = true;
  environment.sessionVariables = {
    WLR_DRM_DEVICES = "/dev/dri/card0";
    AQ_DRM_DEVICES = "/dev/dri/card0";
  };

  # Login Screen
  services.xserver = { displayManager.startx.enable = true; };

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="power_supply", KERNEL=="macsmc-battery", ATTR{charge_control_end_threshold}="80"

    ACTION=="add", SUBSYSTEM=="power_supply", KERNEL=="macsmc-battery", ATTR{charge_control_start_threshold}="30"
  '';
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16 * 1024;
    randomEncryption.enable = true;
  }];

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
