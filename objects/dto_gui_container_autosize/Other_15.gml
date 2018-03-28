/// @description Update Geometry
var item_count = ds_list_size(gui_item_list);
var items_height = 0;
var items_width = 0;
var total_spacing = (item_count-1)*spacing;

#region calculate width and height

for(var n = 0; n < item_count; n++)
{
	var next_gui_item = gui_item_list[| n];
	if(orientation == stack.vertical)
	{
		items_height += next_gui_item.height;
		if(next_gui_item.width > items_width) items_width = next_gui_item.width;
	}
	else if(orientation == stack.horizontal)
	{
		items_width += next_gui_item.width;
		if(next_gui_item.height > items_height) items_height = next_gui_item.height;
	}
}

if(orientation == stack.vertical)
{
	width = items_width + 2*padding;
	height = items_height + 2*padding + total_spacing;
}
else if(orientation == stack.horizontal)
{
	width = items_width + 2*padding + total_spacing;
	height = items_height + 2*padding;
}

#endregion

#region update left top right bottom

if(anchor_item != noone)
{
	// anchor to bottom right of the anchor item
	// todo: use enums to enable anchoring anywhere relative to anchor item 
	left = anchor_item.right + 1;
	bottom = anchor_item.bottom;
	top = bottom - height;
	right = left + width;
}
else
{
	switch(halign)
	{
		case align_h.left:
			left = origin_x;
			break;
		case align_h.center:
			left = origin_x - width/2;
			break;
		case align_h.right:
			left = origin_x - width;
			break;
	}
	right = left + width;

	switch(valign)
	{
		case align_v.top:
			top = origin_y;
			break;
		case align_v.mid:
			top = origin_y - height/2;
			break;
		case align_v.bottom:
			top = origin_y - height;
			break;
	}
	bottom = top + height;
}

#endregion

#region update item geometries

var offset_x = left + padding;
var offset_y = top + padding;

for(var n = 0; n < item_count; n++)
{
	var next_gui_item = gui_item_list[| n];
	with(next_gui_item)
	{
		if(other.orientation == stack.vertical)
		{
			// set origin based on proper alignment
			origin_x = offset_x;
			if(halign == align_h.center) origin_x += width/2;
			else if(halign == align_h.right) origin_x += width;
			origin_y = offset_y;
			if(valign == align_v.mid) origin_y += height/2;
			else if(valign == align_v.bottom) origin_y += height;
			
			// offset origin based on content alignment
			var content_width = other.width - 2*other.padding;
			if(other.content_align_h == align_v.mid) origin_x += (content_width - width)/2;
			else if(other.content_align_h == align_v.bottom) origin_x += content_width;
			
			offset_y += height + other.spacing;
		}
		else if(other.orientation == stack.horizontal)
		{
			// set origin based on proper alignment
			origin_x = offset_x;
			if(halign == align_h.center) origin_x += width/2;
			else if(halign == align_h.right) origin_x += width;
			origin_y = offset_y;
			if(valign == align_v.mid) origin_y += height/2;
			else if(valign == align_v.bottom) origin_y += height;
			
			// offset origin based on content alignment
			var content_height = other.height - 2*other.padding;
			if(other.content_align_v == align_v.mid) origin_y += (content_height - height)/2;
			else if(other.content_align_v == align_v.bottom) origin_y += content_height;
			
			offset_x += width + other.spacing;
		}
		event_user(macro_gui_event_update_geomtery);
	}
}

#endregion