{
  pkgs,
  lib,
  ...
}: {
  home.programs = with pkgs; [
    go
  ];
  home.activation = {
    setGoEnv = lib.hm.dag.entryAfter ["writeBoundary"] ''
      go env -w GOPROXY="https://goproxy.msk.avito.ru,https://proxy.golang.org,direct"
      go env -w GONOSUMDB="go.avito.ru"
      go env -w GOPRIVATE=
    '';
  };
}
