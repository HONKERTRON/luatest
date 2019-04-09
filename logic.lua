--Main game ticker

require "graphics"

local map = {}
--height
map.n = 0
--width
map.m = 0

function init()
	
	local file = io.open("config.ini", "r")
	if file
	then
		map.n = tonumber(file:read("*l"))
		map.m = tonumber(file:read("*l"))
		
		if map.n and map.m
		then
			map.n = map.n - 1
			map.m = map.m - 1
			for i = 0, map.n do
				map[i] = {}
				for j = 0, map.m do
					map[i][j] = 0
				end
			end
			for i = 0, 1 do
				generateLine()
			end
		else
			map.n = 0
			map.m = 0
			map[0] = {}
			map[0][0] = 0
		end
		
		file:close()
	end
	
end

function gravity()

	local res = false
	for i = 0, map.n-1 do
	
		for j = 0, map.m do
			if map[i][j] ~= 0 and map[i+1][j] == 0
			then
				res = true
				map[i+1][j] = map[i][j]
				map[i][j] = 0
			end
		end
	
	end
	
	return res
end

function generateLine()

	for i = 0, map.m do
		if map[0][i] == 0
		then
			map[0][i] = math.random(6)
		end
	end

end

function tick()

	local changes = false
	
	changes = gravity()
	if changes
	then
		generateLine()
	end
	
	return changes

end

function mix()

end

function move(x, y, dir)
	if x >= 0 and y >= 0 and x <= map.m and y <= map.n then
		if dir == "u" and y > 0 then
			map[y][x], map[y-1][x] = map[y-1][x], map[y][x] 
		elseif dir == "d" and y < map.n then
			map[y][x], map[y+1][x] = map[y+1][x], map[y][x] 
		elseif dir == "r" and x < map.m then
			map[y][x], map[y][x+1] = map[y][x+1], map[y][x] 
		elseif dir == "l" and x > 0 then
			map[y][x], map[y][x-1] = map[y][x-1], map[y][x] 
		end
	end
end

function dump()
	
	drawField(map)
	
end