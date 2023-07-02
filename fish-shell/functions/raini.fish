function raini --description 'Weather forecast for the next 3 days'
	curl http://wttr.in/previsao.png\?lang=pt-br --output previsao.png
end
