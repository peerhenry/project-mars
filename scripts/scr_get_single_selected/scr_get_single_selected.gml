/// @description returns single selected constructable or movable or noone.
var select = noone;
var select_count = 0;
with(obj_movable)
{
	if(is_selected)
	{
		select_count++;
		select = id;
	}
}

if(select_count == 0)
{
	with(obj_constructable)
	{
		if(is_selected)
		{
			select_count++;
			select = id;
		}
	}
}
if(select_count != 1) select = noone;
return select;