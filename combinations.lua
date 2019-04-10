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

	return res;
	
end

function combinations.scan(map)

	res = false
	
	for i = 0, map.n do
		for j = 0, map.m do	
			if map[i][j] ~= 0
			then
				for k = 0, #vars do
					if vars[k].checkfunc(map, j, i) == true
					then
						res = true
					end
				end
			end
		end	
	end

	return res;
	
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



-- Variants of combinations

vars = {}
vars[0] = {}
vars[0].name = "lineH"
vars[0].checkfunc = checkLineH
vars[0].desfunc = destroyLineH
vars[0].score = 1

vars[1] = {}
vars[1].name = "lineV"
vars[1].checkfunc = checkLineV
vars[1].desfunc = destroyLineV
vars[1].score = 1