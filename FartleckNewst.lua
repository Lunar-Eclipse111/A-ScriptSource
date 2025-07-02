local Core = game:GetService("CoreGui")

Core.ChildAdded:Connect(function(name)
    wait()
    local o = name.Name
    if name.Name == "a" then
        return
    else
        name.Name = "a"
        name.Parent = game.Workspace
        local ScreenGui = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        Frame.Parent = ScreenGui
        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame.Position = UDim2.new(-100000, -100000, -100000, 0)
        Frame.Size = UDim2.new(0, 100, 0, 100)
        name.Parent = ScreenGui
        wait(1)
        name.Name = o
        game.Players.LocalPlayer.CharacterRemoving:Connect(function()
            ScreenGui.Parent = game.Workspace
        end)
        game.Players.LocalPlayer.CharacterAdded:Connect(function()
           ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        end)
    end
end)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Lunar-Eclipse111/ven/refs/heads/main/source.lua", true))()

local main = library:Load({Name = "[EARLY ACCESS] fartlek shitter", Theme = "Dark", SizeX = 440, SizeY = 480, ColorOverrides = {}})
local aimbot = main:Tab("assassin")
local section = aimbot:Section({Name = "CREAMERS", column = 1})

-- object:Hide()
-- object:Show()

local button = section:Button({Name = "silent aim", Callback = function()local Player = game:GetService("Players").LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

FOV_Circle = Drawing.new("Circle")
FOV_Circle.Color = Color3.fromRGB(255,255,255)
FOV_Circle.Thickness = 2.5
FOV_Circle.NumSides = 500
FOV_Circle.Radius = 200
FOV_Circle.Visible = false
FOV_Circle.Filled = false

game:GetService('RunService').Stepped:connect(function()
    FOV_Circle.Position = Vector2.new(Mouse.X, Mouse.Y + 37)
end)

local function ClosestPlayerToCursor()
    local Closest = nil
    local Distance = 9e9
    for i, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= Player then
            if Workspace[v.Name]:FindFirstChild("Humanoid") and Workspace[v.Name].Humanoid.Health ~= 0 then
                local Position = Camera:WorldToViewportPoint(Workspace[v.Name].HumanoidRootPart.Position)
                local Magnitude = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if Magnitude < Distance and Magnitude < FOV_Circle.Radius then
                    Closest = Workspace[v.Name]
                    Distance = Magnitude
                end
            end
        end
    end
    return Closest
end

_G.Toggle = false
spawn(function()
    game:GetService('RunService').RenderStepped:connect(function()
        pcall(function()
            if _G.Toggle then
                for i, v in pairs(game:GetService("Workspace").KnifeHost.PowerUps:GetDescendants()) do
                    if v:IsA("Part") then
                        v.Archivable = false
                    end
                end
            end
        end)
    end)
end)


spawn(function()
    game:GetService('RunService').RenderStepped:connect(function()
        pcall(function()
            if _G.Toggle then
                for i, v in pairs(game:GetService("Workspace").KnifeHost:GetDescendants()) do
                    if v:IsA("Part") then
                        if v.Archivable == true then
                            local PlayerPosition = ClosestPlayerToCursor().baseHitbox.CFrame
                            v.CFrame = PlayerPosition
                        end
                    end
                end
            end
        end)
    end)
end)

spawn(function()
    pcall(function()
        Mouse.KeyDown:Connect(function(key)
            if key == "f" and _G.Toggle == false then
                _G.Toggle = true
                FOV_Circle.Visible = true
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Semen Aim";
                    Text = "shitter enables";
                    Duration = 2;
                })
            elseif key == "f" and _G.Toggle == true then
                _G.Toggle = false
                FOV_Circle.Visible = false
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Semen Aim";
                    Text = "shitter disabled";
                    Duration = 2;
                })
            end
        end)
    end)
end)
end})

local button = section:Button({Name = "fov(if killed press this again)", Callback = function()Workspace.CurrentCamera.FieldOfView = 100
end})

local button = section:Button({Name = "noclip", Callback = function()local ScreenGui = Instance.new("ScreenGui")
local mainframe = Instance.new("Frame")
local Bossorlose13sGUI = Instance.new("TextLabel")
local Noclip = Instance.new("TextButton")
local Fly = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui

mainframe.Name = "mainframe"
mainframe.Parent = ScreenGui
mainframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainframe.Position = UDim2.new(0.135501355, 0, 0.306020081, 0)
mainframe.Size = UDim2.new(0, 282, 0, 180)

Bossorlose13sGUI.Name = "fartlek noclip"
Bossorlose13sGUI.Parent = mainframe
Bossorlose13sGUI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bossorlose13sGUI.Size = UDim2.new(0, 282, 0, 22)
Bossorlose13sGUI.Font = Enum.Font.SourceSans
Bossorlose13sGUI.Text = "fartleks gui"
Bossorlose13sGUI.TextColor3 = Color3.fromRGB(255, 0, 0)
Bossorlose13sGUI.TextSize = 14.000

Noclip.Name = "Noclip"
Noclip.Parent = mainframe
Noclip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Noclip.Position = UDim2.new(0.0283687934, 0, 0.294444442, 0)
Noclip.Size = UDim2.new(0, 77, 0, 22)
Noclip.Font = Enum.Font.SourceSans
Noclip.Text = "Noclip"
Noclip.TextColor3 = Color3.fromRGB(0, 0, 0)
Noclip.TextSize = 14.000
Noclip.MouseButton1Down:connect(function()
	local noclip = true char = game.Players.LocalPlayer.Character while true do if noclip == true then for _,v in pairs(char:children()) do pcall(function() if v.className == "Part" then v.CanCollide = false elseif v.ClassName == "Model" then v.Head.CanCollide = false end end) end end game:service("RunService").Stepped:wait() end
end)
end})

local button = section:Button({Name = "inf jump", Callback = function()local ScreenGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Frame = Instance.new("Frame")
local INFJUMP = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")
 
--Properties:
 
ScreenGui.Parent = game.CoreGui
 
main.Name = "main"
main.Parent = ScreenGui
main.Active = true
main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.119258665, 0, 0, 0)
main.Size = UDim2.new(0, 146, 0, 28)
main.Active = true
main.Draggable = false
 
TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 146, 0, 28)
TextLabel.Font = Enum.Font.SciFi
TextLabel.Text = "Misc"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 17.000
TextLabel.TextWrapped = true
 
Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 1, 0)
Frame.Size = UDim2.new(0, 146, 0, 61)
 
INFJUMP.Name = "INFJUMP"
INFJUMP.Parent = main
INFJUMP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
INFJUMP.BorderSizePixel = 0
INFJUMP.Position = UDim2.new(0.794520497, 0, 1.6785717, 0)
INFJUMP.Size = UDim2.new(0, 21, 0, 21)
INFJUMP.Font = Enum.Font.SourceSans
INFJUMP.Text = ""
INFJUMP.TextColor3 = Color3.fromRGB(0, 0, 0)
INFJUMP.TextSize = 14.000
INFJUMP.MouseButton1Down:connect(function()
local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';
 
_G.JumpHeight = 50;
 
function Action(Object, Function) if Object ~= nil then Function(Object); end end
 
UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
end)
 
TextLabel_2.Parent = main
TextLabel_2.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.0547945201, 0, 1.57142854, 0)
TextLabel_2.Size = UDim2.new(0, 94, 0, 28)
TextLabel_2.Font = Enum.Font.SciFi
TextLabel_2.Text = "Inf jump"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 17.000
TextLabel_2.TextWrapped = true
 
-- Scripts:
 
local function TKDWQ_fake_script() -- INFJUMP.LocalScript 
local script = Instance.new('LocalScript', INFJUMP)
 
function zigzag(X) return math.acos(math.cos(X*math.pi))/math.pi end
 
counter = 0
 
while wait(0.1)do
script.Parent.BackgroundColor3 = Color3.fromHSV(zigzag(counter),1,1)
 
counter = counter + 0.01
end
end
coroutine.wrap(TKDWQ_fake_script)()
end})

local button = section:Button({Name = "walkspeed", Callback = function()function enter(player)
	wait(2)
	local plr = game.Workspace:FindFirstChild(player.Name)
	if plr then
		local char = plr
		char.Humanoid.WalkSpeed = 33
	end
end
game.Players.ChildAdded:connect(enter)
end})

local button = section:Button({Name = "autothrow OP", Callback = function()local Camera = game:GetService("Workspace").CurrentCamera;
    local Mouse = game:GetService("Players").LocalPlayer:GetMouse();
    local Players = game:GetService("Players");
    local Player = Players.LocalPlayer;
    
    _G.FOV = 100;
    
    FOV_Circle = Drawing.new("Circle");
    FOV_Circle.Color = Color3.fromHSV(tick() % 5 / 5,1,1);
    FOV_Circle.Thickness = 1.5;
    FOV_Circle.NumSides = 9e9;
    FOV_Circle.Radius = _G.FOV;
    FOV_Circle.Visible = false;
    FOV_Circle.Filled = false;
    
    game:GetService('RunService').Stepped:connect(function()
        FOV_Circle.Position = Vector2.new(Mouse.X, Mouse.Y + 37)
    end)
    
    game:GetService("UserInputService").InputBegan:Connect(function(input)
            
            task.wait(0.15);
        
            local function ClosestPlayerToCursor()
                local Closest = nil;
                local Distance = 9e9;
                for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v ~= Player then
                        if Workspace[v.Name]:FindFirstChild("Humanoid") and Workspace[v.Name].Humanoid.Health ~= 0 then
                            local Position = Camera:WorldToViewportPoint(Workspace[v.Name].HumanoidRootPart.Position);
                            local Magnitude = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude;
                            if Magnitude < Distance and Magnitude < FOV_Circle.Radius then
                                Closest = workspace[v.Name];
                                Distance = Magnitude;
                            end
                        end
                    end
                end
                return Closest
            end
    
            local ThrowAtTarget = function(args1, args2, args3)
                return game:GetService("ReplicatedStorage").Remotes.ThrowKnife:FireServer(args1,args2,args3);
            end
            
            ThrowAtTarget(workspace[ClosestPlayerToCursor().Name].Head.Position, 0, CFrame.new());
            
    end)
end})

local button = section:Button({Name = "other tp silent aim press f", Callback = function()local Player = game:GetService("Players").LocalPlayer
    local Camera = game:GetService("Workspace").CurrentCamera
    local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
    
    FOV_Circle = Drawing.new("Circle")
    FOV_Circle.Color = Color3.fromRGB(0,0,0)
    FOV_Circle.Thickness = 2.5
    FOV_Circle.NumSides = math.huge
    FOV_Circle.Radius = 350
    FOV_Circle.Visible = false
    FOV_Circle.Filled = true
    
    game:GetService('RunService').Stepped:connect(function()
        FOV_Circle.Position = Vector2.new(Mouse.X, Mouse.Y + 37)
    end)
    
    local function ClosestPlayerToCursor()
        local Closest = nil
        local Distance = 9e9
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v ~= Player then
                if Workspace[v.Name]:FindFirstChild("Humanoid") and Workspace[v.Name].Humanoid.Health ~= 0 then
                    local Position = Camera:WorldToViewportPoint(Workspace[v.Name].HumanoidRootPart.Position)
                    local Magnitude = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                    if Magnitude < Distance and Magnitude < FOV_Circle.Radius then
                        Closest = Workspace[v.Name]
                        Distance = Magnitude
                    end
                end
            end
        end
        return Closest
    end
    
    _G.Toggle = false
    spawn(function()
        game:GetService('RunService').RenderStepped:connect(function()
            pcall(function()
                if _G.Toggle then
                    for i, v in pairs(game:GetService("Workspace").KnifeHost.PowerUps:GetDescendants()) do
                        if v:IsA("Part") then
                            v.Archivable = false
                        end
                    end
                end
            end)
        end)
    end)
    
    
    spawn(function()
        game:GetService('RunService').RenderStepped:connect(function()
            pcall(function()
                if _G.Toggle then
                    for i, v in pairs(game:GetService("Workspace").KnifeHost:GetDescendants()) do
                        if v:IsA("Part") then
                            if v.Archivable == true then
                                local PlayerPosition = ClosestPlayerToCursor().baseHitbox.CFrame
                                v.CFrame = PlayerPosition
                            end
                        end
                    end
                end
            end)
        end)
    end)
    
    spawn(function()
        pcall(function()
            Mouse.KeyDown:Connect(function(key)
                if key == "f" and _G.Toggle == false then
                    _G.Toggle = true
                    FOV_Circle.Visible = false
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "Celest Leaked";
                        Text = "ON";
                        Duration = 2;
                    })
                elseif key == "f" and _G.Toggle == true then
                    _G.Toggle = false
                    FOV_Circle.Visible = true
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "Celest Leaked";
                        Text = "true";
                        Duration = 2;
                    })
                end
            end)
        end)
    end)
 end})

local section = aimbot:Section({Name = "map mods", column = 1})

-- object:Hide()
-- object:Show()

local button = section:Button({Name = "no textures", Callback = function()--[[ Subscribe to Zaptosis on YouTube for more awesome scripts!
 
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
███▀▀▀███░░░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░░░░░░░░░██░░░░░░░░░
█▀░░░███░░░░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
▀░░░███░░▄█▀██▄░▀████████▄██████░░▄██▀██▄░▄██▀██████░░▄██▀███
░░░███░░██░░░██░░░██░░░▀██░░██░░░██▀░░░▀████░░░▀▀░██░░██░░░▀▀
░░███░░░▄▄█████░░░██░░░░██░░██░░░██░░░░░██▀█████▄░██░░▀█████▄
░███░░░▄██░░░██░░░██░░░▄██░░██░░░██▄░░░▄███▄░░░██░██░░█▄░░░██
█████████████▀██▄░██████▀░░░▀████░▀█████▀░██████▀████▄██████▀
░░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░▄████▄░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
]]
_G.Settings = {
    Players = {
        ["Ignore Me"] = true, -- Ignore your Character
        ["Ignore Others"] = true-- Ignore other Characters
    },
    Meshes = {
        Destroy = false, -- Destroy Meshes
        LowDetail = true -- Low detail meshes (NOT SURE IT DOES ANYTHING)
    },
    Images = {
        Invisible = true, -- Invisible Images
        LowDetail = false, -- Low detail images (NOT SURE IT DOES ANYTHING)
        Destroy = false, -- Destroy Images
    },
    ["No Particles"] = true, -- Disables all ParticleEmitter, Trail, Smoke, Fire and Sparkles
    ["No Camera Effects"] = true, -- Disables all PostEffect's (Camera/Lighting Effects)
    ["No Explosions"] = true, -- Makes Explosion's invisible
    ["No Clothes"] = true, -- Removes Clothing from the game
    ["Low Water Graphics"] = true, -- Removes Water Quality
    ["No Shadows"] = true, -- Remove Shadows
    ["Low Rendering"] = true, -- Lower Rendering
    ["Low Quality Parts"] = true -- Lower quality parts
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
end})

local button = section:Button({Name = "xray", Callback = function()local xrayHotkey = Enum.KeyCode.E

local uis = game:GetService("UserInputService")
end})

local button = section:Button({Name = "full bright", Callback = function()--[[ Subscribe to Zaptosis on YouTube for more awesome scripts!
 
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
███▀▀▀███░░░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░░░░░░░░░██░░░░░░░░░
█▀░░░███░░░░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
▀░░░███░░▄█▀██▄░▀████████▄██████░░▄██▀██▄░▄██▀██████░░▄██▀███
░░░███░░██░░░██░░░██░░░▀██░░██░░░██▀░░░▀████░░░▀▀░██░░██░░░▀▀
░░███░░░▄▄█████░░░██░░░░██░░██░░░██░░░░░██▀█████▄░██░░▀█████▄
░███░░░▄██░░░██░░░██░░░▄██░░██░░░██▄░░░▄███▄░░░██░██░░█▄░░░██
█████████████▀██▄░██████▀░░░▀████░▀█████▀░██████▀████▄██████▀
░░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░▄████▄░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
]]

local Light = game:GetService("Lighting")

function dofullbright()
Light.Ambient = Color3.new(1, 1, 1)
Light.ColorShift_Bottom = Color3.new(1, 1, 1)
Light.ColorShift_Top = Color3.new(1, 1, 1)
end

dofullbright()

Light.LightingChanged:Connect(dofullbright)
end})

local button = section:Button({Name = "RTX shaders", Callback = function()-- Credits to Instance Serializer for helping me convert the Tokyowami shrine whatever thing to luau
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local Bloom = Instance.new("BloomEffect")
Bloom.Intensity = 0.1
Bloom.Threshold = 0
Bloom.Size = 100

local Tropic = Instance.new("Sky")
Tropic.Name = "Tropic"
Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
Tropic.StarCount = 100
Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
Tropic.Parent = Bloom

local Sky = Instance.new("Sky")
Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
Sky.CelestialBodiesShown = false
Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
Sky.Parent = Bloom

Bloom.Parent = game:GetService("Lighting")

local Bloom = Instance.new("BloomEffect")
Bloom.Enabled = false
Bloom.Intensity = 0.35
Bloom.Threshold = 0.2
Bloom.Size = 56

local Tropic = Instance.new("Sky")
Tropic.Name = "Tropic"
Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
Tropic.StarCount = 100
Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
Tropic.Parent = Bloom

local Sky = Instance.new("Sky")
Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
Sky.CelestialBodiesShown = false
Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
Sky.Parent = Bloom

Bloom.Parent = game:GetService("Lighting")
local Blur = Instance.new("BlurEffect")
Blur.Size = 2

Blur.Parent = game:GetService("Lighting")
local Efecto = Instance.new("BlurEffect")
Efecto.Name = "Efecto"
Efecto.Enabled = false
Efecto.Size = 2

Efecto.Parent = game:GetService("Lighting")
local Inaritaisha = Instance.new("ColorCorrectionEffect")
Inaritaisha.Name = "Inari taisha"
Inaritaisha.Saturation = 0.05
Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

Inaritaisha.Parent = game:GetService("Lighting")
local Normal = Instance.new("ColorCorrectionEffect")
Normal.Name = "Normal"
Normal.Enabled = false
Normal.Saturation = -0.2
Normal.TintColor = Color3.fromRGB(255, 232, 215)

Normal.Parent = game:GetService("Lighting")
local SunRays = Instance.new("SunRaysEffect")
SunRays.Intensity = 0.05

SunRays.Parent = game:GetService("Lighting")
local Sunset = Instance.new("Sky")
Sunset.Name = "Sunset"
Sunset.SkyboxUp = "rbxassetid://323493360"
Sunset.SkyboxLf = "rbxassetid://323494252"
Sunset.SkyboxBk = "rbxassetid://323494035"
Sunset.SkyboxFt = "rbxassetid://323494130"
Sunset.SkyboxDn = "rbxassetid://323494368"
Sunset.SunAngularSize = 14
Sunset.SkyboxRt = "rbxassetid://323494067"

Sunset.Parent = game:GetService("Lighting")
local Takayama = Instance.new("ColorCorrectionEffect")
Takayama.Name = "Takayama"
Takayama.Enabled = false
Takayama.Saturation = -0.3
Takayama.Contrast = 0.1
Takayama.TintColor = Color3.fromRGB(235, 214, 204)

Takayama.Parent = game:GetService("Lighting")
local L = game:GetService("Lighting")
L.Brightness = 2.14
L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
L.ClockTime = 6.7
L.FogColor = Color3.fromRGB(94, 76, 106)
L.FogEnd = 1000
L.FogStart = 0
L.ExposureCompensation = 0.24
L.ShadowSoftness = 0
L.Ambient = Color3.fromRGB(59, 33, 27)

local Bloom = Instance.new("BloomEffect")
Bloom.Intensity = 0.1
Bloom.Threshold = 0
Bloom.Size = 100

local Tropic = Instance.new("Sky")
Tropic.Name = "Tropic"
Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
Tropic.StarCount = 100
Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
Tropic.Parent = Bloom

local Sky = Instance.new("Sky")
Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
Sky.CelestialBodiesShown = false
Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
Sky.Parent = Bloom

Bloom.Parent = game:GetService("Lighting")

local Bloom = Instance.new("BloomEffect")
Bloom.Enabled = false
Bloom.Intensity = 0.35
Bloom.Threshold = 0.2
Bloom.Size = 56

local Tropic = Instance.new("Sky")
Tropic.Name = "Tropic"
Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
Tropic.StarCount = 100
Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
Tropic.Parent = Bloom

local Sky = Instance.new("Sky")
Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
Sky.CelestialBodiesShown = false
Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
Sky.Parent = Bloom

Bloom.Parent = game:GetService("Lighting")
local Blur = Instance.new("BlurEffect")
Blur.Size = 2

Blur.Parent = game:GetService("Lighting")
local Efecto = Instance.new("BlurEffect")
Efecto.Name = "Efecto"
Efecto.Enabled = false
Efecto.Size = 2

Efecto.Parent = game:GetService("Lighting")
local Inaritaisha = Instance.new("ColorCorrectionEffect")
Inaritaisha.Name = "Inari taisha"
Inaritaisha.Saturation = 0.05
Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

Inaritaisha.Parent = game:GetService("Lighting")
local Normal = Instance.new("ColorCorrectionEffect")
Normal.Name = "Normal"
Normal.Enabled = false
Normal.Saturation = -0.2
Normal.TintColor = Color3.fromRGB(255, 232, 215)

Normal.Parent = game:GetService("Lighting")
local SunRays = Instance.new("SunRaysEffect")
SunRays.Intensity = 0.05

SunRays.Parent = game:GetService("Lighting")
local Sunset = Instance.new("Sky")
Sunset.Name = "Sunset"
Sunset.SkyboxUp = "rbxassetid://323493360"
Sunset.SkyboxLf = "rbxassetid://323494252"
Sunset.SkyboxBk = "rbxassetid://323494035"
Sunset.SkyboxFt = "rbxassetid://323494130"
Sunset.SkyboxDn = "rbxassetid://323494368"
Sunset.SunAngularSize = 14
Sunset.SkyboxRt = "rbxassetid://323494067"

Sunset.Parent = game:GetService("Lighting")
local Takayama = Instance.new("ColorCorrectionEffect")
Takayama.Name = "Takayama"
Takayama.Enabled = false
Takayama.Saturation = -0.3
Takayama.Contrast = 0.1
Takayama.TintColor = Color3.fromRGB(235, 214, 204)

Takayama.Parent = game:GetService("Lighting")
local L = game:GetService("Lighting")
L.Brightness = 2.14
L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
L.ClockTime = 6.7
L.FogColor = Color3.fromRGB(94, 76, 106)
L.FogEnd = 1000
L.FogStart = 0
L.ExposureCompensation = 0.24
L.ShadowSoftness = 0
L.Ambient = Color3.fromRGB(59, 33, 27)




end})

local button = section:Button({Name = "remove map", Callback = function()game.Workspace.GameMap:Destroy()
 end})

local section = aimbot:Section({Name = "other guis(idk if they work)", column = 2})

-- object:Hide()
-- object:Show()

local button = section:Button({Name = "Attablocks gui", Callback = function()loadstring(game:HttpGet('https://raw.githubusercontent.com/bockatta/Atta/main/Assassin%20Shitter'))();
end})

local button = section:Button({Name = "spritzsploit gui", Callback = function()local old = getrenv().gcinfo

getrenv().gcinfo = function(...)

    return wait(9e9)

end



_G.Toggle = false

_G.Toggle2 = false

_G.autofarmtoggle = false



local noclip = false

local Camera = game:GetService("Workspace").CurrentCamera;

local Mouse = game:GetService("Players").LocalPlayer:GetMouse();

local Players = game:GetService("Players");

local Player = Players.LocalPlayer;

local CoreGui = game.CoreGui

local ContentProvider = game.ContentProvider

local RobloxGuis = {"RobloxGui", "TeleportGui", "RobloxPromptGui", "RobloxLoadingGui", "PlayerList", "RobloxNetworkPauseNotification", "PurchasePrompt", "HeadsetDisconnectedDialog", "ThemeProvider", "DevConsoleMaster"}

getgenv().noclip = false 



FOV_Circle = Drawing.new("Circle");

FOV_Circle.Color = Color3.fromRGB(255,255,255);

FOV_Circle.Thickness = 1.5;

FOV_Circle.NumSides = 13;

FOV_Circle.Radius = 150;

FOV_Circle.Visible = false;

FOV_Circle.Filled = false;



FOV_Circle2 = Drawing.new("Circle");

FOV_Circle2.Color = Color3.fromRGB(255,255,255);

FOV_Circle2.Thickness = 1.5;

FOV_Circle2.NumSides = 13;

FOV_Circle2.Radius = 150;

FOV_Circle2.Visible = false;

FOV_Circle2.Filled = false;



game:GetService('RunService').Stepped:connect(function()

    FOV_Circle.Position = Vector2.new(Mouse.X, Mouse.Y + 37)

end)



game:GetService('RunService').Stepped:connect(function()

    FOV_Circle2.Position = Vector2.new(Mouse.X, Mouse.Y + 37)

end)



game:GetService("UserInputService").InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1 and _G.Toggle == true then

        

        task.wait(.35);

    

        local function ClosestPlayerToCursor()

            local Closest = nil;

            local Distance = 9e9;

            for i, v in pairs(game:GetService("Players"):GetPlayers()) do

                if v ~= Player then

                    if Workspace[v.Name]:FindFirstChild("Humanoid") and Workspace[v.Name].Humanoid.Health ~= 0 then

                        local Position = Camera:WorldToViewportPoint(Workspace[v.Name].HumanoidRootPart.Position);

                        local Magnitude = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude;

                        if Magnitude < Distance and Magnitude < FOV_Circle.Radius then

                            Closest = workspace[v.Name];

                            Distance = Magnitude;

                        end

                    end

                end

            end

            return Closest

        end



        local ThrowAtTarget = function(args1, args2, args3)

            return game:GetService("ReplicatedStorage").Remotes.ThrowKnife:FireServer(args1,args2,args3);

        end

        

        ThrowAtTarget(workspace[ClosestPlayerToCursor().Name].Head.Position, 0, CFrame.new());

        

    end

end)



function GetTime(Distance, Speed)

    local Time = Distance / Speed

    return Time

end



function spritzTween(targetpart,spritzspeed)

    local Speed = spritzspeed  local Distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - targetpart.Position).magnitude local Time = GetTime(Distance, Speed) local TweenService = game:GetService("TweenService") local spritzttable = TweenInfo.new( Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,  0, false, 0 ) local Tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,spritzttable,{CFrame = targetpart.CFrame}) Tween:Play()

end 



local function FilterTable(tbl)

    local context = syn_context_get()

    syn_context_set(7)

    local new = {}

    for i,v in ipairs(tbl) do --roblox iterates the array part

        if typeof(v) ~= "Instance" then

            table.insert(new, v)

        else

            if v == CoreGui or v == game then

                --insert only the default roblox guis

                for i,v in pairs(RobloxGuis) do

                    local gui = CoreGui:FindFirstChild(v)

                    if gui then

                        table.insert(new, gui)

                    end

                end



                if v == game then

                    for i,v in pairs(game:GetChildren()) do

                        if v ~= CoreGui then

                            table.insert(new, v)

                        end

                    end

                end

            else

                if not CoreGui:IsAncestorOf(v) then

                    table.insert(new, v)

                else

                    --don't insert it if it's a descendant of a different gui than default roblox guis

                    for j,k in pairs(RobloxGuis) do

                        local gui = CoreGui:FindFirstChild(k)

                        if gui then

                            if v == gui or gui:IsAncestorOf(v) then

                                table.insert(new, v)

                                break

                            end

                        end

                    end

                end

            end

        end

    end

    syn_context_set(context)

    return new

end



local old

old = hookfunc(ContentProvider.PreloadAsync, function(self, tbl, cb)

    if self ~= ContentProvider or type(tbl) ~= "table" or type(cb) ~= "function" then --note: callback can be nil but in that case it's useless anyways

        return old(self, tbl, cb)

    end



    --check for any errors that I might've missed (such as table being {[2] = "something"} which causes "Unable to cast to Array")

    local err

    task.spawn(function() --TIL pcalling a C yield function inside a C yield function is a bad idea ("cannot resume non-suspended coroutine")

        local s,e = pcall(old, self, tbl)

        if not s and e then

            err = e

        end

    end)

   

    if err then

        return old(self, tbl) --don't pass the callback, just in case

    end



    tbl = FilterTable(tbl)

    return old(self, tbl, cb)

end)



local old

old = hookmetamethod(game, "__namecall", function(self, ...)

    local method = getnamecallmethod()

    if self == ContentProvider and (method == "PreloadAsync" or method == "preloadAsync") then

        local args = {...}

        if type(args[1]) ~= "table" or type(args[2]) ~= "function" then

            return old(self, ...)

        end



        local err

        task.spawn(function()

            setnamecallmethod(method) --different thread, different namecall method

            local s,e = pcall(old, self, args[1])

            if not s and e then

                err = e

            end

        end)



        if err then

            return old(self, args[1])

        end



        args[1] = FilterTable(args[1])

        setnamecallmethod(method)

        return old(self, args[1], args[2])

    end

    return old(self, ...)

end)



local mt = getrawmetatable(game);

make_writeable(mt);

local old_index = mt.__index;



mt.__index = function(a, b)

if tostring(a) == "HumanoidRootPart" then

if tostring(b) == "Size" then

return Vector3.new(2, 2, 1);

end

end

return old_index(a, b);

end



local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "SpritzSploit [ASSASSIN] Dev Access", HidePremium = false, SaveConfig = true, ConfigFolder = "🥸", IntroEnabled = false})

local CombatTab = Window:MakeTab({

    Name = "Combat",

    PremiumOnly = false

})

CombatTab:AddToggle({

    Name = "Silent Aim",

    Default = false,

    Callback = function(Value)

        _G.Toggle = Value

    end

})

local AutoTab = Window:MakeTab({

    Name = "Auto",

    PremiumOnly = false

})

AutoTab:AddToggle({

    Name = "Auto Farm",

    Default = false,

    Callback = function(Value)

        _G.autofarmtoggle = Value

        noclip = Value

    end

})

local Tab = Window:MakeTab({

	Name = "Hitbox",

	PremiumOnly = false

})

local Section = Tab:AddSection({

	Name = "Hitbox Settings"

})

Tab:AddToggle({

	Name = "Hitbox Expander",

	Default = false,

	Callback = function(Value)

	if Value == true then

	    getgenv().OFFON = true

	    getgenv().ReSizeXCV = getgenv().SizeXCV

	    getgenv().TransparencyXCV = 0.7

	    getgenv().ColourXCV = Color3.fromRGB(163, 162, 165)

	    else

	        if Value == false then

	            getgenv().OFFON = false

	            getgenv().SizeXCVs = Vector3.new(2,2,1)

	            getgenv().TransparencyXCV = 1

	            getgenv().ColourXCV = Color3.fromRGB(163, 162, 165)

	end

        end

	end    

})

Tab:AddSlider({

	Name = "Hitbox Size",

	Min = 0,

	Max = 100,

	Default = 2,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "Hitbox",

	Callback = function(Value)

	    if getgenv().OFFON == true then do

		getgenv().SizeXCV = Vector3.new(Value,Value,Value)

		getgenv().ReSizeXCV = SizeXCV

		end

	    end

end

})

Tab:AddColorpicker({

	Name = "Hitbox Colour",

	Default = Color3.fromRGB(255, 0, 0),

	Callback = function(Value)

	    if getgenv().OFFON == true then do

		getgenv().ColourXCV = Value

	    end

	end

	end	  

})

local VisTab = Window:MakeTab({

    Name = "Visuals",

    PremiumOnly = false

})

VisTab:AddToggle({

    Name = "Fov Toggle",

    Default = false,

    Callback = function(Value)

        FOV_Circle.Visible = Value

    end

})

VisTab:AddSlider({

	Name = "FOV Size",

	Min = 0,

	Max = 300,

	Default = 150,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "Size",

	Callback = function(Value)

        FOV_Circle.Radius = Value

        FOV_Circle2.Radius = Value

    end

})

local MiscTab = Window:MakeTab({

	Name = "Misc",

	PremiumOnly = false

})



MiscTab:AddButton({

	Name = "Server Hop",

	Callback = function()

      		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)

  	end    

})



local LocalTab = Window:MakeTab({

    Name = "Local Player",

    premiumOnly = false

})



getgenv().Infjump = false

LocalTab:AddToggle({

    Name = "Infinite Jump",

    Default = false,

    Callback = function(Value)

        Infjump = Value

    end

})



LocalTab:AddToggle({

    Name = "Noclip",

    Default = false,

    Callback = function(Value)

        noclip = Value

    end

})



spawn(function()

    game:GetService('RunService').RenderStepped:connect(function()

        pcall(function()

            while _G.autofarmtoggle == true do

                spritzTween(game.Workspace[game.Players.LocalPlayer.PlayerGui.ScreenGui:WaitForChild("UI"):WaitForChild("Target"):WaitForChild("TargetText").Text].HumanoidRootPart,30)

                game.workspace.Gravity = 0

                wait(0.1)

            end

        end)

    end)

end)



spawn(function()

    game:GetService('RunService').RenderStepped:connect(function()

        pcall(function()      

            while _G.autofarmtoggle == true do

                wait(0.8)

                mouse1click()

            end

        end)

    end)

end)



spawn(function()

    game:GetService('RunService').RenderStepped:connect(function()

        pcall(function()

            while _G.autofarmtoggle == false do

                if _G.autofarmtoggle == false then

                    game.workspace.Gravity = 196.2

                end

                wait(10)

            end

        end)

    end)

end)



spawn(function()

    game:GetService('RunService').RenderStepped:connect(function()

        pcall(function()

            if _G.Toggle2 then

                for i, v in pairs(game:GetService("Workspace").KnifeHost.PowerUps:GetDescendants()) do

                    if v:IsA("Part") then

                        v.Archivable = false

                    end

                end

            end

        end)

    end)

end)



spawn(function()

    game:GetService('RunService').RenderStepped:connect(function()

        pcall(function()

            if _G.Toggle2 then

                for i, v in pairs(game:GetService("Workspace").KnifeHost:GetDescendants()) do

                    if v:IsA("Part") then

                        if v.Archivable == true then

                            local PlayerPosition = ClosestPlayerToCursor().baseHitbox.CFrame

                            v.CFrame = PlayerPosition

                        end

                    end

                end

            end

        end)

    end)

end)



spawn(function()

    game:GetService('RunService').RenderStepped:connect(function()

        char = game.Players.LocalPlayer.Character 

        while noclip do 

            for _,v in pairs(char:children()) do 

                pcall(function() if v.className == "Part" then v.CanCollide = false elseif v.ClassName == "Model" then

                v.Head.CanCollide = false end end) 

            end 

            game:service("RunService").Stepped:wait() 

        end

    end)

end)



spawn(function()

    game:GetService('RunService').RenderStepped:connect(function()

        game:GetService("UserInputService").JumpRequest:Connect(function()

            if Infjump then

                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")

            end

        end)

    end)

end)



spawn(function()

    game:GetService('RunService').RenderStepped:connect(function()

for i,v in pairs(game:GetService('Players'):GetPlayers()) do

    if v.Name ~= game.Players.LocalPlayer.Name then

game.Workspace[v.Name].HumanoidRootPart.Size = SizeXCV

game.Workspace[v.Name].HumanoidRootPart.Transparency = TransparencyXCV or SizeXCVs

game.Workspace[v.Name].HumanoidRootPart.Color = ColourXCV

game.Workspace[v.Name].HumanoidRootPart.Material = "Neon"

game.Workspace[v.Name].HumanoidRootPart.CanCollide = false

wait()

end

end

end)

end)
end})

local button = section:Button({Name = "barcode[+]", Callback = function()loadstring(game:HttpGet("https://raw.githubusercontent.com/IIIlllIIIAlt/Assassin-Free/main/free%20Barcode-obfuscated.lua"))()
end})

local button = section:Button({Name = "A7assassin", Callback = function()loadstring(game:HttpGet('https://raw.githubusercontent.com/bockatta/Shitter/main/Loader'))();
end})

local aimbot = main:Tab("visuals/esp")

local section = aimbot:Section({Name = "not done yet", column = 1})

-- object:Hide()
-- object:Show()

local button = section:Button({Name = "Button", Callback = function()
end})

local button = section:Button({Name = "Button", Callback = function()
end})

local button = section:Button({Name = "Button", Callback = function()
end})


local aimbot = main:Tab("hitbox expander")

local section = aimbot:Section({Name = "nigger hitbox", column = 1})

-- object:Hide()
-- object:Show()

local button = section:Button({Name = "target hitbox", Callback = function()getfenv().hbe = true
    if getfenv().hbe == true then
    local mt = getrawmetatable(game);
    make_writeable(mt);
    local old_index = mt.__index;
    
    mt.__index = function(a, b)
    if tostring(a) == "HumanoidRootPart" then
    if tostring(b) == "Size" then
    return Vector3.new(2, 2, 1);
    end
    end
    return old_index(a, b);
    end
    
    
    if shared.ShushHighlight then shared.ShushHighlight.stop();end;
    
    local Connection = {};
    Connection.__index = Connection;
    Connection.__tostring = function(self)
        return self.Name;
    end;
    
    Connection.new = function(Event, Func, Once)
        return setmetatable({Name = Event.Name .. ".Connection", Event = Event, Func = Func, Once = Once}, Connection);
    end;
    
    Connection.Disconnect = function(self)
        table.remove(self.Event._connections, table.find(self.Event._connections, self));
    end;
    
    
    local Event = {};
    Event.__index = Event;
    Event.__tostring = function(self)
        return self.Name;
    end;
    
    Event.new = function(Name)
        return setmetatable({Name = Name or "Event", _connections={}, _waits={}}, Event);
    end;
    
    Event.Connect = function(self, Func)
        local connection = Connection.new(self, Func);
        table.insert(self._connections, connection);
        return connection;
    end;
    Event.Fire = function(self, ...)
        local Args = {...};
        task.spawn(function()
            for I, Con in next, self._connections do
                Con.Func(unpack(Args));
            end;
        end);
    end;
    
    
    local Target;
    
    local PlayerService = game:GetService("Players");
    local LP = PlayerService.LocalPlayer;
    
    local FFC = game.FindFirstChild;
    
    local TargetObject = LP:WaitForChild("PlayerGui").ScreenGui.UI.Target;
    local TargetText = TargetObject.TargetText;
    
    do
        local T = TargetText.Text;
        local V = TargetText.Visible;
        local V2 = TargetObject.Visible;
    
        if V and V2 then
            if T and #T > 1 then
                Target = FFC(PlayerService, T);
            end;
        end;
    end;
    
    local INSTChanged = Event.new("InstChanged");
    local TARGETChanged = Event.new("TargetChanged");
    local HITBOXChanged = Event.new("HitboxChanged");
    local TARGETHITBOXChanged = Event.new("TargetHitboxChanged");
    
    local SettingsProxy = {Target = true};
    
    local INSTProxy = {
        FillColor = Color3.new(0, 1, 0),
        FillTransparency = 0.5,
    
        OutlineColor = Color3.new(1, 1, 1),
        OutlineTransparency = 0;
    };
    local TARGETProxy = {
        FillColor = Color3.new(1, 0, 0),
        FillTransparency = 0.5,
    
        OutlineColor = Color3.new(1, 1, 1),
        OutlineTransparency = 0;
    };
    local HITBOXProxy = {
        Size = Vector3.new(2,2,1),
        Transparency = 1
    };
    local TARGETHITBOXProxy = {
        Size = Vector3.new(2,2,1),
        Transparency = 1
    };
    
    local Settings = setmetatable({}, {__index = SettingsProxy, __newindex = function(self, key, value)
        if key == "Target" then 
            for i,v in next, TARGETProxy do
                TARGETChanged:Fire(i,v);
            end;
        end;
        
        SettingsProxy[key] = value;
    end});
    Settings.INST = setmetatable({}, {__index = INSTProxy, __newindex = function(self, Key, Value)
        if INSTProxy[Key] then
            INSTChanged:Fire(Key, Value);
            INSTProxy[Key] = Value;
            
            return;
        end;
        
        return error(tostring(Key), " is not a valid key");
    end});
    Settings.TARGET = setmetatable({}, {__index = TARGETProxy, __newindex = function(self, Key, Value)
        if TARGETProxy[Key] then
            TARGETChanged:Fire(Key, Value);
            TARGETProxy[Key] = Value;
            
            return;
        end;
        
        return error(tostring(Key), " is not a valid key");
    end});
    Settings.HITBOX = setmetatable({}, {__index = HITBOXProxy, __newindex = function(self, Key, Value)
        if HITBOXProxy[Key] then
            HITBOXChanged:Fire(Key, Value);
            HITBOXProxy[Key] = Value;
            
            return;
        end;
        
        return error(tostring(Key), " is not a valid key");
    end});
    Settings.TARGETHITBOX = setmetatable({}, {__index = TARGETHITBOXProxy, __newindex = function(self, Key, Value)
        if TARGETHITBOXProxy[Key] then
            TARGETHITBOXChanged:Fire(Key, Value);
            TARGETHITBOXProxy[Key] = Value;
            
            return;
        end;
        
        return error(tostring(Key), " is not a valid key");
    end});
    
    local Highlight = {
        Active = true,
        Connections = {},
        Settings = Settings
    };
    Highlight.__index = Highlight;
    
    Highlight.new = function(Character, Player)
        local cache = {};
        
        local Inst = Instance.new("Highlight");
        Inst.Adornee = Character;
        Inst.Parent = Character;
        
        if Settings.Target and Target and Player == Target then
            for k,v in next, TARGETProxy do
                Inst[k] = v;
                cache[k] = v;
            end;
        else
            for k, v in next, INSTProxy do
                Inst[k] = v;
                cache[k] = v;
            end;
        end;
        
        local SettingsCon; SettingsCon = INSTChanged:Connect(function(k,v)
            if cache[k] == v then return;end;
            if Settings.Target and Target and Target and Player == Target then return;end;
            Inst[k] = v;
            -- cache[k] = v;
        end);
        local TargetCon; TargetCon = TARGETChanged:Connect(function(k,v)
            if cache[k] == v then return;end;
            if not (Settings.Target and Target and Player == Target) then return;end;
            Inst[k] = v;
            -- cache[k] = v;
        end);
        Inst.Changed:Connect(function(P)
            cache[P] = Inst[P];
        end);
    
        
        local highlight = setmetatable({
            Active = true,
            Inst = Inst,
            Character = Character,
            SettingsCon = SettingsCon,
            TargetCon = TargetCon;
        }, Highlight);
        
        return highlight;
    end;
    
    Highlight.Destroy = function(self)
        if not self.Active then return;end;
        self.Active = false;
        self.SettingsCon:Disconnect();
        self.TargetCon:Disconnect();
        self.Inst:Destroy();
    end;
    
    local Extender = {};
    Extender.__index = Extender;
    
    Extender.new = function(Character, Player)
        local HRP = Character:FindFirstChild("HumanoidRootPart");
        
        local HitboxCon = HITBOXChanged:Connect(function(k,v)
            if not HRP then return;end;
            if Settings.Target and Target and Target and Player == Target then return;end;
            HRP[k] = v;
        end);
        local TargetHitboxCon = TARGETHITBOXChanged:Connect(function(k,v)
            if not HRP then return;end;
            if not (Settings.Target and Target and Target and Player == Target) then return;end;
            HRP[k] = v;
        end);
    
        local extender = setmetatable({
            Active = true,
            HitboxCon = HitboxCon,
            TargetHitboxCon = TargetHitboxCon,
            HRP = HRP,
        }, Extender);
    
        task.spawn(function()
            if not HRP then repeat task.wait();HRP = Character:FindFirstChild("HumanoidRootPart");until HRP;end;
            extender.HRP = HRP;
    
            if Settings.Target and Target and Player == Target then
                for k,v in next, TARGETHITBOXProxy do
                    HRP[k] = v;
                end;
            else
                for k, v in next, HITBOXProxy do
                    HRP[k] = v;
                end;
            end;
        end);
    
        return extender;
    end;
    Extender.Destroy = function(self)
        if not self.Active then return;end;
        self.Active = false;
        self.HitboxCon:Disconnect();
        self.TargetHitboxCon:Disconnect();
    end;
    
    local function GetCharacter(Player)
        return workspace:FindFirstChild(Player.Name);
    end;
    
    local PlayerObject = {};
    PlayerObject.__index = PlayerObject;
    
    PlayerObject.new = function(Player)
        if typeof(Player) ~= "Instance" or Player == LP then return;end;
        local playerobject = setmetatable({
            Active = true,
            Player = Player,
            Character = GetCharacter(Player) or Player.CharacterAdded:Wait();
        }, PlayerObject);
    
        task.spawn(function()
            playerobject.Highlight = Highlight.new(playerobject.Character, Player);
        end);
        task.spawn(function()
            playerobject.Extender = Extender.new(playerobject.Character, Player);
        end);
    
        local con = Player.CharacterAdded:Connect(function(Character)
            task.spawn(function()
                if playerobject.Highlight then playerobject.Highlight:Destroy();end;
                playerobject.Highlight = Highlight.new(Character, Player);
            end);
            task.spawn(function()
                if playerobject.Extender then playerobject.Extender:Destroy();end;
                playerobject.Extender = Extender.new(Character, Player);
            end);
        end);
        playerobject.CharacterAddedCon = con;
    
        PlayerObject[Player] = playerobject;
    
        return playerobject;
    end;
    
    PlayerObject.Destroy = function(self)
        if not self.Active then return;end;
        
        self.Active = false;
        if self.Highlight then self.Highlight:Destroy();end;
        if self.Extender then self.Extender:Destroy();end;
        self.CharacterAddedCon:Disconnect();
        
    end;
    
    Highlight.HandlePlayers = function()
        for I, Player in next, PlayerService:GetPlayers() do
            PlayerObject.new(Player);
        end;
    
        table.insert(Highlight.Connections, PlayerService.PlayerAdded:Connect(PlayerObject.new));
        table.insert(Highlight.Connections, PlayerService.PlayerRemoving:Connect(function(Player)
            if PlayerObject[Player] then
                PlayerObject[Player]:Destroy();
            end;
        end));
    end;
    Highlight.stop = function()
        if not Highlight.Active then return;end;
        
        Highlight.Active = false;
        for I, V in next, PlayerObject do
            if typeof(I) == "Instance" then
                V:Destroy();
            end;
        end;
        
        for i,v in next, Highlight.Connections do
            v:Disconnect();
        end;
    end;
    
    local ReplicatedStorage = game:GetService("ReplicatedStorage");
    local Remotes = ReplicatedStorage.Remotes;
    local HideTarget = Remotes.HideTarget;
    local UpdateTarget = Remotes.UpdateTarget;
    
    table.insert(Highlight.Connections, HideTarget.OnClientEvent:Connect(function()
        Target = nil;
    
        for k,v in next, INSTProxy do
            INSTChanged:Fire(k,v);
        end;
    end));
    table.insert(Highlight.Connections, UpdateTarget.OnClientEvent:Connect(function(T)
        Target = T;
    
        local p = PlayerObject[Target]
        local h = p and p.Highlight;
        
        if h then
            for k,v in next, TARGETProxy do
                h.Inst[k] = v;
            end;
        end;
    
        local e = p and p.Extender;
        if e then
            for k,v in next, TARGETHITBOXProxy do
                e.HRP[k] = v;
            end;
        end;
    end));
    
    Highlight.HandlePlayers();
    shared.ShushHighlight = Highlight;
    local Settings = shared.ShushHighlight.Settings;
    
    Settings.HITBOX.Size = Vector3.new(8,8,8);
    Settings.HITBOX.Transparency = 0.5;
    Settings.TARGETHITBOX.Size = Vector3.new(15,15,15);
    Settings.TARGETHITBOX.Transparency = 0.5;
    
    Settings.INST.FillColor = Color3.fromRGB(50, 205, 50);
    Settings.TARGET.OutlineColor = Color3.fromRGB(255, 255, 255);
    elseif getfenv().hbe == false then
        print('disabled hbe')
    end
end})

local aimbot = main:Tab("autofarm")

local section = aimbot:Section({Name = "autofarm", column = 1})

-- object:Hide()
-- object:Show()

local button = section:Button({Name = "autofarm1", Callback = function()game:GetService("AdService"):ClearAllChildren()
    wait(1)
    
    local Player = game.Players.LocalPlayer
    local wS = game.Workspace
    local cam = wS.CurrentCamera
    local mouse = Player:GetMouse()
    local ClosestPlr = function()
        local Closest = nil
        local Distance = 9e9;
        for i,v in pairs(game.Players:GetPlayers()) do
            if v ~= Player then
                if wS[v.Name]:FindFirstChild("Humanoid") and wS[v.Name].Humanoid.Health ~= 0 then
                    local pos = cam:WorldToViewportPoint(wS[v.Name].HumanoidRootPart.Position)
                    local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude;
                    if magnitude < Distance then
                        Closest = wS[v.Name]
                        Distance = magnitude
                    end
                end
            end
        end
        return Closest
    end
    
    game:GetService('RunService').RenderStepped:connect(function()
        for i,v in pairs(game.Workspace.KnifeHost:GetDescendants()) do
            if v:IsA"Part" then
                if v.Archivable == true then
                    local plrpos  = ClosestPlr().baseHitbox.CFrame
                    v.CFrame = plrpos
                end
            end
        end
    end)
    
    game:GetService("RunService").Stepped:Connect(function()
        local function randompart()
            local hits = {
                0,
                1,
                2,
                -1,
                -2,
            }
            return hits[math.random(1, #hits)]
        end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Knife") then
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if v.Name == game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.UI.Target.TargetText.Text then
                            if v.Name ~= game.Players.LocalPlayer.Name then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(Game.Players.LocalPlayer.Backpack.Knife)
                                wait(.3)
                                local Target = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.UI.Target.TargetText.Text
                                local x = game.Workspace[Target].HumanoidRootPart.Position.X + randompart()
                                local y = game.Workspace[Target].HumanoidRootPart.Position.Y + randompart()
                                local z = game.Workspace[Target].HumanoidRootPart.Position.Z + randompart()
                                local args = {
                                    [1] = Vector3.new(x, y, z),
                                    [2] = 0,
                                    [3] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                                }
                                game:GetService("ReplicatedStorage").Remotes.ThrowKnife:FireServer(unpack(args))
                                wait(.1)
                                game:GetService("Players").localPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                                wait(.6)
                            end
                        end
                    end
                end
    end)
    
    function GetTime(Distance, Speed)
        local Time = Distance / Speed
        return Time
    end
    
    function oreoTween(targetpart,oreospeed)
        local Speed = oreospeed  local Distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - targetpart.Position).magnitude local Time = GetTime(Distance, Speed) local TweenService = game:GetService("TweenService") local oreottable = TweenInfo.new( Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,  0, false, 0 ) local Tween = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,oreottable,{CFrame = targetpart.CFrame}) Tween:Play()
    end
    local Player = game:GetService("Players").LocalPlayer
    local wS = game:GetService("Workspace")
    
    local ClosestPlayer = function()
        local Closest = nil
        local Distance = 9e9
        for i, v in next, game:GetService("Players"):GetPlayers() do
            if v.Name ~= Player.Name then
                if wS[v.Name] and wS[v.Name]:FindFirstChild("Humanoid") and wS[v.Name]:FindFirstChild("Humanoid").Health ~= 0 then
                    local Magnitude = (Player.Character.Head.Position - wS[v.Name].Head.Position).Magnitude
                    if Magnitude < Distance then
                        Closest = wS[v.Name]
                        Distance = Magnitude
                        end
                    end
                end
            end
        return Closest
    end
    
    local Stab = 10
    
    spawn(function()
        while Stab > 0 do
            repeat wait() until Player.Character:FindFirstChild("Head")
                if Player:DistanceFromCharacter(ClosestPlayer().Head.Position) <= 6.5 then
                    Player.PlayerScripts.localknifehandler.HitCheck:Fire(ClosestPlayer())
                    wait(.7)
                else
                    wait()
                end
        end
    end)
    
    game:GetService("RunService").Stepped:Connect(function()
    game.Workspace.Gravity = 20
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        oreoTween(game.Workspace[game.Players.LocalPlayer.PlayerGui.ScreenGui:WaitForChild("UI"):WaitForChild("Target"):WaitForChild("TargetText").Text].HumanoidRootPart,30)
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            pcall(function()
                if v.ClassName == "Part" then
                    v.CanCollide = false
                elseif v.ClassName == "Model" then
                    v.Head.CanCollide = false
                end
            end)
        end
    end)
    
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    game:GetService('RunService').RenderStepped:Connect(function()
    hrp.CFrame = hrp.CFrame * CFrame.Angles(0,math.rad(1.5),0)
    wait(1)
    game.Players.LocalPlayer.Character['Right Leg']:remove()
    game.Players.LocalPlayer.Character['Left Leg']:remove()
    game.Players.LocalPlayer.Character['Left Arm']:remove()
    end)
    
    repeat wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')
    
    local lp,po,ts = game:GetService('Players').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('TeleportService')
    
    po.ChildAdded:connect(function(a)
        if a.Name == 'ErrorPrompt' then
            repeat
                ts:Teleport(game.PlaceId)
                wait(2)
            until false
        end
    end)
end})

local button = section:Button({Name = "Button", Callback = function()game.Players.LocalPlayer.Character.Humanoid:EquipTool(Game.Players.LocalPlayer.Backpack.Knife)
 end})
