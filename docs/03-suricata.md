# Phase 3: IDS (Suricata)

## Goal

Add a network IDS that watches the `br-lab` traffic, detects attacks (port scans, SSH brute force, web attacks) and sends its alerts to Splunk, so detection happens at the network layer as well.

## Decisions

- **Suricata instead of Snort:** Suricata is multi-threaded, outputs structured JSON (`eve.json`) that Splunk ingests easily, and uses the same Emerging Threats rules.
- **IDS mode, not IPS:** Suricata only watches and alerts; it does not block. Matches the lab goal of practicing detection, and avoids cutting the lab's own traffic.
- **Listens on `br-lab`:** the fixed interface name defined in Phase 1 makes this stable.
- **`HOME_NET = 172.30.0.0/24`:** tells Suricata which network is "ours" to protect.

## Steps

<!-- Main commands, each with one line explaining what it does. -->

## Verification

<!--
![Suricata engine started](../assets/phase3-engine-started.png)
![Test alert in fast.log](../assets/phase3-test-alert.png)
![Scan detected](../assets/phase3-nmap-alert.png)
![Alerts in Splunk](../assets/phase3-splunk-alerts.png)
-->

## Security / notes

- Suricata reads a copy of the traffic; it does not sit in-line, so a failure does not break the lab network.
- Custom rules use local SIDs starting at 1000000, the range reserved for user rules.

## Issues found

| Issue | How I investigated | Fix |
|---|---|---|
| | | |
