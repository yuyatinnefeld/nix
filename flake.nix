{
  description = "devops flake - yt";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        myPackages = import ./packages.nix { inherit pkgs; };
      in
      {
        packages = myPackages;

        defaultPackage = myPackages.hello;

        apps = {
          inherit (myPackages) hello;
        };

        devShell = pkgs.mkShell {
          buildInputs = [
            # General
            myPackages.curl
            myPackages.wget
            myPackages.jq
            myPackages.inetutils

            # Programming
            myPackages.jdk17

            # Container
            myPackages.minikube
            myPackages.kubectl
            myPackages.kustomize
            myPackages.k9s
            myPackages.istioctl
            myPackages.kube-linter

            # Infrastructure

            # Cloud Provider
            myPackages.azure-cli
          ];
        };
      }
    );
}
