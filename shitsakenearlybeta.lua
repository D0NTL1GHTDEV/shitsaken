-- shitsaken v1 0% paste
local Players = cloneref(game:GetService("Players"))
local RunService = cloneref(game:GetService("RunService"))
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local globals = {
	misc = {
		infstam = false,
		customfov = 70
	}
}

-- UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/D0NTL1GHTDEV/shitsaken/refs/heads/main/UILIB.lua"))()

local Window = Library:Window("shitsaken | early beta", Color3.fromRGB(180, 180, 255), Enum.KeyCode.Delete)

local Tabs = {
	Misc = Window:Tab("Misc"),
	LocalPlayer = Window:Tab("LocalPlayer"),
	["UI Settings"] = Window:Tab("UI Settings")
}

-- Misc
Tabs.Misc:Toggle("Infinite Stamina", false, function(v)
	globals.misc.infstam = v
end)
Tabs.Misc:Slider("Custom Field Of View", 0, 120, 70, function(v)
	globals.misc.customfov = v
end)

-- LocalPlayer
Tabs.LocalPlayer:Slider("Custom JumpPower", 0, 200, 0, function(v)
	LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = v
end)

-- UI Settings
Tabs["UI Settings"]:Colorpicker("UI Color", Color3.fromRGB(180, 180, 255), function(v)
	Library:ChangePresetColor(Color3.fromRGB(v.R * 255, v.G* 255, v.B * 255))
end)

-- Main Code

RunService.Heartbeat:Connect(function()
	LocalPlayer.PlayerData.Settings.Game.FieldOfView.Value = globals.misc.customfov

	if globals.misc.infstam then
		local stammodule = require(ReplicatedStorage.Systems.Character.Game.Sprinting)

		stammodule.Stamina = stammodule.MaxStamina
	end
end)
