--Main game module

require "logic"

--_HELPERS

function clearScreen()

	os.execute("cls")
	--os.execute("clear")

end

function sleep(ms) 
    local b = os.clock() * 1000 
    while os.clock() * 1000 - b <= ms do end 
end


local running = true
local score = 0

logic.init()
clearScreen()

while running do

	logic.dump()
	while logic.tick() == true do
		--logic.tick()
		clearScreen()
		logic.dump()
		sleep(160)
	end
	
	local cmd = io.read()
	
	if cmd == "q"
	then 
		running = false
	else
		for x, y, dir in cmd:gmatch("[m]%s+(%d+)%s+(%d+)%s+([lrud])") do
			logic.move(tonumber(x), tonumber(y), dir)
		end
	end
	
	clearScreen()
	
end

--print(score)
print("Goodbye")
