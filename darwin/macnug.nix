{pkgs, ...}: let
  user = "iakulkov";
in {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    fzf
    git
    git-lfs
    keepassxc
  ];

  imports = [
    ../home-manager/macnug.nix
  ];
}
