#!/usr/bin/env sh
systemctl enable --now greetd.service
systemctl enable --now NetworkManager.service
systemctl enable --now rustdesk.service
systemctl enable --now sshd.service
systemctl enable --now tailscaled.service
