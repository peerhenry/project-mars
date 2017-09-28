/// @description Finalize construction
scr_trace("constructable finalize event");
if(under_construction)
{
	under_construction = false;
	scr_grid_logic(id);
}