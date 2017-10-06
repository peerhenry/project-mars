init_map();
init_globals();

init_construction_globals();
init_construction_enums();
var inst_layer = layer_get_id("Instances");
init_constructions_create_map(inst_layer, inst_layer, inst_layer);