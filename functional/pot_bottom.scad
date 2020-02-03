pot_width = 4.75 * 25;
stand_thickness = .25 * 25;
lip_height = .5 * 25;
extra_bottom = .5 * 25;
extra_top = .75 * 25;

difference() {
	cylinder(stand_thickness + lip_height,
					 (pot_width + extra_bottom) / 2,
					 (pot_width + extra_top) / 2,
					 false);
	translate([0, 0, stand_thickness + 0.01])
	cylinder(lip_height,
					 (pot_width + stand_thickness) / 2,
					 (pot_width + stand_thickness) / 2,
					 false);
}