/// @description Trigger Callback

// Is triggered if by objective if stage_complete flag is true.
// Increments the stage counter and adds new objective
stage_complete = false;
stage++;

switch(stage)
{
	case 1:
		var objective = scr_add_tutorial_objective(
			id,
			"Select astronaut Phillips.",
			"Left click on astronaut Phillips to select him."
		);
		scr_alert_player(objective.name);
		break;
	case 2:
		var objective = scr_add_tutorial_objective(
			id,
			"Equip Phillips with a suit.",
			"With astronaut Phillips selected, right click on the suit closet."
		);
		scr_alert_player(objective.name);
		break;
}