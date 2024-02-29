local HTTPService = game:GetService("HttpService")

return function(context, player, reason)
	local data = nil
	local succes, errormessage = pcall(function()
		data = game:GetService("DataStoreService"):GetDataStore("warns"):GetAsync(player.UserId)
	end)
	
	if succes then
		local newWarn = {id = 1, mod = context.Executor.UserId, reason = reason, date = tostring(DateTime.now())}
		
		if data == nil then
			data = {nextId = 2, totalWarns = 1, warns = {newWarn}}
			local finalData = HTTPService:JSONEncode(data)
			game:GetService("DataStoreService"):GetDataStore("warns"):SetAsync(player.UserId, finalData)
		else
			local finalData = HTTPService:JSONDecode(data)
			finalData.totalWarns += 1
			newWarn.id = finalData.nextId
			finalData.nextId += 1
			table.insert(finalData.warns, newWarn)
			finalData = HTTPService:JSONEncode(finalData)
			game:GetService("DataStoreService"):GetDataStore("warns"):SetAsync(player.UserId, finalData)
		end
		
		return "@"..player.Name.." warned."
	else
		warn(errormessage)
		return "An error has occured while warning the player, check the console for more informations."	
	end
end