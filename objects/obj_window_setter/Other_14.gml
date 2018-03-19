/// @description Resize application surface

if(debug_steps && !show_question("Set application surface size="+string(width)+"x"+string(height)+"?")) exit;

//// Set the resolution we've programmed the game for
//var base_width = macro_window_base_width;
//var base_height = macro_window_base_height;

//// Determine aspect ratio
//var aspect = base_width/base_height;

//// Work out the adjusted height and width to maintain aspect ratio
//var surface_height = min(base_height, height);
//var surface_width = height * aspect;

// Resize the application surface to adjusted values
scr_trace("obj_window_setter: surface_resize " + string(width) + "x" + string(height));
surface_resize(application_surface, width, height); //This will resize the application surface so that it fills the screen/window correctly. Only use this along with views.