{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    go
    golangci-lint
  ];
  home.activation = {
    setGoEnv = lib.hm.dag.entryAfter ["writeBoundary"] ''
      ${pkgs.go}/bin/go env -w GOPATH="$HOME/.local/share/go"
      ${pkgs.go}/bin/go env -w GOPROXY="https://goproxy.msk.avito.ru,https://proxy.golang.org,direct"
      ${pkgs.go}/bin/go env -w GONOSUMDB="go.avito.ru"
      ${pkgs.go}/bin/go env -w GOPRIVATE=
    '';
  };
}
