-- Combinations

combinations = {}

function combinations.check(map)

	res = false
	
	for i = 0, map.n do
		for j = 0, map.m do	
			if map[i][j] ~= 0
			then
				for k = 0, #vars do
					if vars[k].checkfunc(map, j, i) == true
					then
						vars[k].desfunc(map, j, i)
						res = true
					end
				end
			end
		end	
	end

	return res
	
end

function combinations.scan(map)
	
	for i = 0, map.n do
		for j = 0, map.m do	
			if map[i][j] ~= 0
			then
				for k = 0, #vars do
					if vars[k].scanfunc(map, j, i) == true
					then
						return true
					end
				end
			end
		end	
	end

	return false
	
end

-- Line (horizontal)

function checkLineH(map, x, y)

	local coincs = 0
	local gem = map[y][x]
	for i = x+1, map.m do
		if map[y][i] == gem
		then
			coincs = coincs + 1
		else
			break
		end
	end
	
	if coincs >= 2
	then
		return true
	end
	
	return false

end

function destroyLineH(map, x, y)

	local gem = map[y][x]
	local i = x
	
	while i <= map.m and map[y][i] == gem do
		map[y][i] = 0
		i = i + 1
	end
	
end

function scanLineH(map, x, y)

	local coincs = 0
	local gems = {}
	if x > 0 
	then
		gems[#gems] = map[y][x - 1]
	end
	if x < map.m 
	then
		gems[#gems] = map[y][x + 1]
	end
	if y > 0 
	then
		gems[#gems] = map[y - 1][x]
	end
	if y < map.n 
	then
		gems[#gems] = map[y + 1][x]
	end
	
	for g = 0, #gems do
	
		coincs = 0
		for i = x+1, map.m do
			if map[y][i] == gems[g]
			then
				coincs = coincs + 1
			else
				break
			end
		end
		for i = x-1, 0, -1 do
			if map[y][i] == gems[g]
			then
				coincs = coincs + 1
			else
				break
			end
		end
		
		if coincs >= 3
		then
			return true
		end
		
	end
	
	return false
	
end

-- Line (vertical)

function checkLineV(map, x, y)

	local coincs = 0
	local gem = map[y][x]
	for i = y+1, map.n do
		if map[i][x] == gem
		then
			coincs = coincs + 1
		else
			break
		end
	end
	
	if coincs >= 2
	then
		return true
	end
	
	return false

end

function destroyLineV(map, x, y)

	local gem = map[y][x]
	local i = y
	
	while i <= map.n and map[i][x] == gem do
		map[i][x] = 0
		i = i + 1
	end
	
end

function scanLineV(map, x, y)

	local coincs = 0
	local gems = {}
	if x > 0 
	then
		gems[#gems] = map[y][x - 1]
	end
	if x < map.m 
	then
		gems[#gems] = map[y][x + 1]
	end
	if y > 0 
	then
		gems[#gems] = map[y - 1][x]
	end
	if y < map.n 
	then
		gems[#gems] = map[y + 1][x]
	end
	
	for g = 0, #gems do
	
		coincs = 0
		for i = y+1, map.n do
			if map[i][x] == gems[g]
			then
				coincs = coincs + 1
			else
				break
			end
		end
		for i = y-1, 0, -1 do
			if map[i][x] == gems[g]
			then
				coincs = coincs + 1
			else
				break
			end
		end
		
		if coincs >= 3
		then
			return true
		end
		
	end
	
	return false
	
end



-- Variants of combinations

vars = {}
vars[0] = {}
vars[0].name = "lineH"
vars[0].checkfunc = checkLineH
vars[0].desfunc = destroyLineH
vars[0].scanfunc = scanLineH
vars[0].score = 1

vars[1] = {}
vars[1].name = "lineV"
vars[1].checkfunc = checkLineV
vars[1].desfunc = destroyLineV
vars[1].scanfunc = scanLineV
vars[1].score = 1