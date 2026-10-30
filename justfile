default:
    @just --list

# Configure workstation remote access (prompts for sudo password)
configure-workstation:
    ansible-playbook -i inventory.ini workstation.yml --ask-become-pass

# Validate workstation playbook syntax
check:
    ansible-playbook -i inventory.ini workstation.yml --syntax-check
    ansible-playbook -i inventory.ini opencode.yml --syntax-check

# Configure OpenCode web server (prompts for sudo and server passwords)
configure-opencode:
    ansible-playbook -i inventory.ini opencode.yml --ask-become-pass
