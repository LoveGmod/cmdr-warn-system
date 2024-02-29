return {
	Name = "unWarn";
	Aliases = {"uw"};
	Description = "Un-warn a player.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "player";
			Name = "player";
			Description = "The player to remove the warn.";
		},
		{
			Type = "integer";
			Name = "warn-id";
			Description = "The warn id to remove.";
		}
	};
}