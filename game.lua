--Main game module

require "logic"

local running = true;


function clearScreen()

	os.execute("cls")
	--os.execute("clear")

end

function sleep(ms) 
    local b = os.clock() * 1000 
    while os.clock() * 1000 - b <= ms do end 
end


init()
clearScreen()

while running do

	dump()
	while tick() == true do
		tick()
		clearScreen()
		dump()
		sleep(80)
	end
	
	local cmd = io.read()
	
	if cmd == "q"
	then 
		running = false
	else
		for x, y, dir in cmd:gmatch("[m]%s+(%d+)%s+(%d+)%s+([lrud])") do
			move(tonumber(x), tonumber(y), dir)
		end
	end
	
	clearScreen()
	
end

--print(score)
print("Goodbye")