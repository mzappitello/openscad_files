square_width = 45;
square_height = 5;

anchor_width = 10;

small_square_width = square_width - anchor_width*2;
small_square_height = square_height - 2;

//*
// anchors on side 1 and 2
translate([35, 35, 0])
difference(){
translate([-square_width/2, -square_width/2, 0])
cube([square_width, square_width, square_height]);

translate([-anchor_width, -anchor_width, 0])
translate([-square_width/2, -square_width/2, 0])
cube([square_width, square_width, small_square_height]);
}
// */

//*
// anchors on side 1, 2, 3, and 4
translate([-35, 35, 0])
difference(){
translate([-square_width/2, -square_width/2, 0])
cube([square_width, square_width, square_height]);

translate([-small_square_width/2, -small_square_width/2, 0])
cube([small_square_width, small_square_width, small_square_height]);
}
// */

//*
// anchors on side 1 and 3
translate([-35, -35, 0])
difference(){
translate([-square_width/2, -square_width/2, 0])
cube([square_width, square_width, square_height]);

translate([-small_square_width/2, -square_width/2, 0])
cube([small_square_width, square_width, small_square_height]);
}
// */

//*
// anchors on side 1, 2, and 3
translate([35, -35, 0])
difference(){
translate([-square_width/2, -square_width/2, 0])
cube([square_width, square_width, square_height]);

translate([-small_square_width/2, -square_width/2-anchor_width, 0])
cube([small_square_width, square_width, small_square_height]);
}
// */
