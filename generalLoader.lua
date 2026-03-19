--[[
Insert a client script in ReplicatedFirst and a server script in ServerScriptService named "Loader"
]]

local replicatedStorage = game:GetService("ReplicatedStorage")
local loader = require(replicatedStorage:WaitForChild("Loader"))

loader.loadAll()
