# Workstation remote access

`uzel-01` · Debian 13 · user `ang` · Ethernet MAC `d0:c1:b5:22:0a:54`.

## Setup

Install Ansible, then run:

```sh
just configure-workstation
```

Enables SSH, remote LUKS unlock, Wake-on-LAN, and passwordless shutdown.
Requires 150 MiB free in `/boot`; does not reboot.

Both boot stages use `192.168.100.50/24`, gateway `192.168.100.1`, on USB
interface `enxd0c1b5220a54`. Confirm `.50` is unused and outside the DHCP pool.
Normal networking changes take effect on reboot, not during provisioning.
The existing `/etc/resolv.conf` includes router DNS and is preserved. After
boot, verify DNS with `getent hosts deb.debian.org`. To recover locally,
restore the timestamped `/etc/network/interfaces` backup created by Ansible.

## Phone

Install Termux `openssh` and `wol`. Add to `~/.ssh/config`, replacing the IP
and key paths:

```sshconfig
Host workstation-unlock
    HostName 192.168.100.50
    User root
    IdentityFile ~/.ssh/DROPBEAR_PHONE_KEY
    IdentitiesOnly yes
    HostKeyAlias workstation-initramfs

Host workstation-admin
    HostName 192.168.100.50
    User ang
    IdentityFile ~/.ssh/ADMIN_PHONE_KEY
    IdentitiesOnly yes
    HostKeyAlias workstation-normal
```

| Action | Command |
| --- | --- |
| Wake | `wol d0:c1:b5:22:0a:54` |
| Unlock | `ssh -t workstation-unlock cryptroot-unlock` |
| Shut down | `ssh -t workstation-admin sudo -n /bin/systemctl poweroff` |

For Termux:Widget, put each command in an executable script in `~/.shortcuts/`.
Enter the LUKS passphrase interactively; never save it in a script.

## First test

- Verify both SSH host fingerprints locally before connecting.
- Keep a keyboard and display handy; reboot and test unlocking.
- Test shutdown and wake on the same LAN. USB wake may require firmware settings.

Uses Baza's phone keys. The unlock key grants root access in initramfs;
keep access on a trusted network.
