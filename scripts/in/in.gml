/// @descr Syntactic sugar; read as "in <script> call <function> with <arguments>" => in(script, method, arguments...)
/// @arg script
/// @arg function
/// @arg arguments...
function in() {
	var script = argument[0];
	var func = argument[1];

	switch(argument_count)
	{
		case 2:
			return script_execute(script, func, []);
		case 3:
			var args = argument[2];
			if(!is_array(args)) args = [args];
			return script_execute(script, func, args);
		default:
			show_error("call_static error: Too many arguments", true);
	}


}
