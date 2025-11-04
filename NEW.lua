local SpawnPart = {}
SpawnPart.__index = SpawnPart

function SpawnPart.new(position)
	local self = setmetatable({}, SpawnPart)
	local part = Instance.new("Part")
	part.Anchored = true
	part.Size = Vector3.new(4,1,4)
	part.Position = position or Vector3.new(0,5,0)
	part.Parent = workspace
	self.Part = part
	return self
end

function SpawnPart:SpawnAllPlayers()
	for _,player in ipairs(game.Players:GetPlayers()) do
		local char = player.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			char:MoveTo(self.Part.Position)
		end
	end
end

return SpawnPart
