/// @arg function
/// @arg arguments...
var arg_function = argument0;
var args = argument1;
var here = f_drill_mine;

// This is used to iterate over in test function
var functions = [
	"bucket_is_full", 
	"needs_new_bucket", 
	"find_bucket_with_space", 
	"can_mine", 
	"dump",
	"mine"
];

switch(arg_function)
{
#region Functions
	
	#region bucket_is_full: bucket => bool
	case "bucket_is_full":
		var arg_bucket = args[0];
		return arg_bucket.image_index >= sprite_get_number(arg_bucket.sprite_index)-1;
	#endregion
	
	#region needs_new_bucket: drill => bool
	case "needs_new_bucket":
		var arg_drill = args[0];
		var drill_bucket = arg_drill.active_bucket;
		return (drill_bucket == noone || !instance_exists(drill_bucket) || in(here, "bucket_is_full", drill_bucket));
	#endregion
	
	#region find_bucket_with_space: drill => bucket?
	case "find_bucket_with_space":
		var arg_drill = args[0];
		var adjacent_buckets = scr_get_adjacent_instances(arg_drill, obj_bucket);
		with(arg_drill)
		{
			for(var n = 0; n < 4; n++)
			{
				var other_bucket = adjacent_buckets[n];
				if(other_bucket == noone || other_bucket.under_construction) continue;
				with(other_bucket)
				{
					var is_full = in(here, "bucket_is_full", other_bucket);
					if(!is_full) return other_bucket;
				}
			}
		}
		return noone;
	#endregion
	
	#region can_mine: (drill, script) => bool
	case "can_mine":
		var arg_drill = args[0];
		var can_draw_power = args[1];
		with(arg_drill) return !under_construction && instance_exists(resource_instance) && script_execute(can_draw_power, id);
	#endregion
	
	#region dump: drill => void
	case "dump":
		show_debug_message("f_drill_mine.dump");
		var arg_drill = args[0];
		with(arg_drill)
		{
			active_bucket.image_index += 1;
			resource_instance.amount -= 20; // todo: move to config global
			if(resource_instance.amount <= 0)
			{
				instance_destroy(resource_instance);
				resource_instance = noone;
				has_resource = false;
			}
		}
		break;
	#endregion
	
	#region mine: drill => void
	case "mine":
		var arg_drill = args[0];
		with(arg_drill)
		{
			var can_draw_power = resolve_script(global.script_container, "can_draw_power");
			var can_mine = in(here, "can_mine", [arg_drill, can_draw_power]);
			if(can_mine)
			{
				var needs_new_bucket = in(here, "needs_new_bucket", arg_drill)
				if(needs_new_bucket)
				{
					active_bucket = in(here, "find_bucket_with_space", arg_drill);
				}
				var can_dump = active_bucket != noone;
				if(can_dump) in(here, "dump", arg_drill);
				else event_user(macro_event_drill_mine_check);
			}
		}
		break;
	#endregion mine
	
#endregion
	
#region Unit Tests
	
	#region test entry point
	case test: 
		for(var n = 0; n < array_length_1d(functions); n++) // demand unit tests for all functions
		{
			var function = functions[n];
			var function_test = function + "_test"; // each function must have a corresponding test function
			in(here, function_test);
		}
		break;
	#endregion
	
	#region bucket_is_full
	
	case "bucket_is_full_test":
		run_fs_test(here, "test_empty_bucket");
		run_fs_test(here, "test_full_bucket");
		break;
	
	case "test_empty_bucket":
		// arrange
		var bucket = instance_create_depth(0,0,0,obj_bucket);
		// act
		var result = in(here, "bucket_is_full", bucket);
		// assert
		assert_false(result, "bucket is full");
		// cleanup
		instance_destroy(obj_bucket);
		break;
		
	case "test_full_bucket":
		// arrange
		var bucket = instance_create_depth(0,0,0,obj_bucket);
		bucket.image_index = sprite_get_number(bucket.sprite_index);
		// act
		var result = in(here, "bucket_is_full", bucket);
		// assert
		assert_true(result, "bucket is full");
		// cleanup
		instance_destroy(obj_bucket);
		break;
	#endregion
	
	#region needs_new_bucket
	
	case "needs_new_bucket_test":
		run_fs_test(here, "needs_new_bucket_test; drill has no bucket");
		run_fs_test(here, "needs_new_bucket_test; bucket is empty");
		run_fs_test(here, "needs_new_bucket_test; bucket is full");
		break;
	
	case "needs_new_bucket_test; drill has no bucket":
		// arrange
		var drill = instance_create_depth(0,0,0,obj_drill);
		// act
		var result = in(here, "needs_new_bucket", drill);
		// assert
		assert_true(result, "drill needs new bucket");
		// cleanup
		instance_destroy(drill);
		break;
		
	case "needs_new_bucket_test; bucket is empty":
		// arrange
		var drill = instance_create_depth(0,0,0,obj_drill);
		var bucket = instance_create_depth(0,0,0,obj_bucket);
		drill.active_bucket = bucket;
		// act
		var result = in(here, "needs_new_bucket", drill);
		// assert
		assert_false(result, "drill needs new bucket");
		// cleanup
		instance_destroy(drill);
		instance_destroy(bucket);
		break;
	
	case "needs_new_bucket_test; bucket is full":
		// arrange
		var drill = instance_create_depth(0,0,0,obj_drill);
		var bucket = instance_create_depth(0,0,0,obj_bucket);
		bucket.image_index = sprite_get_number(bucket.sprite_index)-1;
		drill.active_bucket = bucket;
		// act
		var result = in(here, "needs_new_bucket", drill);
		// assert
		assert_true(result, "drill needs new bucket");
		// cleanup
		instance_destroy(drill);
		instance_destroy(bucket);
		break;
	
	#endregion
	
	#region find_bucket_with_space
	
	case "find_bucket_with_space_test":
		run_fs_test(here, "find_bucket_with_space_test none");
		run_fs_test(here, "find_bucket_with_space_test one under construction");
		run_fs_test(here, "find_bucket_with_space_test one");
		break;
	
	case "find_bucket_with_space_test none":
		// arrange
		var drill = instance_create_depth(0,0,0,obj_drill);
		// act
		var result = in(here, "find_bucket_with_space", drill);
		// assert
		assert_equal(noone, result, "bucket");
		// cleanup
		instance_destroy(drill);
		break;
	
	case "find_bucket_with_space_test one under construction":
		// arrange
		var drill = instance_create_depth(48, 48, 0, obj_drill);
		var bucket = instance_create_depth(48, 48 + 32, 0, obj_bucket);
		bucket.under_construction = true;
		// act
		var result = in(here, "find_bucket_with_space", drill);
		// assert
		assert_equal(noone, result, "bucket");
		// cleanup
		instance_destroy(drill);
		instance_destroy(bucket);
		break;
	
	case "find_bucket_with_space_test one":
		// arrange
		var drill = instance_create_depth(48, 48, 0, obj_drill);
		var bucket = instance_create_depth(48, 48 + 32, 0, obj_bucket);
		bucket.under_construction = false;
		// act
		var result = in(here, "find_bucket_with_space", drill);
		// assert
		assert_equal(bucket, result, "bucket");
		// cleanup
		instance_destroy(drill);
		instance_destroy(bucket);
		break;
	
	#endregion
	
	#region can_mine
	
	case "can_mine_test":
		run_fs_test(here, "can_mine_test can mine");
		run_fs_test(here, "can_mine_test no power");
		run_fs_test(here, "can_mine_test under construction");
		run_fs_test(here, "can_mine_test no resource");
		break;
		
	case "can_mine_test can mine":
		// arrange
		var xx = 48;
		var yy = 48;
		var metal = instance_create_depth(xx, yy, 0, obj_resource_metal);
		metal.amount = 10000;
		var drill = instance_create_depth(xx, yy, 0, obj_drill); // create event acquires resource
		drill.under_construction = false;
		// act
		var result = in(here, "can_mine", [drill, scr_mock_return_true]);
		// assert
		assert_true(result, "can mine");
		// cleanup
		instance_destroy(drill);
		instance_destroy(metal);
		break;
	
	case "can_mine_test no power":
		// arrange
		var xx = 48;
		var yy = 48;
		var metal = instance_create_depth(xx, yy, 0, obj_resource_metal);
		metal.amount = 10000;
		var drill = instance_create_depth(xx, yy, 0, obj_drill); // create event acquires resource
		drill.under_construction = false;
		// act
		var result = in(here, "can_mine", [drill, scr_mock_return_false]);
		// assert
		assert_false(result, "can mine");
		// cleanup
		instance_destroy(drill);
		instance_destroy(metal);
		break;
		
	case "can_mine_test under construction":
		// arrange
		var xx = 48;
		var yy = 48;
		var metal = instance_create_depth(xx, yy, 0, obj_resource_metal);
		metal.amount = 10000;
		var drill = instance_create_depth(xx, yy, 0, obj_drill); // create event acquires resource
		drill.under_construction = true;
		// act
		var result = in(here, "can_mine", [drill, scr_mock_return_true]);
		// assert
		assert_false(result, "can mine");
		// cleanup
		instance_destroy(drill);
		instance_destroy(metal);
		break;
	
	case "can_mine_test no resource":
		// arrange
		var xx = 48;
		var yy = 48;
		var drill = instance_create_depth(xx, yy, 0, obj_drill); // create event acquires resource
		drill.under_construction = false;
		// act
		var result = in(here, "can_mine", [drill, scr_mock_return_true]);
		// assert
		assert_false(result, "can mine");
		// cleanup
		instance_destroy(drill);
		break;
	
	#endregion
	
	#region dump
	
	case "dump_test":
		run_fs_test(here, "dump_test_result");
		break;
	
	case "dump_test_result":
		// arrange
		var drill = instance_create_depth(0,0,0,obj_drill);
		var bucket = instance_create_depth(0,0,0,obj_bucket);
		drill.active_bucket = bucket;
		var res = instance_create_depth(0,0,0,obj_resource_metal);
		drill.resource_instance = res;
		res.amount = 10000;
		// act
		in(here, "dump", drill);
		// assert
		assert_equal(1, bucket.image_index, "bucket.image_index");
		assert_equal(10000 - 20, res.amount, "bucket.image_index");
		
		// cleanup
		instance_destroy(drill);
		instance_destroy(bucket);
		instance_destroy(res);
		break;
	
	#endregion
	
	#region mine
	
	case "mine_test":
		// pretty much tested in script "test_suite_drill"
		break;
	
	#endregion
	
#endregion Unit Tests
	
	default:
		show_error("Function undefined: " + string(argument[0]), true);
}