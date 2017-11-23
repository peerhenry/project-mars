
// panels set global.hovering_over_panel during their step
if(global.hovering_over_hud_panel)
{
	// this flag is used during step to determine if input should be processed on map
	global.hovering_over_HUD = true;
}
else
{
	global.hovering_over_HUD = false;
}

// flag is reset
global.hovering_over_hud_panel = false;