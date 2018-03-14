var count = scr_count_live_astronauts(macro_enemy);
show_debug_message("Kill astro objective alarm called! count is: " + string(count));
if(count == 0)
{
	accomplished = true;
}
alarm[0] = 60; // check again after 2 seconds