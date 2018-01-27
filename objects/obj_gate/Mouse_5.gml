/// @description Lock/Unlock
if(owner != macro_player) exit;
if(under_construction || under_destruction)
{
	exit;
}
if(is_open) scr_gate_toggle();
scr_gate_lock();