base_x = 10;
step_x = 10;

start_y = 5;
end_y = 10;

num_steps = 5;

hop = 0.1;

begin = [ [0, 0], [base_x, 0] ];

function x1(n) = base_x + step_x * n;
function x2(n) = base_x + step_x * (n+1);
function y(n) = start_y + (n * hop);
steps = [ for (n=[0 : num_steps]) [ [x1(n), y(n)], [x2(n), y(n)] ] ];

function flatten(l) = [ for (a = l) for (b = a) b ] ;

end = [ [base_x + step_x * (num_steps + 1), end_y], [0, end_y] ];

points = concat(begin, flatten(steps), end);

echo(points);

// translate([0, 0, size])       // move from below x-y to above
// rotate([0, 180, 0])           // flip the egg over
rotate_extrude($fn=200)       // rotate extrude the egg polygon
polygon(points);
