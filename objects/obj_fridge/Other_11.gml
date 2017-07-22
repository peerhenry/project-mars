/// @description Interact with assigned astronaut

var success = scr_inventory_transfer(assigned_astronaut.inventory, inventory, macro_inventory_food);
if(!success) scr_inventory_transfer(inventory, assigned_astronaut.inventory, macro_inventory_food);
scr_unassign_task(id);