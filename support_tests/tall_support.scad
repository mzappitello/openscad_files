top_height = 195;
top_support_height = 185;
mast_thickness = top_height - top_support_height;

mast_radius = 25;
pole_radius = 10;

// start with some seed points from 0 to the size of the egg
rotations = 3;
starting_height = 360 * rotations;
seed_points = [ 0 : 36 : starting_height];
sin_curve = [ for (x = seed_points) [ (pole_radius * abs(sin(x))) + 5, x] ];

union() {
  cylinder(h=1, r=5.1);

  scale([1, 1, top_support_height / starting_height])
  rotate_extrude($fn=200)
  polygon(sin_curve);

  translate([0, 0, top_support_height - 0.1])
    cylinder(h=mast_thickness, r=mast_radius);
}
