# Phase 2: SIEM (Splunk Free)

## Goal

Install a SIEM on the laptop and ingest the authentication logs from `vitima-ssh`, so login attempts can be investigated with SPL searches.

## Decisions

- **Splunk Free instead of Wazuh:** the Wazuh Docker deployment requires at least 8 GB of RAM; the laptop has 6 GB. Splunk is also the SIEM most often listed in SOC job postings.
- **Free license:** up to 500 MB of data per day, far above what the lab generates.
- **Runs as the `splunk` user, not as root:** least privilege. Since version 10.2, Splunk no longer runs as root by default.

## Steps

<!-- Main commands, each with one line explaining what it does. -->

## Verification

<!--
![Ports before the change](../assets/phase2-ports-before.png)
![Ports bound to localhost](../assets/phase2-ports-localhost.png)
![First search](../assets/phase2-failed-password-search.png)
![Count by source IP](../assets/phase2-stats-by-ip.png)
![Memory usage](../assets/phase2-memory.png)
-->

## Security

- **No login on the Free license:** anyone who can reach the web interface becomes an administrator. That is why Splunk only listens on `127.0.0.1` (configs in `configs/splunk/`).
- **Defense in depth:** besides binding to localhost, `ufw` blocks incoming connections.
- **Least privilege for log access:** instead of running Splunk as root, the `splunk` user was granted read-only access to the log folder only, using ACLs (`setfacl`).
- **Package integrity:** the installer was checked against the official SHA512 hash.

## Investigation notes

- **Why does the source IP show as 172.30.0.1?** The laptop has one IP address per network interface. When connecting to the target, the system uses the `br-lab` interface, which is on the same network, so the source IP logged is 172.30.0.1 rather than the Wi-Fi address. Lesson: the IP in a log reflects the last hop the server saw, not necessarily the real origin (NAT, proxies, CDNs).
- **Wrong `host` field:** Splunk filled `host` with the laptop name, because it reads the log file from the laptop's disk. Fixed by setting a constant host value (`vitima-ssh`) on the input.

## Issues found

| Issue | How I investigated | Fix |
|---|---|---|
| | | |
