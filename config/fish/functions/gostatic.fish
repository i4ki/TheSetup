

function gostatic
	 env CGO_ENABLED=0 go build -v -a -ldflags '-s' .
end