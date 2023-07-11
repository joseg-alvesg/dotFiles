function _trybe-publisher
    git for-each-ref --format='%(refname:strip=2)' refs/heads/ refs/remotes/ 2>/dev/null \
    | sed -r 's/(origin\/)(.*)/\2/'
end

complete --command trybe-publisher --exclusive
complete --command trybe-publisher --exclusive --short-option b --description "nome da sua branch" --arguments "(_trybe-publisher)"
complete --command trybe-publisher --exclusive --short-option p --description "nome do novo repositório"
complete --command trybe-publisher --exclusive --short-option d --description "descrição do projeto"
complete --command trybe-publisher --exclusive --short-option r --description "nome do novo remote"
complete --command trybe-publisher --exclusive --short-option h --description "ajuda"
complete --command trybe-publisher --exclusive --long-option private --description "definir repositório como privado"
complete --command trybe-publisher --exclusive --long-option custom-readme --description "utilizar o README customizado"
