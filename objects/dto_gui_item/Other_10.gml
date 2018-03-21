/// @description Update

if(script_exists(step_script)) script_execute(step_script, id);


if(should_draw_healthbar && script_exists(bar_set_amount_script))
{
	bar_amount = script_execute(bar_set_amount_script);
}