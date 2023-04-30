loadstring(game:HttpGet("https://raw.githubusercontent.com/oz5d/5DScriptManager/main/scripts.lua"))()
getgenv().locationPrefix = "https://raw.githubusercontent.com/oz5d/5DScriptManager/main/scripts/"
getgenv().loadScript = function(scriptTableKey,scriptVersion)
	local scriptInfo = scripts[scriptTableKey]
	if scriptInfo == nil then
		error("Script table key invalid!: '"..scriptTableKey.."'")
	end
	scriptVersion = scriptVersion or scriptInfo.latestVersion
	if table.find(scriptInfo.versions,scriptVersion) == nil then
		error("Script version invalid!: '"..scriptVersion.."'")
	end
	loadstring(game:HttpGet(locationPrefix..scriptInfo.scriptRepository.."/"..scriptVersion.."/"..scriptInfo.fileName))()
end
loadScript("debug")
