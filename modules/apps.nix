{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # system info
    screenfetch

    # terminal file manager
    nnn

    # monitoring
    htop
    btop

    # archives
    zip
    xz
    unzip
    p7zip

    # search / processing
    ripgrep
    jq
    yq-go
    eza
    fzf

    # networking tools
    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    nmap
    ipcalc
    iftop

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # terminal
    tmux

    # nix
    nix-output-monitor

    # security
    age
    sops

    # dev tools
    direnv
    talosctl
    kubectl
    mc
  ];
}
