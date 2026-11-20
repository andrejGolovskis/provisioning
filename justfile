default:
    @just --list

# Configure workstation remote access (prompts for sudo password)
configure-workstation:
    ansible-playbook -i inventory.ini workstation.yml --ask-become-pass

# Route local Baza DNS to the router and public DNS to CleanBrowsing
configure-split-dns:
    ansible-playbook -i inventory.ini configure-split-dns.yml --ask-become-pass

# Install the ProtonVPN desktop app and CLI
install-protonvpn:
    ansible-playbook -i inventory.ini protonvpn.yml --ask-become-pass

# Install Docker Engine from the official repository
install-docker:
    ansible-playbook -i inventory.ini docker.yml --ask-become-pass

# Validate workstation playbook syntax
check:
    ansible-playbook -i inventory.ini workstation.yml --syntax-check
    ansible-playbook -i inventory.ini configure-split-dns.yml --syntax-check
    ansible-playbook -i inventory.ini protonvpn.yml --syntax-check
    ansible-playbook -i inventory.ini docker.yml --syntax-check
    ansible-playbook -i inventory.ini opencode.yml --syntax-check

# Configure OpenCode web server (prompts for sudo and server passwords)
configure-opencode:
    ansible-playbook -i inventory.ini opencode.yml --ask-become-pass
