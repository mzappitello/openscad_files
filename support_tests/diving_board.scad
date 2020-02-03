// size of the base of the diving board
base_width = 5;
base_height = 15;

segment_height = 10;
segment_width = 30;

angles = [ 25, 20, 15, 10 ];

// first points to hit. runs across the base and up to where the first segment
// will start
initial_p = [
    [ 0, 0 ],
    [ base_width, 0 ],
    [ base_width, base_height - segment_height ]
];

// last points to travel to.
end_p = [
    [ base_width, base_height ],
    [ 0, base_height ]
];

// counters to make list comprhensions easier.
count = len(angles) - 1;
iters = [ 0 : count ];

// recursively accumulates values in a list. we need this since openscad won't
// let us append to array.
function accum(i, list) = i < 1 ?  list[0] : list[i] + accum(i - 1, list); 

// for each angle, calculate delta z. then accumulate. then add in init heigh.
z_deltas = [ for (theta = angles) segment_width * sin(theta) ];
z_delta_accum = [ for(i = iters) accum(i, z_deltas) ];
thicknesses = [ for (theta = angles) segment_height * cos(90 - theta) ];

bottom_z = [ for (z = z_delta_accum) z + base_height - segment_height ];
top_z = [ for (i = iters) bottom_z[i] + thicknesses[i] ];

// do the same for the x direction.
x_deltas = [ for (theta = angles) segment_width * cos(theta) ];
x_delta_accum = [ for (i = iters) accum(i, x_deltas) ];
x = [ for (x = x_delta_accum) x + base_width ];

bottom_p = [ for (i = iters) [ x[i], bottom_z[i] ] ];
top_p = [ for (i = iters) [ x[count - i], top_z[count - i] ] ];

points = concat(initial_p, bottom_p, top_p, end_p);

// translate([0, -85, 0])
// cube([10, 170, 10], true);

rotate([90, 0, -90])             // rotate the diving board to extrude over x-y
linear_extrude(height=20)     // linearly extrude the 2d diving board
polygon(points=points);       // create a 2d diving board from points

