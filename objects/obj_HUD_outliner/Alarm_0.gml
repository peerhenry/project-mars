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