local HTTPService = game:GetService("HttpService")

return function(context, player)
	local data = nil
	local succes, errormessage = pcall(function()
		data = game:GetService("DataStoreService"):GetDataStore("warns"):GetAsync(player.UserId)
	end)
	
	if succes and data == nil then return "@"..player.Name.." has no warns." end
	
	local finalData = HTTPService:JSONDecode(data)
	
	if succes then
		if finalData.totalWarns > 0 then
			local str = "@"..player.Name.." have "..tostring(finalData.totalWarns).." warn(s) :\n"
			for i, v in pairs(finalData.warns) do
				str = str.."\nId : "..v.id.." | Moderator : @"..game:GetService("Players"):GetNameFromUserIdAsync(v.mod).." | Date : "..DateTime.fromUnixTimestampMillis(v.date):FormatLocalTime("LLL", "en-gb").." UTC | Reason : "..v.reason
			end
			return str
		else
			return "@"..player.Name.." has no warns."	
		end
	else
		warn(errormessage)
		return "An error has occured while getting the warns of the player, check the console for more informations."	
	end
end