# Termux SSH access

Run an SSH server in Termux to manage the phone's Termux environment from a
computer on the same trusted network. This does not grant root access or general
access to Android settings and other apps.

## On the phone

Install OpenSSH, set a Termux password for the initial login, and start sshd:

```sh
pkg update
pkg install openssh
whoami
passwd
sshd
```

Note the username from `whoami`. Find the phone's current IP address in Android's
Wi-Fi network details; `ip addr` may be denied on Android. Termux SSH listens on
port `8022` by default.

## On the computer

Replace the username and IP address with the phone's values:

```sh
ssh -p 8022 USERNAME@PHONE_IP
ssh-copy-id -p 8022 USERNAME@PHONE_IP
```

Verify the phone's SSH host key before accepting it. After installing the public
key, test a new login before disabling password authentication. Keep private
keys out of Git.

## Troubleshooting and shutdown

If the connection is refused, verify that the phone's IP has not changed and
that `sshd` is running in Termux:

```sh
pgrep -a sshd
sshd -T
```

Check the `port` and `listenaddress` lines. From the computer, use
`ssh -v -p 8022 USERNAME@PHONE_IP` for more detail. Android may stop background
processes; restart `sshd` if necessary. Stop it when it is not needed:

```sh
pkill sshd
```

Do not expose the Termux SSH port to the internet.
