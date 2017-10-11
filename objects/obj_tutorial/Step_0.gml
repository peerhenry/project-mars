
// TUTORIAL STEPS:
// - move using WASD
// - select astronaut
// - put on suit
// - go outside

var step_completed = false;
switch(step)
{
	case -2:
		scr_alert_player("Use keys WASD to move the view around.");
		step++;
		break;
	case -1:
		if(!has_initialized) exit;
		with(obj_wasd){
			exit;
		}
		scr_alert_player("Select captain Phillips.");
		step++;
		break;
	case 0:
		if(astronaut.is_selected)
		{
			arrow.target = closet;
			step++;
			scr_alert_player("Click on the closet to put on the space suit.");
		}
		break;
	case 1:
		if(astronaut.wears_suit)
		{
			instance_deactivate_object(arrow);
			step++;
			scr_alert_player("Now Phillips can safely go outside.");
		}
		break;
	case 2:
		if(astronaut.is_outside)
		{
			step++;
			ds_list_add(global.active_constructions, macro_sensor);
			scr_alert_player("Select sensor from construction menu.");
		}
		break;
	case 3:
		if(global.construct == macro_sensor)
		{
			arrow.x = 1080;
			arrow.y = 768;
			arrow.target = noone;
			instance_activate_object(arrow);
			step++;
			scr_alert_player("Construct the sensor on the patch of dirt to the north.");
		}
		break;
	case 4:
		with(obj_sensor)
		{
			if(!under_construction)
			{
				step_completed = true;
			}
		}
		if(step_completed)
		{
			ds_list_add(global.active_constructions, macro_cable);
			scr_alert_player("Now construct a cable to connect the sensor to the base.");
			instance_deactivate_object(arrow);
			step++;
		}
		break;
	case 5:
		var water_found = false;
		with(obj_sensor)
		{
			if(scr_can_draw_power(id))
			{
				step_completed = true;
				// check if water is in sight
				with(obj_resource_water)
				{
					var di = other.occ_i - occ_i;
					var dj = other.occ_j - occ_j;
					var d_squared = di*di + dj*dj;
					if( d_squared < macro_sensor_d_squared )
					{
						water_found = true;
						break;
					}
				}
			}
		}
		if(step_completed)
		{
			if(water_found)
			{
				scr_alert_player("You have found water! Click on the sensor to see it.");
				step = step + 2;
			}
			else
			{
				scr_alert_player("Continue building sensors until you have found water.");
				step++;
			}
		}
		break;
	case 6:
		with(obj_sensor)
		{
			if(scr_can_draw_power(id))
			{
				var water_found = false;
				// check if water is in sight
				with(obj_resource_water)
				{
					var di = other.occ_i - occ_i;
					var dj = other.occ_j - occ_j;
					var d_squared = di*di + dj*dj;
					if( d_squared < macro_sensor_d_squared )
					{
						water_found = true;
						break;
					}
				}
				if(water_found){
					step_completed = true;
				}
			}
		}
		if(step_completed)
		{
			scr_alert_player("You have found water! Click on the sensor to see it.");
			step++;
		}
		break;
	case 7:
		with(obj_sensor)
		{
			if(is_selected) step_completed = true;
		}
		if(step_completed)
		{
			ds_list_add(global.active_constructions, macro_drill);
			ds_list_add(global.active_constructions, macro_pump);
			scr_alert_player("Construct a drill on the water and a pump next to it.");
			step++;
		}
		break;
	case 8:
		var drill_done = false;
		var pump_done = false;
		with(obj_drill)
		{
			var has_power = scr_can_draw_power(id);
			var has_water = resource_instance != noone && resource_instance.object_index == obj_resource_water;
			if(!under_construction && has_power && has_water)
			{
				drill_done = true;
			}
		}
		with(obj_pump)
		{
			var has_power = scr_can_draw_power(id);
			var can_perform = scr_get_grid_prop(id, macro_grid_water, macro_grid_prop_can_perform_role);
			if(has_power && can_perform)
			{
				pump_done = true;
			}
		}
		if(drill_done && pump_done)
		{
			ds_list_add(global.active_constructions, macro_pipe);
			scr_alert_player("Construct a pipe to connect the drill to the base.");
			step++;
		}
		break;
	case 9:
		var grid1 = noone;
		var grid2 = noone;
		with(obj_pump)
		{
			grid1 = scr_get_grid(id, macro_grid_water);
		}
		with(obj_base_tile)
		{
			grid2 = scr_get_grid(id, macro_grid_water);
		}
		step_completed = grid1 != noone && grid1 == grid2
		if(step_completed)
		{
			ds_list_add(global.active_constructions, macro_water_reservoir);
			scr_alert_player("Build a reservoir in your base to store the water.");
			step++;
		}
		break;
	case 10:
		with(obj_water_reservoir)
		{
			if(!under_construction) step_completed = true;
		}
		if(step_completed)
		{
			scr_alert_player("Congratulations! You are producing water.");
			step++;
		}
		break;
	case 11:
		if(!instance_exists(obj_player_message))
		{
			arrow.target = closet;
			instance_activate_object(arrow);
			scr_alert_player("Put the suit back in the closet to finish the tutorial.");
			step++;
		}
		break;
	case 12:
		with(obj_suit_closet)
		{
			if(holds_suit) step_completed = true;
		}
		if(step_completed) step++;
		break;
	default:
		if(!tutorial_complete)
		{
			tutorial_complete = true;
			instance_create_layer(display_get_gui_width()/2, display_get_gui_height()/2, macro_logic_layer, obj_mission_accomplished);
		}
		break;
}