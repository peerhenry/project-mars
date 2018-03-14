/// @description create or handle the MC state
var state = noone;
with(obj_mission_control_state)
{
	state = id;
}

if(state == noone) // make new sites
{
	state = instance_create_depth(0,0,0,obj_mission_control_state);
	with(obj_level_icon)
	{
		site = instance_create_depth(0,0,0,obj_mission_site);
		ds_list_add(state.site_list, site);
	}
}
else // assign existing sites to icons
{
	var n = 0;
	with(obj_level_icon)
	{
		site = state.site_list[|n];
		n++;
	}
}