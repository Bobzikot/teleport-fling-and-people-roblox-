local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Libarary.CreateLib("Teleporting", "RJTheme1")

local Tab = Window:NewTab ("teleport")

local Section = Tab:NewSection("Teleport")

Section:NewKeybind("Teleport", "KeybindInfo", Enum.KeyCode.Z, fuction()
    local players = game:GetService("Players"):GetPlayers()
local localCharacter = game.Players.LocalPlayer.Character
local visitedPlayers = {}
local hasTeleported = false
local previousCFrame = localCharacter.HumanoidRootPart.CFrame

while true do
    if hasTeleported then
        break
    end
    for _, player in pairs(players) do
        if player ~= game.Players.LocalPlayer and not visitedPlayers[player] then
            if player.Character then
                previousCFrame = localCharacter.HumanoidRootPart.CFrame
                localCharacter.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                wait(0.001) -- extremely fast teleportation
                localCharacter.HumanoidRootPart.CFrame = previousCFrame
                visitedPlayers[player] = true
            end
        end
    end
    if table.Count(visitedPlayers) == #players - 1 then
        hasTeleported = true
    end
end 
end)
