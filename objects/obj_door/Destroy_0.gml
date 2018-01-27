/// @description Remove door from room1 and room2
event_inherited();

can_join = true;

if(room1 != noone)
{
	with(room1)
	{
		var i1 = ds_list_find_index(doors, other.id);
		ds_list_delete(doors, i1);
	}
}
else can_join = false;

if(room2 != noone)
{
	with(room2)
	{
		var i2 = ds_list_find_index(doors, other.id);
		ds_list_delete(doors, i2);
	}
}
else can_join = false;

if(can_join)
{
	scr_room_join(x, y, room1, room2);
}