# Provisioning

System installation, desktop setup, and package notes live in [system.org](system.org).
The Org file tangles the initial setup commands to [scripts/init.sh](scripts/init.sh);
other setup blocks are run separately as needed.

See [Termux SSH](docs/termux-ssh.md) for connecting to an Android phone from a PC.
See [ProtonVPN](docs/protonvpn.md) for the workstation VPN installation.

Run `just configure-split-dns` to route `baza.lan` lookups to the home router
while using CleanBrowsing for other DNS queries. This installs systemd-resolved
and replaces `/etc/resolv.conf` with its local resolver stub.

Clone the dotfiles repository to `~/Workspace/dotfiles` before running its Stow steps.
On an existing machine with links pointing to `~/dotfiles`, keep them working with:

```sh
ln -s Workspace/dotfiles ~/dotfiles
```
