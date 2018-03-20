/// @description Debug supported AA-levels

var supported = "";
for(var aa = 2; aa <= display_aa; aa *= 2)
{
	if((aa & display_aa) == aa)
	{
		if(supported != "") supported += ", ";
		supported += string(aa)
	}
}
if(supported == "") supported = "none";
show_debug_message("Supported AA-levels: " + supported);