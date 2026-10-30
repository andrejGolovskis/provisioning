# OpenCode web server

Requires OpenCode V2 at `/home/ang/.opencode/bin/opencode`.

```sh
just configure-opencode
```

Enter the sudo password and a server password when prompted. The latter is
stored in root-only `/etc/opencode/server.env`, never in Git or Ansible output.
Use the same password when reapplying; changing it signs clients out.

The service starts immediately and on subsequent boots after LUKS unlock,
without a desktop login. It runs as `ang`, with access to that user's files,
tools, and OpenCode configuration. It listens on all IPv4 interfaces on 4096.
On the LAN open `http://192.168.100.50:4096` (or the current workstation IP).
If prompted for HTTP authentication, use username `opencode` and the password
you entered. Plain HTTP does not encrypt credentials or traffic; use only a
trusted LAN, or use an SSH tunnel/HTTPS for an untrusted network. Do not
forward this port through the router.

```sh
systemctl status opencode-web
sudo journalctl -u opencode-web -n 50
sudo systemctl stop opencode-web
```

The managed web server is separate from OpenCode's automatically started
background service. To use it from the CLI, pass
`opencode --server http://127.0.0.1:4096` with `OPENCODE_PASSWORD` set locally.
