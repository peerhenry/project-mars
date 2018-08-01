/// @description exposes get_delta_ij(counter)
var func = argument[0];
var args = argument[1];
var here = f_spiral_flawed_diamond;

switch(func)
{
	// use private_ indicator to discourage external calling of this method
	case "private_get_delta_indicator":
		var n = args[0];
		var i = 0;
		var a = 1;
		var b = 2;
		var c = 3;
		var d = 4;

		if(n < 4) return n;

		var M = floor( (1 + sqrt(1 + 8*n)) / 4 );
		var R = M*(2*M - 1);
		var p = n - R;
		var q = p div M;

		switch(q)
		{
			case 0:
				return a;
			case 1:
				return b;
			case 2:
				return c;
			case 3:
				{
					if(q == 3*M) return i;
					return d;
				}
			default:
				return d;
		}
		break;
	
	
	case "get_delta_ij":
		var indicator = in(here, "private_get_delta_indicator", args)
		switch(indicator)
		{
			case 0: return [ 1, 0];
			case 1: return [-1,-1];
			case 2: return [-1, 1];
			case 3: return [ 1, 1];
			case 4: return [ 1,-1];
		}
		break;
	
	// UNIT TESTS
	
	case test: 
		in(here, "get_delta_ij_test");
		break;
	
	case "get_delta_ij_test":
		run_fs_test(here, "get_delta_ij_0");
		run_fs_test(here, "get_delta_ij_1");
		run_fs_test(here, "get_delta_ij_4");
		run_fs_test(here, "get_delta_ij_5");
		run_fs_test(here, "get_delta_ij_12");
		run_fs_test(here, "get_delta_ij_14");
		run_fs_test(here, "get_delta_ij_15");
		break;
	
	case "get_delta_ij_0":
		var result = in(here, "get_delta_ij", [0])
		assert_equal(1, result[0], "delta i");
		assert_equal(0, result[1], "delta j");
		break;

	case "get_delta_ij_1":
		var result = in(here, "get_delta_ij", [1])
		assert_equal(-1, result[0], "delta i");
		assert_equal(-1, result[1], "delta j");
		break;
		
	case "get_delta_ij_4":
		var result = in(here, "get_delta_ij", [4])
		assert_equal(1, result[0], "delta i");
		assert_equal(0, result[1], "delta j");
		break;
	
	case "get_delta_ij_5":
		var result = in(here, "get_delta_ij", [5])
		assert_equal(1, result[0], "delta i");
		assert_equal(-1, result[1], "delta j");
		break;
	
	// At number 12 the "flaw" begins, for a proper diamond it should be [1,0] here
	// this is why this algorithm is named "flawed_diamond"
	case "get_delta_ij_12":
		var result = in(here, "get_delta_ij", [12])
		assert_equal(1, result[0], "delta i");
		assert_equal(-1, result[1], "delta j");
		break;
	
	case "get_delta_ij_14":
		var result = in(here, "get_delta_ij", [14])
		assert_equal(1, result[0], "delta i");
		assert_equal(-1, result[1], "delta j");
		break;
	
	case "get_delta_ij_15":
		var result = in(here, "get_delta_ij", [15])
		assert_equal(-1, result[0], "delta i");
		assert_equal(-1, result[1], "delta j");
		break;
}