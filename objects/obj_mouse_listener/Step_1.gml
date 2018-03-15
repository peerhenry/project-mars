var hovering_over_GUI = scr_hovers_over_GUI();

// panels set global.hovering_over_panel during their step
if(hovering_over_GUI)
{
	// this flag is used during step to determine if input should be processed on map
	global.hovering_over_HUD = true;
	if(mouse_check_button_pressed(mb_left)) global.mousedrag_from = mousedrag_from.gui;
}
else
{
	global.hovering_over_HUD = false;
	if(mouse_check_button_pressed(mb_left)) global.mousedrag_from = mousedrag_from.world;
}
if(mouse_check_button_released(mb_left)) global.mousedrag_from = mousedrag_from.none;