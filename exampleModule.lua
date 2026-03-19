--[[
Example module:

Modules must include the .init function, any code put within these functions are ran on startup.
]]

local testClientModule = {}

function testClientModule.init()
  	print("Module: " .. "{" .. script.Name .. "}" .. " initialized") -- Prints in console to test if module has been loaded.
end

return testClientModule
