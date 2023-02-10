function f_transit_modules() {
	var func = argument[0];
	var args = argument[1];
	var here = f_transit_modules;

	switch(func)
	{	
		// functions
		case "engage_thrusters": // lander => void
			var arg_lander = args[0];
			arg_lander.exhaust_sound = resolve_execute(global.script_container, "play_sound_at", sound_fx_exhaust, arg_lander.x, arg_lander.y, false);
			with(arg_lander)
			{
				if(object_index == obj_base_deployment_module) image_index = 0;
				else image_index = 1;
			}
			break;
	
		case "disengage_thrusters": // lander => void
			var arg_lander = args[0];
			if(arg_lander.exhaust_sound != noone)
			{
				audio_stop_sound(arg_lander.exhaust_sound);
				arg_lander.exhaust_sound = noone;
			}
		
			if(arg_lander.object_index == obj_base_deployment_module)
			{
				image_speed = 2; // animation to retract pipes
			}
			else image_index = 0;
			break;
	
		case "plot_course":	// lander => void
			var arg_lander = args[0];
			var arg_landing = args[1];
			with(arg_lander)
			{
				if(!path_exists(path)) path = path_add();
				//mp_linear_path(path, basetile_target.x, basetile_target.y, worm_speed_underground, false); // does not go through solids
				if(arg_landing)
				{
					y = y - 1080;
					path_add_point(path, x, y - 1080, 100);
					path_add_point(path, x, y, 5);
					is_landing = true;
					is_taking_off = false;
				}
				else
				{
					path_add_point(path, x, y, 5);
					path_add_point(path, x, y - 1080, 100);
					is_landing = false;
					is_taking_off = true;
				}
				path_set_closed(path, false); // so it doesnt go back
				var landing_speed = 30; // todo: move to config global
				path_start(path, landing_speed, path_action_stop, false);
			}
			break;
	
		case "land": // lander => void
			var arg_lander = args[0];
			in(here, "plot_course", [arg_lander, true]);
			in(here, "engage_thrusters", arg_lander);
			break;
		
		case "takeoff": // lander => bool
			var arg_lander = args[0];
			if(path_exists(arg_lander.path)) return false; // it already is landing or taking off
			in(here, "plot_course", [arg_lander, false]);
			in(here, "engage_thrusters", arg_lander);
			for(var i = -1; i <= 1; i++) // todo: allow for landers of different sizes
			{
				for(var j = -1; j <= 1; j++)
				{
					scr_navgrid_free(arg_lander.occ_i + i, arg_lander.occ_j + j);
				}
			}
			return true; // todo: do something with the return value @ client
		
		case "complete_landing": // lander => void
			var arg_lander = args[0];
			in(here, "disengage_thrusters", arg_lander);
			arg_lander.is_landing = false;
			path_delete(path);
			break;
	
		case "complete_takeoff": // lander => void
			var arg_lander = args[0];
			in(here, "disengage_thrusters", arg_lander);
			instance_destroy(arg_lander);
			break;
	
		case test:
			run_fs_test(here, "takeoff_test");
			run_fs_test(here, "land_test");
			break;
	
		case "takeoff_test":
			var dummy = instance_create_depth(0,0,0,obj_empty);
			dummy.sprite_index = spr_atm_small;
			dummy.path = noone;
			dummy.occ_i = 5;
			dummy.occ_j = 5;
			// act
			in(here, "takeoff", dummy);
			// assert
			assert_equal(1, dummy.image_index, "dummy.image_index");
			assert_true(dummy.is_taking_off, "is_taking_off");
			assert_equal(0, dummy.path_position, "dummy.path_position");
			// cleanup
			instance_destroy(dummy);
			break;
	
		case "land_test":
			var dummy = instance_create_depth(0,0,0,obj_empty);
			dummy.sprite_index = spr_atm_small;
			dummy.path = noone;
			dummy.occ_i = 5;
			dummy.occ_j = 5;
			// act
			in(here, "land", dummy);
			// assert
			assert_equal(1, dummy.image_index, "dummy.image_index");
			assert_false(dummy.is_taking_off, "is_taking_off");
			assert_true(dummy.is_landing, "is_landing");
			assert_equal(0, dummy.path_position, "dummy.path_position");
			// cleanup
			instance_destroy(dummy);
			break;
	
		default:
			show_error("Function undefined: " + string(argument[0]), true);
	}


}
