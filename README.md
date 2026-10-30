# Provisioning

System installation, desktop setup, and package notes live in [system.org](system.org).
The Org file tangles the initial setup commands to [scripts/init.sh](scripts/init.sh);
other setup blocks are run separately as needed.

See [Termux SSH](docs/termux-ssh.md) for connecting to an Android phone from a PC.

Clone the dotfiles repository to `~/Workspace/dotfiles` before running its Stow steps.
On an existing machine with links pointing to `~/dotfiles`, keep them working with:

```sh
ln -s Workspace/dotfiles ~/dotfiles
```
