-- Combinations

combinations = {}

function combinations.check(map)

	res = false
	
	for i = 0, map.n do
		for j = 0, map.m do	
			for k = 0, #vars do
				if vars[k].checkfunc(map, j, i) == true
				then
					vars[k].desfunc(map, j, i)
					res = true
				end
			end
		end	
	end

	return res;
	
end

-- Line (horizontal)

function checkLine(map, x, y)

	if x < map.m then
		if map[y][x] == map[y][x+1] then
			return true
		end
	end
	return false

end

function destroyLine(map, x, y)

	map[y][x] = 0
	map[y][x + 1] = 0
	
end



-- Variants of combinations

vars = {}
vars[0] = {}
vars[0].name = "line"
vars[0].checkfunc = checkLine
vars[0].desfunc = destroyLine
vars[0].score = 1