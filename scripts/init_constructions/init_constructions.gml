/// Initialize constructions

init_construction_macros();
init_construction_enums();
init_construction_globals();

var basetile_layer = layer_get_id(macro_base_tile_layer);
var base_layer = layer_get_id(macro_base_layer);
var base_tall_layer = layer_get_id(macro_base_tall_layer);
init_constructions_create_map(basetile_layer, base_layer, base_tall_layer);