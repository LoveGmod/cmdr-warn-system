local HTTPService = game:GetService("HttpService")

return function(context, playerUserId, reason)
	local data = nil
	local succes, errormessage = pcall(function()
		data = game:GetService("DataStoreService"):GetDataStore("warns"):GetAsync(playerUserId)
	end)
	
	if succes then
		local newWarn = {id = 1, mod = context.Executor.UserId, reason = reason, date = tostring(DateTime.now())}
		
		if data == nil then
			data = {nextId = 2, totalWarns = 1, warns = {newWarn}}
			local finalData = HTTPService:JSONEncode(data)
			game:GetService("DataStoreService"):GetDataStore("warns"):SetAsync(playerUserId, finalData)
		else
			local finalData = HTTPService:JSONDecode(data)
			finalData.totalWarns += 1
			newWarn.id = finalData.nextId
			finalData.nextId += 1
			table.insert(finalData.warns, newWarn)
			finalData = HTTPService:JSONEncode(finalData)
			game:GetService("DataStoreService"):GetDataStore("warns"):SetAsync(playerUserId, finalData)
		end
		
		return "@"..game:GetService("Players"):GetNameFromUserIdAsync(playerUserId).." warned."
	else
		warn(errormessage)
		return "An error has occured while warning the player, check the console for more informations."	
	end
end