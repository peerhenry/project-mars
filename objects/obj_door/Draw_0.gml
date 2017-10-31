if(under_construction)
{
	event_inherited();
	exit;
}

// draw red color for room oxygen levels
if(room1 != noone && room1.oxygen_level < 100)
{
	var o2_alpha = ((100 - room1.oxygen_level)/100)*global.oxygen_max_alpha;
	draw_set_alpha(o2_alpha);
	draw_set_color(c_red);
	var right = x + 15;
	var bottom = y - 1;
	if(connects_horizontally)
	{
		right = x - 1;
		bottom = y + 15;
	}
	draw_rectangle(x - 16, y - 16, right, bottom, false);
	/*if(room1.oxygen_level < global.oxygen_empty_level){
		draw_sprite(spr_oxygen_depleted, -1, xx, yy);
	}//*/
}

if(room2 != noone && room2.oxygen_level < 100)
{
	var o2_alpha = ( (100-room2.oxygen_level)/100 )*oxygen_max_alpha;
	draw_set_alpha(o2_alpha);
	draw_set_color(c_red);
	var left = x - 16;
	var top = y;
	if(connects_horizontally)
	{
		left = x;
		top = y-16;
	}
	draw_rectangle(left, top, x+15, y+15, false);
	/*if(room1.oxygen_level < global.oxygen_empty_level){
		draw_sprite(spr_oxygen_depleted, -1, xx, yy);
	}*/
}

//if(temperature < 20){}

// reset drawing parameters
draw_set_alpha(1);

draw_self();

if(locked)
{
	var lock_y = y;
	if(global.draw_tall_walls) lock_y = y - 16;
	draw_sprite(spr_locked, 0, x, lock_y);
}