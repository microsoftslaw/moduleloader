--[[
Insert a Module Script in ReplicatedStorage named "Loader"
]]

local loader = {}

local runService = game:GetService("RunService")

function loader.loadAll()
	local replicatedStorage = game:GetService("ReplicatedStorage")
	local replicatedLoader = replicatedStorage:WaitForChild("Loader")
	local replicatedScripts = replicatedStorage:WaitForChild("Scripts")
	
	local serverAndClientScripts = nil
	
	if runService:IsServer() then
		local serverScriptService = game:GetService("ServerScriptService")
		local serverScripts = serverScriptService:WaitForChild("Scripts")
		local serverLoader = serverScriptService:WaitForChild("Loader")
		
		serverAndClientScripts = serverScripts
	elseif runService:IsClient() then
		local replicatedFirst = game:GetService("ReplicatedFirst")
		local clientScripts = replicatedFirst:WaitForChild("Scripts")
		local clientLoader = replicatedFirst:WaitForChild("Loader")

		serverAndClientScripts = clientScripts
	end
	
	for i, module in pairs(replicatedScripts:GetChildren()) do
		if module:IsA("ModuleScript") then
			module = require(module)
			if module.init then
				module.init()
			end
		end
	end
	
	for i, module in pairs(serverAndClientScripts:GetChildren()) do
		if module:IsA("ModuleScript") then
			module = require(module)
			if module.init then
				module.init()
			end
		end
	end
end

return loader
