function init_rules() {
#region create rules map
	var rules = ds_map_create();
	var rules_sections = ds_list_create();
	var rules_section_keys = ds_map_create();
	var rule_global_copy_settings = ds_map_create();
	global.rules = rules;
	global.rules_sections = rules_sections;
	global.rules_section_keys = rules_section_keys;
	global.rule_global_copy_settings = rule_global_copy_settings;
#endregion

#region init defaults

	// testing
	/*
	scr_rules_add("test_section", "test_key", 42);
	if(!ds_map_exists(rules, "test_section")) show_error("scr_rules_add did not add section", true);
	if(!ds_map_exists(rules_section_keys, "test_section")) show_error("scr_rules_add did not add section to rules_section_keys", true);
	if(ds_list_size(rules_sections) != 1) show_error("scr_rules_add did not add section to rules_sections", true);
	var sm = rules[? "test_section"];
	if(!ds_map_exists(sm, "test_key")) show_error("scr_rules_add did not add key to section", true);
	*/
	// testing

	var section = "grids";
	scr_rules_add(section, "sensor_energy_consumption", 1);
	scr_rules_add(section, "drill_energy_consumption", 5);
	scr_rules_add(section, "pump_energy_consumption", 2);
	scr_rules_add(section, "pump_water_production", 20);
	scr_rules_add(section, "electrolyser_energy_consumption", 1);
	scr_rules_add(section, "hydroponics_water_consumption", 1);
	scr_rules_add(section, "solar_panel_energy_production", 2);

	section = "weapons";
	scr_rules_add(section, "time_to_shoot", 1);		// this is ROF, should also be weapon dependent
	scr_rules_add(section, "projectile_speed_factor", 1);
	scr_rules_add(section, "projectile_damage_factor", 1);

	section = "pistol";
	scr_rules_add_with_global(section, "range", 8, false);
	scr_rules_add_with_global(section, "damage", 1.2, false);
	scr_rules_add_with_global(section, "burst", 1, false);
	scr_rules_add_with_global(section, "projectile_speed", 30, false);
	// todo: sound?

	section = "rifle";
	scr_rules_add_with_global(section, "range", 12, false);
	scr_rules_add_with_global(section, "damage", 0.6, false);
	scr_rules_add_with_global(section, "burst", 3, false);
	scr_rules_add_with_global(section, "projectile_speed", 30, false);

#endregion

#region read/write ini

	ini_open(macro_rules_file);

	var sections_list = rules_sections;
	for(var s = 0; s < ds_list_size(sections_list); s++)
	{
		var section_name = sections_list[|s];
		var section_copy_settings = rule_global_copy_settings[? section_name];
		var section_keys = rules_section_keys[? section_name];
		for(var k = 0; k < ds_list_size(section_keys); k++)
		{
			// get default value
			var key = section_keys[|k];
			var rules_section = rules[?section_name];
			var default_value = rules_section[? key];
			// read/write from ini file
			var exists = ini_key_exists(section_name, key);
			var value = ini_read_real(section_name, key, default_value);
			if(!exists) ini_write_real(section_name, key, default_value);	// write to .ini if the key didn't exist
			else rules_section[? key] = value;								// else overwrite rule with the value from .ini
			// set global value
			var copy_to_global = section_copy_settings[? key];
			if(copy_to_global) variable_global_set(key, value);
		}
	}

	// testing
	// if(!variable_global_exists("test_key")) show_error("test_key did not exist on global scope", true);
	// if(global.test_key != 42) show_error("test_key != 42", true);

	ini_close();

#endregion


}
