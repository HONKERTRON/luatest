--Field visualisation

local symbols = {}

symbols[0] = "*"
for i = 1, 6 do
	symbols[i] = string.char(string.byte("A") + i - 1)
end

function drawField(map)

	local str = ""
	
	io.write(" ")
	for i = 0, 2*map.n+1 do
		if i % 2 == 1
		then
			io.write((i-1) / 2)
		else
			io.write(" ")
		end
	end
	io.write("\n")
	
	for i = 0, 2*map.n do
		str = str.."-"
	end
	io.write(" +"..str.."\n")
	str = ""
	
	for i = 0, 2*map.n do
		
		if i % 2 == 0
		then
			for j = 0, map.m do
				str = str..string.format(symbols[map[i/2][j]]).." "
			end
			io.write(i / 2)
			io.write("|"..str.."\n")
			str = ""
		else
			io.write(" |\n")
		end
		
	end

end