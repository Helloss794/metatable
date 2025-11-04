--// ModuleScript: SpawnPartModule
local SpawnPart = {}
SpawnPart.__index = SpawnPart

-- Constructor
function SpawnPart.new(position, color)
	local self = setmetatable({}, SpawnPart)

	-- Create the actual part
	local part = Instance.new("Part")
	part.Name = "SpawnPart"
	part.Anchored = true
	part.Size = Vector3.new(4, 1, 4)
	part.Position = position or Vector3.new(0, 5, 0)
	part.Color = color or Color3.fromRGB(0, 255, 0)
	part.Parent = workspace

	self.Part = part
	return self
end

-- Custom method: change color
function SpawnPart:SetColor(newColor)
	if self.Part then
		self.Part.Color = newColor
	end
end

-- Custom method: teleport player to this spawn
function SpawnPart:SpawnPlayer(player)
	if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		player.Character:MoveTo(self.Part.Position + Vector3.new(0, 3, 0))
	end
end

return SpawnPart
