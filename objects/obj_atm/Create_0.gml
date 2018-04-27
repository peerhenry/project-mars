event_inherited();
capacity = 3;
embarked_astronauts = ds_list_create();

is_interactable = true;
var appear_setter = ioc_resolve(ioc_container, "appear_setter");
scr_acquire_class(id, [appear_setter, 1]);