return {
	Name = "warn";
	Aliases = {"w"};
	Description = "Warn a player.";
	Group = "DefaultAdmin";
	Args = {
		{
			Type = "player";
			Name = "player";
			Description = "The player to warn.";
		},
		{
			Type = "string";
			Name = "reason";
			Description = "The warn reason.";
		}
	};
}