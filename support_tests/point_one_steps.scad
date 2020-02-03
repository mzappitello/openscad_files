y = 25;

base_x = 10;
step_x = 15;

start_z = 5;
z_thickness = 10;

num_steps = 6;

function x(i) = base_x + i * step_x;
function z(i) = start_z - 0.1 * (i % 2);

union() {
  cube([base_x, y, start_z + z_thickness]);
  for(i = [0 : num_steps]) {
    translate([x(i), 0, z(i)])
    cube([ step_x, y, z_thickness], false);
  }
}
