alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dps="docker ps"

function dexb
	docker exec -it $argv bash
end
