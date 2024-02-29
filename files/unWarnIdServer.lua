local HTTPService = game:GetService("HttpService")

return function(context, playerUserId, warnId)
	local data = nil
	local succes, errormessage = pcall(function()
		data = game:GetService("DataStoreService"):GetDataStore("warns"):GetAsync(playerUserId)
	end)
	
	if succes and data == nil then return "@"..game:GetService("Players"):GetNameFromUserIdAsync(playerUserId).." has no warns." end

	local finalData = HTTPService:JSONDecode(data)

	if succes then
		if finalData.totalWarns > 0 then
			local found = false
			
			for i, v in pairs(finalData.warns) do
				if v.id == warnId then
					found = true
					table.remove(finalData.warns, i)
					finalData.totalWarns -= 1
				end
			end
			
			if not found then return "The warn "..warnId.." doesn't exists for @"..game:GetService("Players"):GetNameFromUserIdAsync(playerUserId).."." end
			
			finalData = HTTPService:JSONEncode(finalData)
			game:GetService("DataStoreService"):GetDataStore("warns"):SetAsync(playerUserId, finalData)
			return "Removed warn "..warnId.." to @"..game:GetService("Players"):GetNameFromUserIdAsync(playerUserId).."."
		else
			return "@"..game:GetService("Players"):GetNameFromUserIdAsync(playerUserId).." has no warns."
		end
	else
		warn(errormessage)
		return "An error has occured while getting the warns of the player, check the console for more informations."	
	end
end