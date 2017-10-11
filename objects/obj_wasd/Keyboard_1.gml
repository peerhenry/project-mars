var did_it = 
	keyboard_check(ord("W"))
	|| keyboard_check(ord("A"))
	|| keyboard_check(ord("S"))
	|| keyboard_check(ord("D"));
if did_it
{
	alarm[0] = 2;
}