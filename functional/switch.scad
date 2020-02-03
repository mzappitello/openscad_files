// import("/Users/mike.zappitello/Desktop/switch.stl");

z_height = 25;
wall_thickness = 12;

switch_gap_height = 28;
switch_gap_width = 102;
table_gap = 28.5;

solid_height = switch_gap_height + table_gap + (wall_thickness * 3);
solid_width = 150;

start_x = 0; start_y = 0; start_z = 0;


difference() {
translate([start_x, start_y, start_z])
	cube([solid_width, solid_height, z_height], center = false);
	
translate([start_x + wall_thickness + 10, start_y + wall_thickness, start_z- 0.1])
	cube([switch_gap_width, switch_gap_height, z_height + 0.2], center = false);
	
translate([start_x + wall_thickness + 10, start_y + 2 * wall_thickness + switch_gap_height, start_z - 0.1])
	cube([solid_width, table_gap, z_height + 0.2]);
}
