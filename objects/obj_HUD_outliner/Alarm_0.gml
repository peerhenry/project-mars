// initialize
astro_count = 0;
robot_count = 0;
cart_count = 0;
with(obj_astronaut)
{
	if(owner == macro_player) other.astro_count++;
}
with(obj_robot)
{
	if(owner == macro_player) other.robot_count++;
}
with(obj_cart)
{
	if(owner == macro_player) other.cart_count++;
}

// show all panels
show_astro_panels = true;
show_robot_panels = true;
show_cart_panels = true;
scr_set_outliner_part(id, obj_astronaut, show_astro_panels);
scr_set_outliner_part(id, obj_robot, show_robot_panels);
scr_set_outliner_part(id, obj_cart, show_cart_panels);
reset = true;