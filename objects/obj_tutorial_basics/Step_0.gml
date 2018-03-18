// Checks the stage condition and sets the stage complete flag
switch(stage)
{
	case 0:
		with(obj_wasd) exit;
		stage_complete = true;
		break;
	case 1:
		with(obj_astronaut) other.stage_complete = is_selected;
		break;
	case 2:
		with(obj_astronaut) other.stage_complete = wears_suit;
		break;
}