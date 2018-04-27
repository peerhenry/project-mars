event_inherited();

is_interactable = true;
var appear_setter = ioc_resolve(ioc_container, "appear_setter");
scr_acquire_class(id, [appear_setter, 1]);
full_message = "Astronaut cannot enter med bed; med bed is occupied."