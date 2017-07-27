image_x_scale = 1;
image_y_scale = 1;

#macro macro_slider_offset 16
#macro macro_slider_label_offset 8
#macro macro_calculate_percentage round((x-left_limit)/(right_limit-left_limit)*100)
#macro macro_on_change 0

left_limit = x - sprite_width/2 + image_x_scale*macro_slider_offset;
right_limit = x + sprite_width/2 - image_x_scale*macro_slider_offset;

slider = instance_create_layer(x, y, layer, obj_h_slider);
slider.slider_bar = id;
slider.depth -= 1; // draw slider on top of bar
slider.image_x_scale = image_x_scale;
slider.image_y_scale = image_y_scale;
slider.bar_length = sprite_width;
slider.left_limit = left_limit;
slider.right_limit = right_limit;
slider.x = left_limit;

text = "";