// generate various floating objects to generate support under

slice_thickness = 5;
float_distance = 5;
width = 40;
radius = width/2;

union() {
  translate([-radius, -radius, 0])
  cube([width, width, slice_thickness]);
  translate([radius, 0, 0])
  cylinder(r=radius, h=slice_thickness);
}

translate([0, 0, float_distance + slice_thickness])
union() {
  translate([-radius, -radius, 0])
  cube([width, width, slice_thickness]);
  translate([radius, 0, 0])
  cylinder(r=radius, h=slice_thickness);
}
