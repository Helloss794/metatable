local module = {}
module.__index = module

function module.new()
	local module2 = {}
	setmetatable(module2, module)


	return module2
end

function module:DoThing(text: string)
	print(string)
end

return module
