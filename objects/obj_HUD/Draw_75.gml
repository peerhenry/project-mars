/// @description draw tooltip

// gui tooltip
if(hover_button != noone)
{
	scr_draw_tooltip(hover_button.tooltip_text);
}
if(global.hovering_over_gui) exit;

// map tooltip
var comp = instance_position(mouse_x, mouse_y, obj_base_component);
if(comp != noone)
{
	scr_draw_tooltip(string( comp.name ));
}
else
{
	var tile = instance_position(mouse_x, mouse_y, obj_base_tile);
	if(tile != noone && !tile.under_construction)
	{
		var le_room = scr_room_at(mouse_x, mouse_y);
		if(le_room != noone) scr_draw_tooltip("oxygen: " + string( floor(le_room.oxygen_level) ) + "%");
	}
}