function tuple() {
	if(argument_count == 0) show_error("Tuple must get at least one value", true);

	var args;
	for(var n = argument_count - 1; n >= 0; n--)
	{
		args[n] = argument[n];
	}

	return fnew(c_tuple, args);


}
