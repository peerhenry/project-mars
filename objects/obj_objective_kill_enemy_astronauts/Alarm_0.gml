var count = scr_count_live_astronauts(macro_enemy);
if(count == 0)
{
	other.accomplished = true;
}
else alarm[0] = 60;