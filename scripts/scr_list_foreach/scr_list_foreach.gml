var arg_list = argument0;
var arg_script = argument1;

for(var n = 0; n < ds_list_size(arg_list); n++)
{
	var next_value = ds_list_find_value(arg_list, n);
	script_execute(arg_script, next_value);
}