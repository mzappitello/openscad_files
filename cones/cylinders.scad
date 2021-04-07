height = 20;
radius_min = 5;
radius_max = 25;
count = 4;

side_counts = ceil(sqrt(count));
echo("Side Count: ", side_counts);

radius_step = (radius_max - radius_min) / count;

base_height = 1;
base_width = 2 * side_counts *radius_max + 2;

translate([-base_width/2, -base_width/2, 0])
union() {
cube([base_width, base_width, base_height]);

translate([radius_max, radius_max, base_height-0.1])
for(i = [0:side_counts-1]) {
  for(j = [0:side_counts-1]) {
    k = i * side_counts + j + 1;
    echo("i: ", i, "j: ", j, "k: ", k);
    if (k < count + 1) {
      radius = radius_min + radius_step * k;
      translate([j*2*radius_max, i*2*radius_max, 0])
      cylinder(h=height, r1=radius, r2=radius, $fa=1);
    }
  }
}
}
