/// @description Click

scr_hide_categories();

var construction_list = global.active_constructions;
var counter = 0;
for(var n = 0; n < ds_list_size(construction_list); n++){
	var next_build = ds_list_find_value(construction_list, n);
	if(scr_get_category(next_build) == category){
		counter++;
	}
}

scr_create_category_panel(x_offset - padding, y_offset - padding, x_offset + 32 + padding, y_offset + counter*32 + padding);

// Create buttons for this category

var counter = 0;
for(var n = 0; n < ds_list_size(construction_list); n++){
	// if construction belongs to this category...
	var next_build = ds_list_find_value(construction_list, n);
	var next_sprite = scr_hud_sprite_for_build(next_build);
	var next_image_index = scr_hud_image_for_build(next_build);

	if(scr_get_category(next_build) == category){
		var left = x_offset;
		var top = y_offset + (32 + y_spacing)*counter;
		counter++;
		var new_item = instance_create_layer(left, top, macro_logic_layer, obj_HUD_construction_button);
		with(new_item)
		{
			construction = next_build;
			tooltip_text = scr_get_tooltip_text(next_build);
			sprite_index = next_sprite;
			image_index = next_image_index;
		}	
	}
}