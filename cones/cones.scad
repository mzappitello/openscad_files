height = 50;
radius = 5;
count = 1;

base_height = 5;
base_side = count * 15 + radius * 2;

translate([-base_side/2, -base_side/2, 0])
union() {
cube([base_side, base_side, base_height]);

translate([radius, radius, 0])
for(i = [0:count]) {
  for(j = [0:count]) {
    translate([i * 15, j * 15, base_height - 0.1])
    cylinder(h=height, r1=radius, r2=0);
  }
}
}
