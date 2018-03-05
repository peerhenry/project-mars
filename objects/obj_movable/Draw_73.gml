/// @description shift arrow

if(keyboard_check(vk_shift) && path_exists(path) && owner == macro_player)
{
	var dest_x = scr_gi_to_rc(dest_i);
	var dest_y = scr_gi_to_rc(dest_j);
	draw_set_color(c_aqua);
	
	if(scr_instance_inherits(id, obj_task_actor) && assigned_object != noone) draw_arrow(x, y, assigned_object.x, assigned_object.y, 10);
	else draw_arrow(x, y, dest_x, dest_y, 10);
}