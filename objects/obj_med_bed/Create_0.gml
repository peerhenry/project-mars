event_inherited();

is_interactable = true;
var appear_setter = ioc_resolve(ioc_container, "appear_setter");
scr_apply_class(id, c_astro_container, [appear_setter]);