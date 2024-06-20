# My Nix

## Install
```bash
sh <(curl -L https://nixos.org/nix/install)
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
nix-shell
```

```bash
[nix-shell:~/desktop/projects/github/my-nix]$ git --version
git version 2.42.2

[nix-shell:~/desktop/projects/github/my-nix]$ which git
/nix/store/w8wgxggkw1g9hkg9l1na0vh5379jfk2k-git-2.42.2/bin/git
```