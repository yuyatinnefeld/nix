# Nix

## Install
To install Nix, run the following command:
```bash
sh <(curl -L https://nixos.org/nix/install)
```

## Clean Up
To clean up the Nix store and free up space, run:
```bash
nix-store --gc
```

## Search Packages
To search for packages in the Nixpkgs repository, use:
```bash
nix search nixpkgs <PACKAGE_NAME>
nix search nixpkgs hyperkit
nix search nixpkgs colima
```

## Build and Run
To build and run a package:
```bash
# Build the package (creating a file in /nix/store/xxxx-nix-shell.drv which is used for nix-shell)
nix-build packages/all.nix

# run the package
nix-shell packages/all.nix

# clean up
nix-shell --pure packages/all.nix
```

## nix-shell

### Temporary shell

```bash
nix-shell -p git nodejs
```

```bash
[nix-shell:~/desktop/projects/github/my-nix]$ which git
/nix/store/5hkhxkqzwyak9ji766885jm98pgkxxjx-git-2.45.1/bin/git

[nix-shell:~/desktop/projects/github/my-nix]$ which npm
/nix/store/gxi71m2y8x1rl83dpr1g0x9yz3klrcb0-nodejs-20.12.2/bin/npm

[nix-shell:~/desktop/projects/github/my-nix]$ git --version
git version 2.45.1

[nix-shell:~/desktop/projects/github/my-nix]$ npm --version
10.5.0

# free up some disk space
nix-collect-garbage

[nix-shell:~/desktop/projects/github/my-nix]$ git --version
bash: /nix/store/5hkhxkqzwyak9ji766885jm98pgkxxjx-git-2.45.1/bin/git: No such file or directory

[nix-shell:~/desktop/projects/github/my-nix]$ npm
bash: /nix/store/gxi71m2y8x1rl83dpr1g0x9yz3klrcb0-nodejs-20.12.2/bin/npm: No such file or directory
```

### Declarative Shell
```bash
vi shell.nix
nix-shell shell.nix
```

```bash
[nix-shell:~/desktop/projects/github/my-nix]$ git --version
git version 2.42.2

[nix-shell:~/desktop/projects/github/my-nix]$ which git
/nix/store/w8wgxggkw1g9hkg9l1na0vh5379jfk2k-git-2.42.2/bin/git
```

## Evaluate Nix expressions interactively 
```bash
[nix-shell:~/desktop/projects/github/my-nix]$ nix repl
Nix 2.23.0
Type :? for help.
nix-repl> let
           x = 1;
           y = 2;
          in x + y
3

nix-repl> "say hello"
"say hello"

nix-repl> data = 1

nix-repl> data

# escape
nix-repl> :q
```

## nix.conf File

```bash
# global nix.conf
$ cat /etc/nix/nix.conf
build-users-group = nixbld

# project level nix.conf
mkdir -p .config/nix && touch .config/nix/nix.conf
```