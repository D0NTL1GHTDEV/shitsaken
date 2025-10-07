-- shitsaken v1.5 (BETA)

local rs = game:GetService("RunService")
local players = game:GetService("Players")

local localplayer = players.LocalPlayer

local cheatvars = {
	combat = {
		he = false,
		size = 5,
		transparency = 0.5
	},
	misc = {
		infstam = false,
		fov = 70
	}
}

-- ui code

local repo = 'https://raw.githubusercontent.com/D0NTL1GHTDEV/shitsaken/refs/heads/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'SaveManager.lua'))()

local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()

local Window = Library:CreateWindow({
	Title = "Shitsaken | Version: 1.5",
	Center = true,
	AutoShow = true,
	TabPadding = 8,
	MenuFadeTime = 0.2
})

local Tabs = {
	Combat = Window:AddTab("Combat"),
	Visuals = Window:AddTab("Visuals"),
	Misc = Window:AddTab("Miscellaneous"),
	['UI Settings'] = Window:AddTab("UI Settings")
}

local GroupBoxes = {
	CombatHEGB = Tabs.Combat:AddLeftGroupbox("Hitbox Expander"),
	VisualsMainGB = Tabs.Visuals:AddLeftGroupbox("ESP Settings"),
	VisualsESPGB = Tabs.Visuals:AddLeftGroupbox("ESP"),
	VisualsChamsGB = Tabs.Visuals:AddRightGroupbox("Chams"),
	MiscLocalplayerGB = Tabs.Misc:AddLeftGroupbox("Localplayer"),
	MiscOtherGB = Tabs.Misc:AddRightGroupbox("Other")
}

-- Combat (WIP)

GroupBoxes.CombatHEGB:AddLabel("Coming Soon...")

-- Visuals

GroupBoxes.VisualsMainGB:AddToggle("espenabled", {
	Text = "Enable ESP",
	Default = false,
	
	Callback = function(v)
		Sense.teamSettings.enemy.enabled = v
		Sense.teamSettings.friendly.enabled = v
	end
})
GroupBoxes.VisualsMainGB:AddSlider("espmaxdistance", {
	Text = "Max Distance",
	Default = 200,
	Min = 100,
	Max = 500,
	Rounding = 0,
	Compact = false,

	Callback = function(v)
		Sense.sharedSettings.maxDistance = v
	end
})
GroupBoxes.VisualsMainGB:AddSlider("esptextsize", {
	Text = "Text Size",
	Default = 13,
	Min = 10,
	Max = 20,
	Rounding = 0,
	Compact = false,

	Callback = function(v)
		Sense.sharedSettings.textSize = v
	end
})
GroupBoxes.VisualsESPGB:AddToggle("espnameenabled", {
	Text = "Name",
	Default = false,

	Callback = function (v)
		Sense.teamSettings.enemy.name = v
		Sense.teamSettings.friendly.name = v
	end
}):AddColorPicker("espnamecolor", {
	Default = Color3.new(1, 1, 1),

	Callback = function (v)
		Sense.teamSettings.enemy.nameColor[1] = v
		Sense.teamSettings.friendly.nameColor[1] = v
	end
})
GroupBoxes.VisualsESPGB:AddToggle("espboxenabled", {
	Text = "Box",
	Default = false,

	Callback = function (v)
		Sense.teamSettings.enemy.box = v
		Sense.teamSettings.friendly.box = v
	end
}):AddColorPicker("espboxcolor", {
	Default = Color3.new(1, 1, 1),

	Callback = function (v)
		Sense.teamSettings.enemy.boxColor[1] = v
		Sense.teamSettings.friendly.boxColor[1] = v
	end
})
GroupBoxes.VisualsESPGB:AddToggle("espboxfillenabled", {
	Text = "Box Fill",
	Default = false,

	Callback = function (v)
		Sense.teamSettings.enemy.boxFill = v
		Sense.teamSettings.friendly.boxFill = v
	end
}):AddColorPicker("espboxfillcolor", {
	Default = Color3.new(1, 1, 1),

	Callback = function (v)
		Sense.teamSettings.enemy.boxFillColor[1] = v
		Sense.teamSettings.friendly.boxFillColor[1] = v
	end
})
GroupBoxes.VisualsESPGB:AddToggle("esphealthbarenabled", {
	Text = "Health Bar",
	Default = false,

	Callback = function (v)
		Sense.teamSettings.enemy.healthBar = v
		Sense.teamSettings.friendly.healthBar = v
	end
}):AddColorPicker("esphealthbarcolor1", {
	Default = Color3.new(0, 1, 0),

	Callback = function (v)
		Sense.teamSettings.enemy.healthyColor = v
		Sense.teamSettings.friendly.healthyColor = v
	end
}):AddColorPicker("esphealthbarcolor2", {
	Default = Color3.new(1, 0, 0),

	Callback = function (v)
		Sense.teamSettings.enemy.dyingColor = v
		Sense.teamSettings.friendly.dyingColor = v
	end
})
GroupBoxes.VisualsESPGB:AddToggle("esphealthtextenabled", {
	Text = "Health Text",
	Default = false,

	Callback = function (v)
		Sense.teamSettings.enemy.healthText = v
		Sense.teamSettings.friendly.healthText = v
	end
}):AddColorPicker("esphealthtextcolor", {
	Default = Color3.new(1, 1, 1),

	Callback = function (v)
		Sense.teamSettings.enemy.healthTextColor[1] = v
		Sense.teamSettings.friendly.healthTextColor[1] = v
	end
})
GroupBoxes.VisualsESPGB:AddToggle("espdistanceenabled", {
	Text = "Distance",
	Default = false,

	Callback = function (v)
		Sense.teamSettings.enemy.distance = v
		Sense.teamSettings.friendly.distance = v
	end
}):AddColorPicker("espdistancecolor", {
	Default = Color3.new(1, 1, 1),

	Callback = function (v)
		Sense.teamSettings.enemy.distanceColor[1] = v
		Sense.teamSettings.friendly.distanceColor[1] = v
	end
})
GroupBoxes.VisualsChamsGB:AddToggle("chamsenabled", {
	Text = "Chams",
	Default = false,

	Callback = function (v)
		Sense.teamSettings.enemy.chams = v
		Sense.teamSettings.friendly.chams = v
	end
}):AddColorPicker("chamsfillcolor", {
	Default = Color3.new(0.2, 0.2, 0.2),

	Callback = function (v)
		Sense.teamSettings.enemy.chamsFillColor[1] = v
		Sense.teamSettings.friendly.chamsFillColor[1] = v
	end
}):AddColorPicker("chamsoutlinecolor", {
	Default = Color3.new(1, 0, 0),

	Callback = function (v)
		Sense.teamSettings.enemy.chamsOutlineColor[1] = v
		Sense.teamSettings.friendly.chamsOutlineColor[1] = v
	end
})
GroupBoxes.VisualsChamsGB:AddToggle("chamsvisibleonlyenabled", {
	Text = "Chams Visible Only",
	Default = false,

	Callback = function (v)
		Sense.teamSettings.enemy.chamsVisibleOnly = v
		Sense.teamSettings.friendly.chamsVisibleOnly = v
	end
})

-- Misc

GroupBoxes.MiscOtherGB:AddToggle("infstam", {
	Text = "Infinite Stamina",

	Callback = function (v)
		cheatvars.misc.infstam = v
	end
})
GroupBoxes.MiscOtherGB:AddSlider("fovchanger", {
	Text = "Fov Changer",
	Default = 70,
	Min = 60,
	Max = 120,
	Rounding = 0,

	Callback = function(v)
		localplayer.PlayerData.Settings.Game.FieldOfView.Value = v
	end
})
GroupBoxes.MiscLocalplayerGB:AddSlider("walkspeed", {
	Text = "Walk Speed",
	Default = 16,
	Min = 16,
	Max = 100,
	Rounding = 0,

	Callback = function(v)
		localplayer.Character.Humanoid:SetAttribute("BaseSpeed", v)
	end
})
GroupBoxes.MiscLocalplayerGB:AddSlider("jumppower", {
	Text = "Jump Power",
	Default = 0,
	Min = 0,
	Max = 200,
	Rounding = 0,

	Callback = function(v)
		localplayer.Character.Humanoid.JumpPower = v
		localplayer.Character.Humanoid.UseJumpPower = true
	end
})

-- Watermark

Library:SetWatermarkVisibility(true)

local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 0;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('Shitsaken | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

Library:OnUnload(function()
	WatermarkConnection:Disconnect()
	MainConnection:Disconnect()

	Sense.Unload()
	Library.Unloaded = true
end)

-- UI Settings

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'Delete', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('shitsaken')
SaveManager:SetFolder('shitsaken/forsaken')

SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()

-- main code

MainConnection = rs.RenderStepped:Connect(function()
	if cheatvars.misc.infstam then
		local stam = require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting)

		stam.Stamina = stam.MaxStamina
	end
end)

Sense.Load()
