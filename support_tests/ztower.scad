height = 80;
side = 60;
edge_width = 20;
hole_side = side - edge_width;

translate([0, 0, height/2])
difference() {
cube([side, side, height], true);

for(j = [1 : 4]) {
  translate([0, 0, (-height/2) + 15 * j])
  for(i = [0 : 3]) {
    rotate([90*i, 270, 0])
    translate([0, 20, -hole_side/2])
    linear_extrude(hole_side, false) {
      polygon(points=[[0, 0], [0, 100], [100, 100]]);
    }
  }
}

}


