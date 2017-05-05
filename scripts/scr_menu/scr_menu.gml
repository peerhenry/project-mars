//
switch(menu_focus_index)
{
	case menu_index_start:{
		var lid = layer_get_id("layer_fade");
		instance_create_layer(0, 0, lid, obj_fade);
		//layer_add_instance(lid, obj_fade);
		break;
	}
	case menu_index_options:{
		//room_goto_next();
		break;
	}
	case menu_index_quit:{
		game_end();
		break;
	}
}