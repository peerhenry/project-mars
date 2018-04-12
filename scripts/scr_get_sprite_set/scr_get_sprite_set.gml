var arg_entity = argument0;

var output = [0,0,0,0,0,0];

switch(arg_entity.object_index)
{
	case obj_astronaut:
		if(arg_entity.wears_suit)
		{
			output[0] = spr_astronaut_suit_down;
			output[1] = spr_astronaut_suit_right;
			output[2] = spr_astronaut_suit_up;
			output[3] = spr_suit_mask_down;
			output[4] = spr_suit_mask_right;
			output[5] = spr_suit_mask_up;
			
			output[6] = spr_astro_suit_down_pistol;
			output[7] = spr_astro_suit_right_pistol;
			output[8] = spr_astro_suit_up_pistol;
		}
		else
		{
			output[0] = spr_male_down;
			output[1] = spr_male_right;
			output[2] = spr_male_up;
			output[3] = spr_male_mask_down;
			output[4] = spr_male_mask_right;
			output[5] = spr_male_mask_up;
			
			output[6] = spr_male_down_pistol;
			output[7] = spr_male_right_pistol;
			output[8] = spr_male_up;
		}
		break;
	case obj_robot: // todo: make cart and robot mask
		output[0] = spr_robot_down;
		output[1] = spr_robot_right;
		output[2] = spr_robot_up;
		output[3] = noone;
		output[4] = noone;
		output[5] = noone;
		
		output[6] = spr_robot_down;
		output[7] = spr_robot_right;
		output[8] = spr_robot_up;
		break;
	case obj_cart:
		output[0] = spr_cart_down;
		output[1] = spr_cart_right;
		output[2] = spr_cart_up;
		output[3] = noone;
		output[4] = noone;
		output[5] = noone;
		break;
	default:
		output[0] = spr_arrow_down;
		output[1] = spr_arrow_right;
		output[2] = spr_arrow_up;
		output[3] = noone;
		output[4] = noone;
		output[5] = noone;
		break;
}

return output;