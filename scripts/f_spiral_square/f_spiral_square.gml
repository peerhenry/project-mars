/// @description exposes get_delta_ij(counter)
var func = argument[0];
var args = argument[1];
var here = f_spiral_square;

switch(func)
{
	// use private_ indicator to discourage external calling of this method
	case "private_inverse_gauss":
		return (sqrt(1+8*args[0])-1)/2;
	
	case "get_delta_ij":
		var counter = args[0];
		var inv_gauss_val = in(here, "private_inverse_gauss", [ (counter+1)/2 ]);
		var arm_length = ceil(inv_gauss_val);
		var last_offset = arm_length*(arm_length - 1); // this is 2*gauss(arm_lengt - 1)
		var index_in_arm_pair = counter - last_offset;
		var in_first_arm = floor(index_in_arm_pair/arm_length) == 0;
		var in_ab = (arm_length % 2) != 0;
		if(in_ab)
		{
			if(in_first_arm) return [0, -1];
			else return [-1, 0];
		}
		else
		{
			if(in_first_arm) return [0, 1];
			else return [1, 0];
		}
		break;
	
	// UNIT TESTS
	
	case test: 
		in(here, "get_delta_ij_test");
		break;
	
	case "get_delta_ij_test":
		in(here, "test_delta_ij_counter", [ 0,  0, -1]);
		in(here, "test_delta_ij_counter", [ 1, -1,  0]);
		in(here, "test_delta_ij_counter", [ 2,  0,  1]);
		in(here, "test_delta_ij_counter", [ 3,  0,  1]);
		in(here, "test_delta_ij_counter", [ 4,  1,  0]);
		in(here, "test_delta_ij_counter", [ 5,  1,  0]);
		in(here, "test_delta_ij_counter", [11, -1,  0]);
		in(here, "test_delta_ij_counter", [12,  0,  1]);
		in(here, "test_delta_ij_counter", [19,  1,  0]);
		in(here, "test_delta_ij_counter", [20,  0, -1]);
		break;
	
	case "test_delta_ij_counter":
		var counter = args[0];
		var exp_di = args[1];
		var exp_dj = args[2];
		var scr_name = script_get_name(here);
		var test_label = scr_name + ".test_delta_ij(" + string(counter) + ")";
		test_init(test_label);
		var result = in(here, "get_delta_ij", [counter])
		assert_equal(exp_di, result[0], "delta i at n = " + string(counter));
		assert_equal(exp_dj, result[1], "delta j at n = " + string(counter));
		test_result();
		break;
}