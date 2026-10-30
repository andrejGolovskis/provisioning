# Termux SSH

On the phone, install and start SSH, and note the username:

```sh
pkg install openssh
whoami
passwd
sshd
```

Find the phone's IP address in its Wi-Fi settings. On the computer:

```sh
ssh -p 8022 USERNAME@PHONE_IP
ssh-copy-id -p 8022 USERNAME@PHONE_IP
```

Verify the host key before accepting it. Stop the server with `pkill sshd` when
finished; do not expose it to the internet.
