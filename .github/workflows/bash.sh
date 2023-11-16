#!/bin/bash

# Substitua 'seu_owner', 'seu_repo' e 'seu_token' pelos valores apropriados
owner='iamabrantes'
repo='resume'
token='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'

# URL da API para obter as variáveis do repositório
url="https://api.github.com/repos/${owner}/${repo}/actions/secrets"

# Fazendo a requisição GET para a API usando curl
response=$(curl -s -H "Authorization: Bearer ${token}" -H "Accept: application/vnd.github.v3+json" "${url}")

# Verifica se a requisição foi bem-sucedida (código 200)
if [ $? -eq 0 ]; then
    # Imprime as variáveis do repositório
    echo "Variáveis do Repositório:"
    echo "${response}" | jq -r '.secrets[].name'
else
    # Imprime uma mensagem de erro se a requisição falhar
    echo "Falha ao obter as variáveis. Código de status: $?"
fi
