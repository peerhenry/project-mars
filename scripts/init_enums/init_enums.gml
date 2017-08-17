
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
	delivering_mdu,
	move_to_attack,
	constructing,
	executing_assignment,
	in_combat
}