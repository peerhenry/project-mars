/// @arg hud
/// @arg x
/// @arg y
/// @arg sprite
/// @arg subimg
/// @arg toggle_subimg
/// @arg action
function scr_add_hud_bar_sprite_button(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	var hud = argument0;
	var arg_x = argument1;
	var arg_y = argument2;
	var arg_sprite = argument3;
	var arg_subimg = argument4;
	var arg_toggle_subimg = argument5;
	var arg_action = argument6;

	var button = scr_add_hud_button_ext(
		hud,
		arg_x,
		arg_y,
		noone,
		"",
		2, //todo: non hardcoded margin x/y?
		2,
		arg_sprite,
		arg_action
	);

	button.subimg = arg_subimg;
	button.toggle_subimg = arg_toggle_subimg;
	button.draw_as_panel = false;

	return button;


}
