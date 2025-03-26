{config, pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs [
    jetbrains.idea-ultimate
    jetbrains.rust-rover
  ];
}
