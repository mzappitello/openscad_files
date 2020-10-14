z_height = 20;

y_length = 150;
y_step = 10;

inside_x = 20;
outside_x = 100;

translate([0, 0, z_height]) {
rotate([180, 0, 0]) {
difference() {
translate([-inside_x/2, -y_length/2, 0])
union() {
  cube([inside_x, y_length, z_height], false);

  translate([-(outside_x/2 - inside_x/2), 0 * y_step, 0])
  cube([outside_x, y_step, z_height], false);

  translate([-(outside_x/2 - inside_x/2), 2 * y_step, 0])
  cube([outside_x, y_step, z_height], false);

  translate([-(outside_x/2 - inside_x/2), 4 * y_step, 0])
  cube([outside_x, y_step, z_height], false);

  translate([-(outside_x/2 - inside_x/2), 6 * y_step, 0])
  cube([outside_x, y_step, z_height], false);

  translate([-(outside_x/2 - inside_x/2), 8 * y_step, 0])
  cube([outside_x, y_step, z_height], false);

  translate([-(outside_x/2 - inside_x/2), 10 * y_step, 0])
  cube([outside_x, y_step, z_height], false);

  translate([-(outside_x/2 - inside_x/2), 12 * y_step, 0])
  cube([outside_x, y_step, z_height], false);

  translate([-(outside_x/2 - inside_x/2), 14 * y_step, 0])
  cube([outside_x, y_step, z_height], false);
}

translate([-100, -100, 15])
rotate([5, 5, 0])
cube([200, 200, 20]);
}
}
}
