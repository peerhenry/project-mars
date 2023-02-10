function scr_create_item(argument0) {
	var arg_item_type = argument0;

	var new_item = instance_create_depth(0, 0, 0, obj_item);
	new_item.type = arg_item_type;
	new_item.size = scr_item_type_size(arg_item_type);
	switch(arg_item_type)
	{
		case item_type.pistol:
			new_item.name = "Pistol";
			new_item.charge = 100;
			new_item.class = item_class.weapon;
			new_item.range = scr_rules_get("pistol", "range");
			new_item.burst = scr_rules_get("pistol", "burst");
			new_item.damage = scr_rules_get("pistol", "damage");
			new_item.projectile_speed = scr_rules_get("pistol", "projectile_speed");
			break;
		case item_type.rifle:
			new_item.name = "Rifle";
			new_item.charge = 100;
			new_item.class = item_class.weapon;
			new_item.range = scr_rules_get("rifle", "range");
			new_item.burst = scr_rules_get("rifle", "burst");
			new_item.damage = scr_rules_get("rifle", "damage");
			new_item.projectile_speed = scr_rules_get("rifle", "projectile_speed");
			break;
		case item_type.food:
			new_item.name = "Food (restores food level 100%)";
			new_item.class = item_class.food;
			break;
		case item_type.mdu:
			new_item.name = "MDU";
			new_item.class = item_class.construction;
			break;
	}
	return new_item;


}
