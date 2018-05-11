/// @description set cursor sprite

if( global.hovering_over_gui )
{
	sprite_index = spr_cursor;
	exit;
}

#region set hover_over_selectable

// hovers over movable
var hover_over_selectable = false;
var entity = instance_position(mouse_x, mouse_y, obj_movable);
if(entity != noone)
{
	hover_over_selectable = entity.owner == macro_player;
}

// hovers over component
var component = noone;
if(!hover_over_selectable)
{
	component = instance_position(mouse_x, mouse_y, obj_base_component);
	if(component != noone)
	{
		hover_over_selectable = (component.owner == macro_player);
	}
}

var base_tile = noone;
if(!hover_over_selectable)
{
	base_tile = instance_position(mouse_x, mouse_y, obj_base_tile);
}

#endregion

if(!hover_over_selectable)
{
	#region set cursor not hovering over selectable
	
	// Grid selectors, fridges and sensors are selectable
	if( scr_any_task_actors_selected() )
	{
		var hover_over_enemy = false;
		var hover_over_broken_basetile = false;
		if(entity != noone)
		{
			hover_over_enemy = entity.owner == macro_enemy;
		}

		if(!hover_over_enemy)
		{
			var constr = scr_enemy_component_position(mouse_x, mouse_y);
			if(constr != noone) hover_over_enemy = true;
		}
		
		if(!hover_over_enemy)
		{
			hover_over_broken_basetile = (base_tile != noone && base_tile.owner == macro_player && base_tile.is_broken);
		}
		
		if(hover_over_enemy)
		{
			sprite_index = spr_cursor_attack;
		}
		else if(hover_over_broken_basetile)
		{
			sprite_index = spr_cursor_repair;
		}
		else
		{
			sprite_index = spr_cursor_move;
		}
	}
	else sprite_index = spr_cursor;
	
	#endregion
}
else // hovers over selectable
{
	#region set hover over selectable cursor
	
	if(scr_any_task_actors_selected() && component != noone && scr_instance_inherits(component, obj_interactable))
	{
		sprite_index = spr_cursor_assign;
	}
	else if(component != noone && scr_instance_inherits(component, obj_gate))
	{
		if(!component.locked)
		{
			if(component.is_open) sprite_index = spr_gate_close;
			else sprite_index = spr_gate_open;
		}
		else sprite_index = spr_cursor_select;
	}
	else sprite_index = spr_cursor_select;
	
	#endregion
}