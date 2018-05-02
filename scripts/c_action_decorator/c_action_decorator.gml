/// @descr Use this to stack actions
var method = argument0;
var this = argument1;
var args = argument2;
var here = c_action_decorator;

switch(method)
{
	case constructor: // can be remove if not needed
		this.action = args[0]
		this.previous = noone;
		return this;

	case destructor:
		destroy(this.action);
		if(this.previous != noone) destroy(this.previous);
		return ok();
	
	case get_clients:
		var clients = [tuple(c_delay, "action")];
		return ok(clients);
	
	case "execute":
		if(this.previous != noone)
		{
			var prev_res = void(this.previous, "execute");
			if(prev_res.status == STATUS.OK)
			{
				destroy(prev_res);
				return void(this.action, "execute");
			}
			return prev_res;
		}
		else return void(this.action, "execute");
	
	// methods
	case "then":
		var new_dec = new(c_action_decorator, args);
		new_dec.previous = this;
		return ok(new_dec);
	
	case test:
		// todo: test decorated action
		break;
	
	default:
		return refused();
}