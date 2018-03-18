if(site != noone)
{
	if(!site.accomplished && !global.mission_is_active) scr_begin_level(site, global.next_level);
}
else show_message("Warning! site was noone");