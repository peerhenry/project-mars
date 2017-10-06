var container = script_container_create();
script_container_register(container, "room_logic_basetile", scr_mock);
global.script_container = container;
return container;