local SpawnPart = {}
SpawnPart.__index = SpawnPart

function SpawnPart.new(player)
	local self = setmetatable({}, SpawnPart)
	local part = Instance.new("Part")
	part.Anchored = true
	part.Size = Vector3.new(4,1,4)
	part.Color = Color3.fromRGB(0,255,0)
	part.Name = player.Name .. "_SpawnPart"
	part.Parent = workspace
	self.Part = part
	self.Player = player
	return self
end

function SpawnPart:FollowTorso()
	local RunService = game:GetService("RunService")
	local player = self.Player
	local part = self.Part
	RunService.Heartbeat:Connect(function()
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if hrp then
			part.Position = hrp.Position
		end
	end)
end

return SpawnPart
