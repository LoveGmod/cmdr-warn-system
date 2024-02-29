return {
	Name = "getWarns";
	Aliases = {"gw"};
	Description = "Get the warns of a player.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "player";
			Name = "player";
			Description = "The player to get the warns.";
		}
	};
}