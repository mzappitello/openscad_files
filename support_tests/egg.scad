// a and b are parameters in the egg parametric equation
a = 1;
b = 0.6;
c = a - b;

// the function for drawing the egg curve goes from 0 to 1. this parameter
// allows us to scale the egg up. in effect, this is the height of the egg.
size = 50;

// function for creating an egg curve.
// http://www.geocities.jp/nyjp07/index_egg_E.html function 9b.
function egg(x) = sqrt(c - 2*x + sqrt(4*b*x + c*c)) / sqrt(2) * sqrt(x);

// start with some seed points from 0 to the size of the egg
seed_points = [ 0.0 : 0.1 : size];
scaled_points = [ for (x = seed_points) x / size ];

// the curve is all the points (f[x], x) scaled up by size.
egg_curve = [ for (x = scaled_points) [ size * egg(x), x * size ] ];

// add begining and end points to the egg curve
points = concat( [ [0, 0] ], egg_curve, [ [0, size] ]);
// echo(points);

translate([0, 0, size])       // move from below x-y to above
rotate([0, 180, 0])           // flip the egg over
rotate_extrude($fn=200)       // rotate extrude the egg polygon
polygon(points);              // create the egg polygon
