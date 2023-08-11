local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Legends of Speed  ⚡", "GrapeTheme")

local Tab = Window:NewTab("Main")
local Tabbb = Window:NewTab("Settings")

local Section = Tab:NewSection("Auto Farm")
local Sectionnn = Tabbb:NewSection("Map Configure")

Section:NewLabel("Script by tranquiLo#5457")

local mapName = "City" -- Default Map City Olsun

Sectionnn:NewDropdown("Select Map", "Name of The Map You Are In", {"City", "Snow City", "Magma City", "Desert"}, function(currentOption)
    mapName = currentOption
end)


local isAutoFarming = false
local isAutoFarmingg = false
local isAutoFarminggg = false


local function collectOrbs()
    local orbs = {
        { "collectOrb", "Yellow Orb", mapName },
        { "collectOrb", "Red Orb", mapName },
        { "collectOrb", "Blue Orb", mapName },
        { "collectOrb", "Orange Orb", mapName }
    }

    for _, args in ipairs(orbs) do
        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
    end
end

local function collectGem()
    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Gem", mapName)
end

local function otoRebirth()
    game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
end


Section:NewToggle("Step Farm", "Collecting Orbs For You", function(state)
    if state then
        isAutoFarming = true
        collectOrbs()
    else
        isAutoFarming = false
        print("Speed Farm OFF")
    end
end)

Section:NewToggle("Gem Farm", "Collecting Gems For You", function(state)
    if state then
        isAutoFarmingg = true
        collectGem()
    else
        isAutoFarmingg = false
        print("Gem Farm OFF")
    end
end)

Section:NewToggle("Auto Rebirth", "MAX Level = Auto Rebirth", function(state)
    if state then
        isAutoFarminggg = true
        otoRebirth()
    else
        isAutoFarminggg = false
        print("Gem Farm OFF")
    end
end)


spawn(function()
    while true do
        if isAutoFarming then
            collectOrbs()
        end
        wait()
    end
end)

spawn(function()
    while true do
        if isAutoFarmingg then
            collectGem()
        end
        wait()
    end
end)

spawn(function()
    while true do
        if isAutoFarminggg then
            otoRebirth()
        end
        wait()
    end
end)