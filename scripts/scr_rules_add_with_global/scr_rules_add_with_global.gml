/// @arg section
/// @arg key
/// @arg default
var arg_section = argument0;
var arg_key = argument1;
var arg_default = argument2;
var arg_copy_to_global = argument3;

var rules = global.rules;								// contains values
var rules_sections = global.rules_sections;				// list containing sections for iteration
var rules_section_keys = global.rules_section_keys;		// map of lists containing keys for iteration
var rule_global_copy_settings = global.rule_global_copy_settings; // map containing booleans that say if the KVP should be put on the global scope
if(!ds_map_exists(rules, arg_section))
{
	// new section
	rules[? arg_section] = ds_map_create();
	ds_list_add(rules_sections, arg_section);				// register section for iteration
	rules_section_keys[? arg_section] = ds_list_create();
	rule_global_copy_settings[? arg_section] = ds_map_create();
}

// set default
var section_map = rules[? arg_section];
section_map[?arg_key] = arg_default;

var section_copy_settings = rule_global_copy_settings[? arg_section];
section_copy_settings[? arg_key] = arg_copy_to_global;

// register key for iteration
var section_keys = rules_section_keys[? arg_section];
ds_list_add(section_keys, arg_key);