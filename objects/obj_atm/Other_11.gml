/// @description Interact

// todo: give interactables an interaction_handler that has an interact method of 2 paramters: (interactable, actor)
//



// var embarker = call(global.ioc_container, "resolve", c_atm_embarker);
// call(embarker, "embark", astro); // how to get the astro...

// how to get the astro...
// refactor:
// make a c_interactable
// it has an interact method
// astronaut will store the interactable when doing the assign click
// at end path, astronaut calls the interactable:
// 
// call(interactable, "interact", id);
//
// Then how to distinguish interactable behavior?

// in create event for interactable objects, set class as c_interactabele
// that way, the click event can check if its an interactable with
// variable_instance_exists(thing, class) && class == c_interactable
// also in create event, set the interaction
// interaction = new(c_interaction_closet)