local HTTPService = game:GetService("HttpService")

return function(context, player, warnId)
	local data = nil
	local succes, errormessage = pcall(function()
		data = game:GetService("DataStoreService"):GetDataStore("warns"):GetAsync(player.UserId)
	end)
	
	if succes and data == nil then return "@"..player.Name.." has no warns." end

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
			
			if not found then return "The warn "..warnId.." doesn't exists for @"..player.Name.."." end
			
			finalData = HTTPService:JSONEncode(finalData)
			game:GetService("DataStoreService"):GetDataStore("warns"):SetAsync(player.UserId, finalData)
			return "Removed warn "..warnId.." to @"..player.Name.."."
		else
			return "@"..player.Name.." has no warns."
		end
	else
		warn(errormessage)
		return "An error has occured while getting the warns of the player, check the console for more informations."	
	end
end