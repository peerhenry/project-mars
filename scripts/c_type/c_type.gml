var method = argument[0];
var this = (argument_count > 1) ? argument[1] : noone;
var here = c_type;

#region TYPES
enum TYPE {
	VOID,
	NUMBER,
	STRING,
	ARRAY,
	// the rest are numbers with interpretation
	OBJECT,
	SCRIPT,
	MAP,
	LIST,
	STACK
}
#endregion

switch(method)
{
	#region constructor
	case constructor: // can be remove if not needed
		var type = argument[2];
		this.contextual_type = noone;
		var is_simple = (type == TYPE.VOID || type == TYPE.NUMBER || type == TYPE.STRING || type == TYPE.SCRIPT);
		if(is_simple)
		{
			if(argument_count != 3) scr_panic("Can't construct a simple type with argument_count: " + string(argument_count));
		}
		else if(argument_count != 4) scr_panic("A complex type requires a type and a contextual type, argument_count was: " + string(argument_count));
		
		if(!is_simple)
		{
			this.contextual_type = argument[3];	
			if(type == TYPE.OBJECT)
			{
				if(!object_exists(this.contextual_type)) scr_panic("An object type requires an object index as contextual type");
			}
			else
			{
				// contextual_type must be a c_type
				if(this.contextual_type.object_index != obj_type) scr_panic("Contextual type must be an obj_type");
			}
		}
		
		this.type = type;
		return this;
	#endregion

	#region assert_type
	case "assert_type":
		var value = argument[2];
		switch(this.type)
		{
			case TYPE.VOID:
				assert_equal(noone, value, "argument");
				break;
			case TYPE.NUMBER:
				assert_equal("number", typeof(value), "typeof(arg)");
				break;
			case TYPE.STRING:
				assert_equal("string", typeof(value), "typeof(arg)");
				break;
			case TYPE.SCRIPT:
				assert_true(script_exists(value), "script_exists(arg)");
				break;
			// types with context:
			case TYPE.OBJECT:
				var exists = instance_exists(value); // value must be an instance
				assert_true(exists, "instance_exists(arg)");
				if(exists)
				{
					var type_matches = scr_instance_inherits(value, this.contextual_type);
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

	#region create_dummy
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
				dummy = instance_create_depth(0,0,0,this.contextual_type);
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
	#endregion

	#region destructor
	case destructor: 
		if(instance_exists(this.contextual_type) && this.contextual_type.object_index == obj_type) destroy(this.contextual_type);
		instance_destroy(this);
		break;
	#endregion
	
	#region test
	case test:
		test_method(here, "test_factories");
		break;
	
	case "test_factories":
		var tv = t_void();
		var tn = t_number();
		var ts = t_string();
		var ta = t_array(t_number());
		var to = t_object(obj_empty);
		assert_equal(obj_type, tv.object_index, "object_index");
		assert_equal(obj_type, tn.object_index, "object_index");
		assert_equal(obj_type, ts.object_index, "object_index");
		assert_equal(obj_type, ta.object_index, "object_index");
		assert_equal(obj_type, to.object_index, "object_index");
		assert_equal(TYPE.VOID, tv.type, "type");
		assert_equal(TYPE.NUMBER, tn.type, "type");
		assert_equal(TYPE.STRING, ts.type, "type");
		assert_equal(TYPE.ARRAY, ta.type, "type");
		assert_equal(TYPE.OBJECT, to.type, "type");
		assert_equal(TYPE.NUMBER, ta.contextual_type.type, "array contextual_type");
		assert_equal(obj_empty, to.contextual_type, "object contextual_type");
		break;
	#endregion
	
	default:
		return refused();
}