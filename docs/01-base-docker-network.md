# Phase 1: Base setup, firewall and isolated network

## Goal

Prepare the laptop for the lab: firewall enabled, Docker installed, and two intentionally vulnerable targets running on an isolated network that is not exposed to the home network.

## Decisions

- **Containers instead of virtual machines:** with 6 GB of RAM, an Ubuntu VM would use more than 1 GB. Both containers together use less than 500 MB (enforced with `mem_limit`).
- **Fixed network name (`br-lab`) and fixed IPs:** makes it easy to point the IDS at the right interface in Phase 3 and to write SIEM searches.
- **Targets:**
  - `vitima-ssh`: SSH server with a weak password, used as a brute force target.
  - `juice-shop`: intentionally vulnerable web application maintained by OWASP, used for web attacks.

## Steps

<!-- Main commands, each with one line explaining what it does. -->

## Verification

<!-- Command output and screenshots that prove everything works.
![Containers running](../assets/phase1-docker-ps.png)
-->

## Security

- `ufw` firewall with a default policy of **deny incoming**.
- **No published ports** on the containers. Docker creates its own firewall rules and bypasses `ufw` for published ports; without them, the targets are only reachable from the laptop.
- Target password stored in `.env`, outside the repository (`git check-ignore` confirms it).
- Containers do not restart automatically: they only run during study sessions.
- Members of the `docker` group effectively have root privileges. Acceptable on a dedicated lab laptop, but a risk on a production server.

## Issues found

| Issue | How I investigated | Fix |
|---|---|---|
| | | |
