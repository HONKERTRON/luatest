--Field visualisation

local symbols = {}

symbols[0] = "*"
for i = 1, 6 do
	symbols[i] = string.char(string.byte("A") + i - 1)
end

function drawField(map)

	local str = ""
	
	for i = 0, map.n do
		str = str.."-"
	end
	io.write("+"..str.."\n")
	str = ""
	
	for i = 0, map.n do
	
		for j = 0, map.m do
			str = str..string.format(symbols[map[i][j]])
		end
		
		io.write("|"..str.."\n")
		str = ""
	end

end