task.wait(2)
local a = game:GetService("CoreGui")
a.ChildAdded:Connect(function(a)
	wait()
	local b = a.Name;
	if a.Name == "a" then
		return
	else
		a.Name = "a"
		a.Parent = game.Workspace;
		local c = Instance.new("ScreenGui")
		local d = Instance.new("Frame")
		c.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		c.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
		d.Parent = c;
		d.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		d.Position = UDim2.new(-100000, -100000, -100000, 0)
		d.Size = UDim2.new(0, 100, 0, 100)
		a.Parent = c;
		wait(1)
		a.Name = b;
		game.Players.LocalPlayer.CharacterRemoving:Connect(function()
			c.Parent = game.Workspace
		end)
		game.Players.LocalPlayer.CharacterAdded:Connect(function()
			c.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		end)
	end
end)
local a = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local a = a.CreateLib("RADEON.OP (FREE)", "Ocean")
local b = a:NewTab("Player")
local b = b:NewSection("Player")
b:NewSlider("Speed", "Customise your walk speed", 50, 0, function(a)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a
end)
b:NewSlider("JumpPower", "Customise your jump power", 150, 0, function(a)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = a
end)
b:NewButton("Reset Speed and JumpPower", "click to reset speed and jump to default", function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16;
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)
local c = a:NewTab("Silent Aim + HBE")
local d = c:NewSection("Silent Aim")
d:NewButton("Discrete Silent Aim", "Press to activate Descrete Silent Aim", function()
	local a;
	a = hookfunction(getrenv().task.spawn, newcclosure(function(...)
		if tostring(getcallingscript()):find("") then
			return
		end;
		return a(...)
	end))
	local a = {}
	local b = game;
	local c = workspace;
	local d = b.FindFirstChild;
	local e = b.FindFirstChildWhichIsA;
	local f = c.FindPartOnRayWithIgnoreList;
	local f = b:GetService("Players")
	local g = f.GetPlayers;
	local h = f.LocalPlayer;
	local i = b:GetService("UserInputService")
	local j = i.GetMouseLocation;
	local k = c.CurrentCamera;
	local l = k.WorldToViewportPoint;
	local m = Vector2.new;
	local function n(a)
		local a, b = l(k, a)
		return m(a.X, a.Y), b, a.Z
	end;
	local k;
	local l;
	local function m(a)
		return d(c, a.Name)
	end;
	local c = c.Lobby.VoteStation.pad3.Position;
	table.insert(a, b:GetService("RunService").Stepped:Connect(function()
		l = math.huge;
		local a = j(i)
		for b, b in next, g(f) do
			if typeof(b) == "Instance" and b ~= h then
				local f = m(b)
				local d = f and d(f, "HumanoidRootPart")
				if typeof(d) == "Instance" then
					if e(f, "ForceField") then
						continue
					end;
					local c = (c - d.Position).Magnitude;
					if c > 300 then
						if k then
							local c = n(d.Position)
							local a = (a - c).Magnitude;
							if a < l then
								l = a;
								k = b
							end
						else
							k = b
						end
					end
				end
			end
		end
	end))
	local a;
	a = hookmetamethod(b, "__namecall", function(c, ...)
		local d = {
			...
		}
		if not checkcaller() and getnamecallmethod() == "FireServer" and c == b.ReplicatedStorage.Remotes.ThrowKnife then
			local e = b.Workspace.CurrentCamera.CFrame.Position;
			local b = b.Workspace[k.Name].Torso.Position;
			d[1] = b;
			return a(c, unpack(d))
		end;
		return a(c, ...)
	end)
end)
local d = a:NewTab("Misc")
local e = d:NewSection("Misc")
e:NewButton("Inv Calculator", "Calculate your Assassin Invetory (Tier 1 Exotics)", function()
	loadstring(game:HttpGet"https://raw.githubusercontent.com/RadeonScripts/Assassin-Knife-Calculator/main/Radeon%20Knife%20Calc")()
end)
e:NewButton("Trade Crash Script", "Click when other psn has accepted! (MUST HAVE KEY)", function()
	local a = {}
	for b = 1, 50000 do
		a[b] = {
			[1] = "Key",
			[2] = 1
		}
	end;
	game:GetService("ReplicatedStorage").Remotes.UpdateTradeOffer:FireServer(a)
end)
e:NewSlider("FOV", "Change your field of view", 120, 0, function(a)
	workspace.CurrentCamera.FieldOfView = a
end)
local c = c:NewSection("HBE")
c:NewButton("HBE", "Makes other players hitboxes larger", function()
	getfenv().hbe = true;
	if getfenv().hbe == true then
		local a = getrawmetatable(game)
		make_writeable(a)
		local b = a.__index;
		a.__index = function(a, c)
			if tostring(a) == "HumanoidRootPart" then
				if tostring(c) == "Size" then
					return Vector3.new(2, 2, 1)
				end
			end;
			return b(a, c)
		end;
		if shared.ShushHighlight then
			shared.ShushHighlight.stop()
		end;
		local a = {}
		a.__index = a;
		a.__tostring = function(a)
			return a.Name
		end;
		a.new = function(b, c, d)
			return setmetatable({
				Name = b.Name .. ".Connection",
				Event = b,
				Func = c,
				Once = d
			}, a)
		end;
		a.Disconnect = function(a)
			table.remove(a.Event._connections, table.find(a.Event._connections, a))
		end;
		local b = {}
		b.__index = b;
		b.__tostring = function(a)
			return a.Name
		end;
		b.new = function(a)
			return setmetatable({
				Name = a or "Event",
				_connections = {},
				_waits = {}
			}, b)
		end;
		b.Connect = function(b, c)
			local a = a.new(b, c)
			table.insert(b._connections, a)
			return a
		end;
		b.Fire = function(a, ...)
			local b = {
				...
			}
			task.spawn(function()
				for a, a in next, a._connections do
					a.Func(unpack(b))
				end
			end)
		end;
		local a;
		local c = game:GetService("Players")
		local d = c.LocalPlayer;
		local e = game.FindFirstChild;
		local f = d:WaitForChild("PlayerGui").ScreenGui.UI.Target;
		local g = f.TargetText;
		do
			local b = g.Text;
			local d = g.Visible;
			local f = f.Visible;
			if d and f then
				if b and # b > 1 then
					a = e(c, b)
				end
			end
		end;
		local e = b.new("InstChanged")
		local f = b.new("TargetChanged")
		local g = b.new("HitboxChanged")
		local b = b.new("TargetHitboxChanged")
		local h = {
			Target = true
		}
		local i = {
			FillColor = Color3.new(0, 1, 0),
			FillTransparency = 0.5,
			OutlineColor = Color3.new(1, 1, 1),
			OutlineTransparency = 0
		}
		local j = {
			FillColor = Color3.new(1, 0, 0),
			FillTransparency = 0.5,
			OutlineColor = Color3.new(1, 1, 1),
			OutlineTransparency = 0
		}
		local k = {
			Size = Vector3.new(2, 2, 1),
			Transparency = 1
		}
		local l = {
			Size = Vector3.new(2, 2, 1),
			Transparency = 1
		}
		local h = setmetatable({}, {
			__index = h,
			__newindex = function(a, a, b)
				if a == "Target" then
					for a, b in next, j do
						f:Fire(a, b)
					end
				end;
				h[a] = b
			end
		})
		h.INST = setmetatable({}, {
			__index = i,
			__newindex = function(a, a, b)
				if i[a] then
					e:Fire(a, b)
					i[a] = b;
					return
				end;
				return error(tostring(a), " is not a valid key")
			end
		})
		h.TARGET = setmetatable({}, {
			__index = j,
			__newindex = function(a, a, b)
				if j[a] then
					f:Fire(a, b)
					j[a] = b;
					return
				end;
				return error(tostring(a), " is not a valid key")
			end
		})
		h.HITBOX = setmetatable({}, {
			__index = k,
			__newindex = function(a, a, b)
				if k[a] then
					g:Fire(a, b)
					k[a] = b;
					return
				end;
				return error(tostring(a), " is not a valid key")
			end
		})
		h.TARGETHITBOX = setmetatable({}, {
			__index = l,
			__newindex = function(a, a, c)
				if l[a] then
					b:Fire(a, c)
					l[a] = c;
					return
				end;
				return error(tostring(a), " is not a valid key")
			end
		})
		local m = {
			Active = true,
			Connections = {},
			Settings = h
		}
		m.__index = m;
		m.new = function(b, c)
			local d = {}
			local g = Instance.new("Highlight")
			g.Adornee = b;
			g.Parent = b;
			if h.Target and a and c == a then
				for a, b in next, j do
					g[a] = b;
					d[a] = b
				end
			else
				for a, b in next, i do
					g[a] = b;
					d[a] = b
				end
			end;
			local i;
			i = e:Connect(function(b, e)
				if d[b] == e then
					return
				end;
				if h.Target and a and a and c == a then
					return
				end;
				g[b] = e
			end)
			local e;
			e = f:Connect(function(b, e)
				if d[b] == e then
					return
				end;
				if not (h.Target and a and c == a) then
					return
				end;
				g[b] = e
			end)
			g.Changed:Connect(function(a)
				d[a] = g[a]
			end)
			local a = setmetatable({
				Active = true,
				Inst = g,
				Character = b,
				SettingsCon = i,
				TargetCon = e
			}, m)
			return a
		end;
		m.Destroy = function(a)
			if not a.Active then
				return
			end;
			a.Active = false;
			a.SettingsCon:Disconnect()
			a.TargetCon:Disconnect()
			a.Inst:Destroy()
		end;
		local f = {}
		f.__index = f;
		f.new = function(c, d)
			local e = c:FindFirstChild("HumanoidRootPart")
			local g = g:Connect(function(b, c)
				if not e then
					return
				end;
				if h.Target and a and a and d == a then
					return
				end;
				e[b] = c
			end)
			local b = b:Connect(function(b, c)
				if not e then
					return
				end;
				if not (h.Target and a and a and d == a) then
					return
				end;
				e[b] = c
			end)
			local b = setmetatable({
				Active = true,
				HitboxCon = g,
				TargetHitboxCon = b,
				HRP = e
			}, f)
			task.spawn(function()
				if not e then
					repeat
						task.wait()
						e = c:FindFirstChild("HumanoidRootPart")
					until e
				end;
				b.HRP = e;
				if h.Target and a and d == a then
					for a, b in next, l do
						e[a] = b
					end
				else
					for a, b in next, k do
						e[a] = b
					end
				end
			end)
			return b
		end;
		f.Destroy = function(a)
			if not a.Active then
				return
			end;
			a.Active = false;
			a.HitboxCon:Disconnect()
			a.TargetHitboxCon:Disconnect()
		end;
		local function b(a)
			return workspace:FindFirstChild(a.Name)
		end;
		local g = {}
		g.__index = g;
		g.new = function(a)
			if typeof(a) ~= "Instance" or a == d then
				return
			end;
			local b = setmetatable({
				Active = true,
				Player = a,
				Character = b(a) or a.CharacterAdded:Wait()
			}, g)
			task.spawn(function()
				b.Highlight = m.new(b.Character, a)
			end)
			task.spawn(function()
				b.Extender = f.new(b.Character, a)
			end)
			local c = a.CharacterAdded:Connect(function(c)
				task.spawn(function()
					if b.Highlight then
						b.Highlight:Destroy()
					end;
					b.Highlight = m.new(c, a)
				end)
				task.spawn(function()
					if b.Extender then
						b.Extender:Destroy()
					end;
					b.Extender = f.new(c, a)
				end)
			end)
			b.CharacterAddedCon = c;
			g[a] = b;
			return b
		end;
		g.Destroy = function(a)
			if not a.Active then
				return
			end;
			a.Active = false;
			if a.Highlight then
				a.Highlight:Destroy()
			end;
			if a.Extender then
				a.Extender:Destroy()
			end;
			a.CharacterAddedCon:Disconnect()
		end;
		m.HandlePlayers = function()
			for a, a in next, c:GetPlayers() do
				g.new(a)
			end;
			table.insert(m.Connections, c.PlayerAdded:Connect(g.new))
			table.insert(m.Connections, c.PlayerRemoving:Connect(function(a)
				if g[a] then
					g[a]:Destroy()
				end
			end))
		end;
		m.stop = function()
			if not m.Active then
				return
			end;
			m.Active = false;
			for a, b in next, g do
				if typeof(a) == "Instance" then
					b:Destroy()
				end
			end;
			for a, a in next, m.Connections do
				a:Disconnect()
			end
		end;
		local b = game:GetService("ReplicatedStorage")
		local b = b.Remotes;
		local c = b.HideTarget;
		local b = b.UpdateTarget;
		table.insert(m.Connections, c.OnClientEvent:Connect(function()
			a = nil;
			for a, b in next, i do
				e:Fire(a, b)
			end
		end))
		table.insert(m.Connections, b.OnClientEvent:Connect(function(b)
			a = b;
			local a = g[a]
			local b = a and a.Highlight;
			if b then
				for a, c in next, j do
					b.Inst[a] = c
				end
			end;
			local a = a and a.Extender;
			if a then
				for b, c in next, l do
					a.HRP[b] = c
				end
			end
		end))
		m.HandlePlayers()
		shared.ShushHighlight = m;
		local a = shared.ShushHighlight.Settings;
		a.HITBOX.Size = Vector3.new(15, 15, 15)
		a.HITBOX.Transparency = 0.5;
		a.TARGETHITBOX.Size = Vector3.new(25, 25, 25)
		a.TARGETHITBOX.Transparency = 0.5;
		a.INST.FillColor = Color3.fromRGB(0, 0, 0)
		a.TARGET.OutlineColor = Color3.fromRGB(0, 0, 0)
	elseif getfenv().hbe == false then
		print('disabled hbe')
	end
end)
local c = a:NewTab("AutoFarm")
local c = c:NewSection("Autofarm")
c:NewButton("Free Autofarm", "Click for AF (Buggy cuz free)", function()
	game:GetService("AdService"):ClearAllChildren()
	wait(1)
	local a = game.Players.LocalPlayer;
	local b = game.Workspace;
	local c = b.CurrentCamera;
	local d = a:GetMouse()
	local a = function()
		local e = nil;
		local f = 9e9;
		for g, g in pairs(game.Players:GetPlayers()) do
			if g ~= a then
				if b[g.Name]:FindFirstChild("Humanoid") and b[g.Name].Humanoid.Health ~= 0 then
					local a = c:WorldToViewportPoint(b[g.Name].HumanoidRootPart.Position)
					local a = (Vector2.new(a.X, a.Y) - Vector2.new(d.X, d.Y)).magnitude;
					if a < f then
						e = b[g.Name]
						f = a
					end
				end
			end
		end;
		return e
	end;
	game:GetService('RunService').RenderStepped:connect(function()
		for b, b in pairs(game.Workspace.KnifeHost:GetDescendants()) do
			if b:IsA"Part" then
				if b.Archivable == true then
					local a = a().baseHitbox.CFrame;
					b.CFrame = a
				end
			end
		end
	end)
	game:GetService("RunService").Stepped:Connect(function()
		local function a()
			local a = {
				0,
				1,
				2,
				-1,
				-2
			}
			return a[math.random(1, # a)]
		end;
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Knife") then
			for b, b in pairs(game.Players:GetPlayers()) do
				if b.Name == game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.UI.Target.TargetText.Text then
					if b.Name ~= game.Players.LocalPlayer.Name then
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(Game.Players.LocalPlayer.Backpack.Knife)
						wait(.3)
						local b = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.UI.Target.TargetText.Text;
						local c = game.Workspace[b].HumanoidRootPart.Position.X + a()
						local d = game.Workspace[b].HumanoidRootPart.Position.Y + a()
						local a = game.Workspace[b].HumanoidRootPart.Position.Z + a()
						local a = {
							[1] = Vector3.new(c, d, a),
							[2] = 0,
							[3] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
						}
						game:GetService("ReplicatedStorage").Remotes.ThrowKnife:FireServer(unpack(a))
						wait(.1)
						game:GetService("Players").localPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
						wait(.6)
					end
				end
			end
		end
	end)
	function GetTime(a, b)
		local a = a / b;
		return a
	end;
	function oreoTween(a, b)
		local b = b;
		local c = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - a.Position).magnitude;
		local b = GetTime(c, b)
		local c = game:GetService("TweenService")
		local b = TweenInfo.new(b, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
		local a = c:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, b, {
			CFrame = a.CFrame
		})
		a:Play()
	end;
	local a = game:GetService("Players").LocalPlayer;
	local b = game:GetService("Workspace")
	local b = function()
		local c = nil;
		local d = 9e9;
		for e, e in next, game:GetService("Players"):GetPlayers() do
			if e.Name ~= a.Name then
				if b[e.Name] and b[e.Name]:FindFirstChild("Humanoid") and b[e.Name]:FindFirstChild("Humanoid").Health ~= 0 then
					local a = (a.Character.Head.Position - b[e.Name].Head.Position).Magnitude;
					if a < d then
						c = b[e.Name]
						d = a
					end
				end
			end
		end;
		return c
	end;
	local c = 10;
	spawn(function()
		while c > 0 do
			repeat
				wait()
			until a.Character:FindFirstChild("Head")
			if a:DistanceFromCharacter(b().Head.Position) <= 6.5 then
				a.PlayerScripts.localknifehandler.HitCheck:Fire(b())
				wait(.7)
			else
				wait()
			end
		end
	end)
	game:GetService("RunService").Stepped:Connect(function()
		game.Workspace.Gravity = -2;
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		oreoTween(game.Workspace[game.Players.LocalPlayer.PlayerGui.ScreenGui:WaitForChild("UI"):WaitForChild("Target"):WaitForChild("TargetText").Text].HumanoidRootPart, 34.3)
		for a, a in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			pcall(function()
				if a.ClassName == "Part" then
					a.CanCollide = false
				elseif a.ClassName == "Model" then
					a.Head.CanCollide = false
				end
			end)
		end
	end)
	task.spawn(function()
		game.RunService.Heartbeat:Connect(function()
			for a, a in pairs(game:GetService('Players'):GetChildren()) do
				AnimationId = "181525546"
				local a = Instance.new("Animation")
				a.AnimationId = "rbxassetid://" .. AnimationId;
				local a = game:GetService('Players').LocalPlayer.Character.Humanoid:LoadAnimation(a)
				a:Play()
				a:AdjustSpeed(2)
			end
		end)
	end)
	task.spawn(function()
		game:GetService("RunService").Heartbeat:connect(function()
			local a = game.Players.LocalPlayer.Character.HumanoidRootPart;
			a.CFrame = a.CFrame * CFrame.Angles(0, math.rad(20), 0)
			wait(0.01)
			game.Players.LocalPlayer.Character['Right Leg']:remove()
			game.Players.LocalPlayer.Character['Left Leg']:remove()
			game.Players.LocalPlayer.Character['Left Arm']:remove()
		end)
	end)
end)
local e = a:NewTab("Other")
local f = e:NewSection("Other")
f:NewButton("Auto Purchase Key (With Candy)", "click to auto purchase keys using candy", function()
	_G.autoBuy = true;
	while _G.autoBuy == true do
		game:GetService("ReplicatedStorage").Remotes.RequestCandyItemPurchase:InvokeServer(unpack({
			[1] = "Key"
		}))
		wait()
	end
end)
local f = e:NewSection("Server Hops and Rejoin")
f:NewButton("Rejoin", "Click to Rejoin Server", function()
	while wait(1) do
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end
end)
f:NewButton("Join Classic", "Click to teleport to Classic", function()
	while wait(1) do
		game:GetService("TeleportService"):Teleport(379614936, game:GetService("Players").LocalPlayer)
	end
end)
f:NewButton("Join Pro", "Click to teleport to Pro", function()
	while wait(1) do
		game:GetService("TeleportService"):Teleport(860428890, game:GetService("Players").LocalPlayer)
	end
end)
f:NewButton("Join Freeplay", "Click to teleport to Freeplay", function()
	while wait(1) do
		game:GetService("TeleportService"):Teleport(5006801542, game:GetService("Players").LocalPlayer)
	end
end)
f:NewButton("Join Comp", "Click to teleport to Comp", function()
	while wait(1) do
		game:GetService("TeleportService"):Teleport(866472074, game:GetService("Players").LocalPlayer)
	end
end)
local e = e:NewSection("FPS Caps")
e:NewButton("Set FPS cap to 30", "Sets fps cap to 30", function()
	setfpscap(30)
end)
e:NewButton("Set FPS cap to 60", "Sets fps cap to 60", function()
	setfpscap(60)
end)
e:NewButton("Set FPS cap to 180", "Sets fps cap to 180", function()
	setfpscap(180)
end)
e:NewButton("Set FPS cap to 360", "Sets fps cap to 360", function()
	setfpscap(360)
end)
e:NewButton("Unlimited FPS", "Sets fps cap to Unlimited", function()
	setfpscap(50000)
end)
b:NewButton("Slowfall", "Click for Slowfall", function()
	local a = game:GetService("Players").LocalPlayer;
	task.spawn(function()
		game:GetService("RunService").RenderStepped:Connect(function()
			if a.PlayerGui.ScreenGui.UI.Target.Visible == true then
				a.Character:WaitForChild("HumanoidRootPart").Velocity = Vector3.new(0, 0, 0)
			end
		end)
	end)
end)
c:NewButton("Auto Candy Collect", "click to auto collect candy", function()
	game.RunService.Stepped:Connect(function()
		game.Workspace.EventCurrency:GetChildren()[1].Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	end)
end)
local b = d:NewSection("Map")
b:NewButton("Remove Textures", "Click to remove textures", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Sustorr/Assassin-Scripts/main/Remove%20Textures.lua", true))()
end)
b:NewButton("Remove Map", "click to remove map", function()
	game.Workspace.GameMap:Destroy()
end)
b:NewButton("Roblox Shaders", "Click to enable shaders", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/helloDelvuss/NIGGARTX/main/EZRTX", true))()
end)
local a = a:NewTab("Creds")
local b = a:NewSection("Creds")
b:NewButton("Credits", "Click for credits", function()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Credits";
		Text = "n2,silent aim  tech hog/inv calc supa/trade crash,  via/remove textures, couple other people sorry if I forgot you";
		Duration = 10
	})
end)
local a = a:NewSection("Youtube")
a:NewButton("Youtube", "Sub to my YT Radeon for awesome scripts!", function()
	game.StarterGui:SetCore("SendNotification", {
		Title = "SUB TO RADEON ON YT!";
		Text = "SUBSCRIBE FOR OP FREE ROBLOX SCRIPTS!";
		Duration = 10
	})
end)
