## my nix files

### installation

```bash
git clone https://github.com/jfk9w/nix.git ~/.config/nix
```

#### macos

```bash
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
sudo nix run nix-darwin/master#darwin-rebuild -- switch
sudo darwin-rebuild switch --flake ~/.config/nix
```

