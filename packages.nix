{ pkgs }:

rec {
  # General
  curl = pkgs.curl;
  wget = pkgs.wget;
  jq = pkgs.jq;
  inetutils = pkgs.inetutils;

  # Programming
  jdk17 = pkgs.jdk17;

  # Container
  minikube = pkgs.minikube;
  kubectl = pkgs.kubectl;
  kustomize = pkgs.kustomize;
  k9s = pkgs.k9s;
  istioctl = pkgs.istioctl;
  kube-linter = pkgs.kube-linter;

  # Infrastructure

  # Cloud Provider
  azure-cli = pkgs.azure-cli;

  # Default Package
  hello = pkgs.hello;
}
