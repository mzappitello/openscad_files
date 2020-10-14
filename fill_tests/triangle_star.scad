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

tsl = 100;
shift = 8;

tsl_s = 15;
shift_s = 35;

z_height = 30;

difference() {

  difference() {
    union() {
      translate([0, tsl / shift, 0])
      roundedTriangle(tsl, 10, z_height);

      translate([0, -tsl / shift, 0])
      rotate([0, 0, 180])
      roundedTriangle(tsl, 10, z_height);
    }

    translate([0, 0, -1])
    union() {
      // top
      translate([cos(90) * shift_s, sin(90) * shift_s, 0])
      roundedTriangle(tsl_s, 8, z_height);

      // top right
      translate([cos(30) * shift_s, sin(30) * shift_s, 0])
      rotate([0, 0, 60])
      roundedTriangle(tsl_s, 8, z_height);

      // bottom right
      translate([cos(30) * shift_s, -sin(30) * shift_s, 0])
      rotate([0, 0, 120])
      roundedTriangle(tsl_s, 8, z_height);

      // bottom
      translate([cos(90) * shift_s, -sin(90) * shift_s, 0])
      rotate([0, 0, 180])
      roundedTriangle(tsl_s, 8, z_height);

      // bottom left
      translate([-cos(30) * shift_s, -sin(30) * shift_s, 0])
      rotate([0, 0, 120])
      roundedTriangle(tsl_s, 8, z_height);

      // top left
      translate([-cos(30) * shift_s, sin(30) * shift_s, 0])
      rotate([0, 0, 60])
      roundedTriangle(tsl_s, 8, z_height);

      // center
      linear_extrude(height=z_height)
      circle(r=tsl_s);
    }
  }

  translate([-100, -100, 20])
  rotate([5, 5, 0])
  cube([200, 200, 20]);
}
