--Main game module

require "logic"
running = true;

os.execute("cls")
--os.execute("clear")

while running do

	print("tick")
	if tick() == true
	then
		dump()
	else
		local a = io.read()
		print(a)
		
		if a == "q"
		then 
			running = false
		end
		
		os.execute("cls")
		--os.execute("clear")
	end
	
end

--print(score)
print("Goodbye")