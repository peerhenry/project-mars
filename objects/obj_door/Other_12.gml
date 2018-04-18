/// @description Finalize construction
event_inherited();

// Set sprite
if(connects_horizontally)
{
	if(!global.draw_tall_walls) sprite_index = spr_door_vertical;
}
else
{
	if(!global.draw_tall_walls) sprite_index = spr_door;
}

var room_logic_door = resolve_script(script_container, "room_logic_door");
script_execute(room_logic_door, id);