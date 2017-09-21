
enum wall_type
{
	horizontal,
	vertical,
	other,
	none
}

enum resource
{
	water,
	metal
}

enum astronaut_action // these are assigned to astronaut objects
{
	idle,
	moving_by_command,
	moving_to_construction,
	moving_to_shoot,
	fetching_mdu,
	delivering_mdu,
	constructing,
	executing_assignment,
	in_combat
}