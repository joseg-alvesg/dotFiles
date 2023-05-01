alias rain="curl http://wttr.in/\?lang=pt-br"

function rainf
	curl http://wttr.in/$argv\?lang=pt-br
end

function raini
	curl http://wttr.in/previsao.png\?lang=pt-br --output previsao.png
end
