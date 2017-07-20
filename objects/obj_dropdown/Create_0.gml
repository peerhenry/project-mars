item_labels = ds_list_create();
item_widths = ds_list_create();
item_heights = ds_list_create();

ds_list_add(item_labels, 
"800 x 480", 
"1024 x 768", 
"1280 x 720", 
"1366 x 768", 
"1400 x 1050", 
"1600 x 900", 
"1920 x 1080"
);

ds_list_add(item_widths, 
800, 
1024,
1280,
1366,
1400,
1600,
1920
);

ds_list_add(item_heights, 
480, 
768, 
720, 
768, 
1050,
900, 
1080
);

image_speed = 0;
text = "1920 x 1080";