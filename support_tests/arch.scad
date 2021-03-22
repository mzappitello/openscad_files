
width = 35;
outer_radius = 35;
inner_radius = 25;
thickness = outer_radius - inner_radius;

rotate([90, 0, 0])
rotate_extrude(angle=180, $fn=200)
translate([inner_radius, -width/2, 0])
square([thickness, width]);
