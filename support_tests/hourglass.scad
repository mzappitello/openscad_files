// the curve is all the points (f[x], x) scaled up by size.
curve = [ for (x =[ 0.0 : 0.5 : 80]) [x, 20*tan(x)] ];
points = concat( [ [0, 0] ], curve, [ [0, 20*tan(80)] ]);

translate([0, 0, 20*tan(80)])
union() {
  rotate([0, 180, 0])
  rotate_extrude($fn=200)       // rotate extrude the hourglass polygon
  polygon(points);              // create the hourglass polygon

  translate([0, 0, -1])
  rotate_extrude($fn=200)       // rotate extrude the hourglass polygon
  polygon(points);              // create the hourglass polygon
}
