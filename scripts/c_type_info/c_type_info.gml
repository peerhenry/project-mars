var method = argument0;
var this = argument1;
var args = argument2;
var here = c_type_info;

#region TYPES
enum TYPE {
	VOID,
	NUMBER,
	INTEGER,	// extra check: floor(value) == value
	STRING,
	ARRAY,
	// the rest are numbers with interpretation
	OBJECT,
	OBJECT_INDEX,
	SCRIPT,
	MAP,
	LIST,
	STACK
}
#endregion

switch(method)
{
	#region constructor / destructor
	
	case constructor: // can be remove if not needed
		var type = args[0];
		if(type == TYPE.OBJECT) this.object_type = args[1];
		this.type = type;
		return this;
	
	case get_object_index:
		return ok(obj_type_info);
	
	case get_dependencies:
		return ok(skip_standards());
	
	case destructor: 
		return ok();
		
	#endregion

	#region assert_type
	case "assert_type":
		var value = args[0];
		switch(this.type)
		{
			case TYPE.VOID:
				assert_equal(noone, value, "argument");
				break;
			case TYPE.NUMBER:
				assert_equal("number", typeof(value), "typeof(arg)");
				break;
			case TYPE.INTEGER:
				var pass = assert_equal("number", typeof(value), "typeof(arg)");
				if(pass) assert_equal(floor(value), value, "floor(value)");
				break;
			case TYPE.STRING:
				assert_equal("string", typeof(value), "typeof(arg)");
				break;
			case TYPE.SCRIPT:
				assert_true(script_exists(value), "script_exists(arg)");
				break;
			// types with context:
			case TYPE.OBJECT_INDEX:
				assert_true(object_exists(value), "object_exists(arg)");
				break;
			case TYPE.OBJECT:
				var exists = instance_exists(value); // value must be an instance
				assert_true(exists, "instance_exists(arg)");
				if(exists)
				{
					var type_matches = scr_instance_inherits(value, this.object_type);
					assert_true(type_matches, "object index is valid");
				}
				break;
			case TYPE.ARRAY:
				assert_equal("array", typeof(value), "typeof(arg)");
				break;
			case TYPE.MAP:
				assert_true(ds_exists(value, ds_type_map), "ds_exists(arg, ds_type_map)");
				break;
			case TYPE.LIST:
				assert_true(ds_exists(value, ds_type_list), "ds_exists(arg, ds_type_list)");
				break;
			case TYPE.STACK:
				assert_true(ds_exists(value, ds_type_stack), "ds_exists(arg, ds_type_list)");
				break;
			// todo: add grid, queue, priority	
		}
		return ok();
	#endregion

	#region create_mock
	case "create_dummy":
		var dummy;
		switch(this.type)
		{
			case TYPE.VOID:
				dummy = noone;
				break;
			case TYPE.NUMBER:
				dummy = 1;
				break;
			case TYPE.STRING:
				dummy = "dummy";
				break;
			case TYPE.SCRIPT:
				dummy = scr_mock;
				break;
			// types with context:
			case TYPE.OBJECT:
				dummy = instance_create_depth(0,0,0,this.object_type);
				break;
			case TYPE.ARRAY:
				dummy = [];
				break;
			case TYPE.MAP:
				dummy = ds_map_create();;
				break;
			case TYPE.LIST:
				dummy = ds_list_create();
				break;
			case TYPE.STACK:
				dummy = ds_stack_create();
				break;
			// todo: add grid, queue, priority	
		}
		return ok(dummy);
	
	case "create_mock":
		var val = void_unwrap(this, "create_dummy");
		var mocky = new(c_mock_val, [this, val]);
		return ok(mocky);
	#endregion
	
	#region test
	case test:
		test_method(here, "test_factories");
		break;
	
	case "test_factories":
		var tv = t_void();
		var tn = t_number();
		var ts = t_string();
		var ta = t_array();
		var to = t_object(obj_empty);
		assert_equal(obj_type_info, tv.object_index, "object_index");
		assert_equal(obj_type_info, tn.object_index, "object_index");
		assert_equal(obj_type_info, ts.object_index, "object_index");
		assert_equal(obj_type_info, ta.object_index, "object_index");
		assert_equal(obj_type_info, to.object_index, "object_index");
		assert_equal(TYPE.VOID, tv.type, "type");
		assert_equal(TYPE.NUMBER, tn.type, "type");
		assert_equal(TYPE.STRING, ts.type, "type");
		assert_equal(TYPE.ARRAY, ta.type, "type");
		assert_equal(TYPE.OBJECT, to.type, "type");
		break;
	#endregion
	
	default:
		return refused();
}