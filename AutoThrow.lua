-- This script would be amazing to use with a autofarm
spawn(function()
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
    while wait() do
        pcall(function()
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
    end
end)
