height = 50;
radius_min = 1;
radius_max = 10;
count = 10;

radius_step = (radius_max - radius_min) / count;

base_height = 5;
base_width = 2*radius_max + 2;
base_thickness = 2*radius_max * count + 2;

translate([-base_width/2, -base_thickness/2, 0])
union() {
cube([base_width, base_thickness, base_height]);

translate([radius_max, radius_max, base_height-0.1])
for(i = [0:count-1]) {
  radius = radius_min + radius_step * i;
  translate([0, i*2*radius_max, 0])
  cylinder(h=height, r1=radius, r2=0);
}
}
