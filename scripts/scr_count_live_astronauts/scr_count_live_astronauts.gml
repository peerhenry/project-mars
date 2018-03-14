/// @arg owner
var arg_owner = argument0;
var count = 0;
with(obj_astronaut)
{
	if(owner == arg_owner && !has_died) count++;
}
with(obj_bed)
{
	if(owner == arg_owner && occupant != noone) count++;
}
with(obj_med_bed)
{
	if(owner == arg_owner && occupant != noone) count++;
}
return count;