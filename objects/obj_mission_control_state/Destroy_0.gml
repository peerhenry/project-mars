for(var n = 0; n < ds_list_size(site_list); n++)
{
	var site = site_list[|n];
	instance_destroy(site);
}
ds_list_destroy(site_list);