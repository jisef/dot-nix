{ pkgs, config, ... }: {
  environment.systemPackages = with pkgs; [
    rust-analyzer
    cargo
    crates-tui
    rustc
    cargo-generate
  ];
}
