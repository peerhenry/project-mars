scr_mouse_step();

if(is_dragging) global.mousedrag_from = mousedrag_from.world;
else if(global.mousedrag_from == mousedrag_from.world) global.mousedrag_from = mousedrag_from.none; //reset