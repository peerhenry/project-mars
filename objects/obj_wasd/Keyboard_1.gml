var did_it = 
	keyboard_check(ord("W"))
	|| keyboard_check(ord("A"))
	|| keyboard_check(ord("S"))
	|| keyboard_check(ord("D"))
	|| keyboard_check(ord(vk_up))
	|| keyboard_check(ord(vk_down))
	|| keyboard_check(ord(vk_left))
	|| keyboard_check(ord(vk_down));
	
if did_it
{
	alarm[0] = 2;
}