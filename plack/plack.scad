module roundedRect(size, radius) {
  x_top = size[0];
  x_bottom = size[1];
  y = size[2];
  z = size[3];

  x_top_shift = (x_bottom - x_top) / 2;

  // extrude the shape through z
  linear_extrude(height=z)
  hull() {
    // place 4 circles in the corners the convex hull algorithm
    // will wrap around them

    // BOTTOM LEFT
    translate([(radius/2), (radius/2), 0])
    circle(r=radius);

    // BOTTOM RIGHT
    translate([(x_bottom - radius/2), (radius/2), 0])
    circle(r=radius);

    // TOP LEFT
    translate([(x_top_shift + radius/2), (y - radius/2), 0])
    circle(r=radius);

    // TOP RIGHT
    translate([(x_top + x_top_shift - radius/2), (y - radius/2), 0])
    circle(r=radius);
  }
}

color_a_height = 5;
color_b_height = 5;

wall_thickness = 25;

// base parameters
outer_size = [190, 172, 60, color_a_height];
outer_radius = 6;

//*
// MATERIAL A
translate([outer_size[2]/2, -outer_size[1]/2 + 5, 0])
rotate([0, 0, 90])
roundedRect(size=outer_size, radius=outer_radius);
// */

// size of inner rect to subract from full base
inner_size = [
  outer_size[0] - wall_thickness / 2,
  outer_size[1] - wall_thickness / 2,
  outer_size[2] - wall_thickness / 2,
  color_b_height + 10.03
];

inner_radius = 6;

// text parameters
winners = "KMoney";
winners_size = 20;
tournament_name = "End Of Year Eight Ball";
tournament_size = 8;
font = "Liberation Sans";

// translation for text
winner_text_translate = [
  35,
  30,
  color_a_height
];
tournament_text_translate = [
  60,
  10,
  color_a_height
];

//*
// MATERIAL B
translate([ outer_size[2]/2, -outer_size[1]/2 + 5, 0])
rotate([0, 0, 90])
union() {
  difference() {
    translate([0, 0, color_a_height])
    roundedRect(size=outer_size, radius=outer_radius);

    translate([wall_thickness/4, wall_thickness/4, color_a_height - 0.01])
    roundedRect(size=inner_size, radius=inner_radius);
  }
  translate(winner_text_translate) {
    linear_extrude(height=color_b_height)
    text(text=winners, font=font, size=winners_size);
  }
  translate(tournament_text_translate) {
    linear_extrude(height=color_b_height)
    text(text=tournament_name, font=font, size=tournament_size);
  }
}
// */
