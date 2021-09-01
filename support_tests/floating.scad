// generate various floating objects to generate support under

float_height = 100;

translate([0, -20, float_height])
cube([40, 40, 20]);

translate([-50, 0, float_height])
cylinder(r=20, h=20);

translate([-150, -20, float_height])
union() {
translate([0, 10, 0])
cube([40, 20, 20]);

translate([10, 0, 0])
cube([20, 40, 20]);
}

for(i=[5:10]) {
  translate([100, -150 + 75 * (i-5), float_height])
  cylinder(r=20, h=20, $fn=i);
}
