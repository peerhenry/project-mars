/// @description Menu Select Event
switch(menu_focus_index)
{
	case menu_tutorial_index.basics:
		global.level_object_index = obj_tutorial_basics;
		room_goto(tutorial);
		break;
	case menu_tutorial_index.energy:
		global.level_object_index = obj_tutorial_energy;
		room_goto(tutorial);
		break;
	case menu_tutorial_index.water:
		global.level_object_index = obj_tutorial_water;
		room_goto(tutorial);
		break;
	case menu_tutorial_index.oxygen:
		global.level_object_index = obj_tutorial_oxygen;
		room_goto(tutorial);
		break;
	case menu_tutorial_index.back:
		event_user(1);
		break;
}