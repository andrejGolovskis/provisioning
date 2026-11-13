# ProtonVPN

The ProtonVPN desktop app and CLI come from Proton's official Debian
repository. Install them with:

```sh
just install-protonvpn
```

The provisioning role verifies the repository package checksum, adds Proton's
APT source and signing key, and installs `proton-vpn-gnome-desktop`. You cannot
run the GUI app and the CLI at the same time.

## DNS exception

CleanBrowsing answers `protonvpn.com` with NXDOMAIN. Split DNS therefore routes
`baza.lan` and `protonvpn.com` to the router; all other queries still go to
CleanBrowsing. Re-apply it after changing the routed domain list:

```sh
just configure-split-dns
```

## NetworkManager requirement

The app activates VPN connections through NetworkManager. This workstation's
Ethernet interface (`enxd0c1b5220a54`) is configured by `ifupdown` and appears
as **unmanaged** in NetworkManager, so the app may install successfully but fail
to connect. The install role reports this condition without changing networking.

Do not migrate the interface to NetworkManager casually: it can interrupt
connectivity and remote access. Plan the change with a local console available.

## After connecting

Verify local names still resolve through the router and Forgejo remains
reachable:

```sh
resolvectl query git.baza.lan
curl -fsS -o /dev/null -w '%{http_code}\n' https://git.baza.lan/
```

The VPN may replace the default DNS server. Split DNS should still send
`baza.lan` to the router, but confirm it after each connection profile change.

## Removal

```sh
sudo apt remove proton-vpn-gnome-desktop
sudo rm /etc/apt/sources.list.d/protonvpn-stable.sources
sudo apt update
```
