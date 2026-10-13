# Fase 1: Base, firewall e rede isolada

## Objetivo

Preparar o notebook para o laboratório: firewall ativo, Docker instalado e dois alvos vulneráveis rodando em uma rede isolada, sem exposição para a rede da casa.

## Decisões

- **Containers em vez de máquinas virtuais:** com 6 GB de RAM, uma VM de Ubuntu consumiria mais de 1 GB. Os dois containers usam juntos menos de 500 MB (limites definidos com `mem_limit`).
- **Rede com nome fixo (`br-lab`) e IPs fixos:** facilita apontar o IDS para a interface certa na Fase 3 e escrever buscas no SIEM.
- **Alvos escolhidos:**
  - `vitima-ssh`: servidor SSH com senha fraca, alvo de brute force.
  - `juice-shop`: aplicação web vulnerável mantida pela OWASP, alvo de ataques web.
- <!-- Acrescente outras decisões que tomar durante a instalação -->

## Passos

<!-- Liste os comandos principais com uma linha explicando cada um. -->

## Verificação

<!-- Cole aqui as saídas que comprovam que tudo funcionou e insira os prints:
![Containers rodando](../assets/fase1-docker-ps.png)
-->

## Segurança

- Firewall `ufw` com política padrão de **bloquear conexões de entrada**.
- **Nenhuma porta publicada** pelos containers. O Docker cria regras próprias de firewall e ignora o `ufw` para portas publicadas; sem publicação, os alvos só são acessíveis a partir do notebook.
- Senha da vítima guardada em `.env`, fora do repositório.
- Containers sem reinício automático: só ficam ligados durante o estudo.
- <!-- Observação sobre o grupo docker: anote aqui o que aprendeu -->

## Problemas encontrados

| Problema | Como investiguei | Solução |
|---|---|---|
| | | |
