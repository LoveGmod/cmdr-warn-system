return {
	Name = "getWarnsId";
	Aliases = {"gwid"};
	Description = "Get the warns of a player.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "integer";
			Name = "user-id";
			Description = "The user id of the player to get the warns.";
		}
	};
}