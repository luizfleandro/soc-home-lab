# Fase 2: SIEM (Splunk Free)

## Objetivo

Instalar um SIEM no notebook e fazer ele receber os logs de autenticação da `vitima-ssh`, para investigar tentativas de login com buscas em SPL.

## Decisões

- **Splunk Free em vez de Wazuh:** a implantação do Wazuh em Docker exige no mínimo 8 GB de RAM; o notebook tem 6 GB. O Splunk também é o SIEM mais citado em vagas de SOC.
- **Licença Free:** até 500 MB de dados por dia, muito acima do que o lab gera.
- **Instalado direto no Mint (não em container):** <!-- explique com suas palavras -->
- **Executado pelo usuário `splunk`, não como root:** <!-- explique: menor privilégio -->
- <!-- outras decisões -->

## Passos

<!-- Comandos principais, cada um com uma linha explicando o que faz. -->

## Verificação

<!--
![Portas só em localhost](../assets/fase2-portas-localhost.png)
![Primeira busca](../assets/fase2-busca-failed-password.png)
![Contagem por IP](../assets/fase2-stats-por-ip.png)
![Uso de memória](../assets/fase2-memoria.png)
-->

## Segurança

- **Sem login na licença Free:** qualquer pessoa que alcance a interface vira administrador. Por isso o Splunk escuta só em `127.0.0.1` (configs em `configs/splunk/`).
- **Defesa em camadas:** além do bind em localhost, o `ufw` bloqueia conexões de entrada.
- **Menor privilégio no acesso aos logs:** em vez de rodar o Splunk como root, o usuário `splunk` recebeu permissão só de leitura na pasta de logs, usando ACLs (`setfacl`).
- <!-- outras observações -->

## Observações da investigação

<!-- Ex.: por que o IP de origem dos logins aparece como 172.30.0.1? -->

## Problemas encontrados

| Problema | Como investiguei | Solução |
|---|---|---|
| | | |
