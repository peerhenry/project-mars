if(disappearing)
{
	a -= 0.02;
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,a);
	if(a <= 0) instance_destroy();
}
else draw_self();

scr_draw_mask(id);