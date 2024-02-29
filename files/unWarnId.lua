return {
	Name = "unWarnId";
	Aliases = {"uwid"};
	Description = "Un-warn a player by his user id.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "integer";
			Name = "user-id";
			Description = "The user id of the player to remove the warn.";
		},
		{
			Type = "integer";
			Name = "warn-id";
			Description = "The warn id to remove.";
		}
	};
}