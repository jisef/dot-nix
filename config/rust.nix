# rustup toolchain install stable
{ pkgs, config, ... }: {
  environment.systemPackages = with pkgs; [
    rust-analyzer
    rustup
    cargo
    crates-tui
    rustc
    cargo-generate
    openssl
  ];
  environment.sessionVariables = {
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };
}
