z_height = 20;

y_length = 150;
y_step = 10;

inside_x = 20;
outside_x = 100;

module roundedTriangle(side_length, radius, height) {
  // extrude the shape through z
  linear_extrude(height=height)
  hull() {
    // place 4 circles in the corners the convex hull algorithm
    // will wrap around them

    tri_height = side_length * sin(60);

    // BOTTOM LEFT
    translate([(-side_length / 2 + radius/2), (-tri_height/2 + radius/2), 0])
    circle(r=radius);

    // BOTTOM RIGHT
    translate([(side_length / 2 - radius/2), (-tri_height/2 + radius/2), 0])
    circle(r=radius);

    // TOP
    translate([0, (tri_height/2 - radius/2), 0])
    circle(r=radius);
  }
}

tsl = 150;
shift = 8;

tsl_s = 25;
shift_s = 50;

difference() {
union() {
translate([0, tsl / shift, 0])
roundedTriangle(tsl, 10, 15);

translate([0, -tsl / shift, 0])
rotate([0, 0, 180])
roundedTriangle(tsl, 10, 15);
}

translate([0, 0, -1])
union() {
// top
translate([cos(90) * shift_s, sin(90) * shift_s, 0])
roundedTriangle(tsl_s, 8, 17);
}

// top right
translate([cos(30) * shift_s, sin(30) * shift_s, 0])
rotate([0, 0, 60])
roundedTriangle(tsl_s, 8, 17);

// bottom right
translate([cos(30) * shift_s, -sin(30) * shift_s, 0])
rotate([0, 0, 120])
roundedTriangle(tsl_s, 8, 17);

// bottom
translate([cos(90) * shift_s, -sin(90) * shift_s, 0])
rotate([0, 0, 180])
roundedTriangle(tsl_s, 8, 17);

// bottom left
translate([-cos(30) * shift_s, -sin(30) * shift_s, 0])
rotate([0, 0, 120])
roundedTriangle(tsl_s, 8, 17);

// top left
translate([-cos(30) * shift_s, sin(30) * shift_s, 0])
rotate([0, 0, 60])
roundedTriangle(tsl_s, 8, 17);

// center
linear_extrude(height=17)
circle(r=tsl_s);
}
