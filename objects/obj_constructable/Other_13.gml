/// @description Init
name = "constructable";
description = "";
icon = noone; // icon above the constructable (eg. assigned_icon)
construction_instance = noone;
damage = 0;
destroyed = false;
is_selected = false;
cable_adjacency = 0;
pipe_adjacency = 0;
draw_cables = false;
draw_pipes = false;
if(occupy_navgrid) scr_navgrid_occupy(occ_i, occ_j);