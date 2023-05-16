local spawns = script.Parent
local zombies = game.Workspace.Zombies

local spawn_time = math.random(15, 60)
local max_zombies = 15

local wave = 0

local health = 100

while true do
	game.Workspace.Zombie.Head.BillboardGui.TextLabel.Text = 'wave: '..wave
	wait(spawn_time)
	if #zombies:GetChildren() < max_zombies then
		spawns.wave_sound:Play()
		wave += 1
		for _, spwn in pairs(spawns:GetChildren()) do
			if spwn:IsA('BasePart') then
				spwn.PointLight.Brightness = 50
				wait(0.75)
				spwn.PointLight.Brightness = 0
				local zombieCopy = game.ReplicatedStorage['Zombie']:Clone()
				zombieCopy.Parent = zombies
				zombieCopy.HumanoidRootPart.CFrame = CFrame.new(spwn.Position + Vector3.new(0,3,0))
				zombieCopy.Humanoid.Health = health
			end
		end
		health += 100
	end
end