return {
	Name = "warnId";
	Aliases = {"wid"};
	Description = "Warn a player buy his user id.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "integer";
			Name = "user-id";
			Description = "The user id of the player to warn.";
		},
		{
			Type = "string";
			Name = "reason";
			Description = "The warn reason.";
		}
	};
}