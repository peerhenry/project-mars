//
switch(menu_focus_index)
{
	case menu_index_start:{
		room_goto_next();
		break;
	}
	case menu_index_options:{
		room_goto_next();
		break;
	}
	case menu_index_quit:{
		game_end();
		break;
	}
}