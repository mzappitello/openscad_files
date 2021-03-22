// simple l bar for support testing
//
//   ^        |----w2-----| -
//   |    -    ************ |
//   |    |    ************ h2
//   |    h1   ****         -
//   |    |    ****
//   |    -    ****
//   |        |-w1-|
//   z
//    x ---------------------------->
//
// depth is how far the model goes in y

height = 30;
width = 20;
thickness = 5;
depth = 10;

union() {
translate([width, 0, 0])
cube([ thickness, depth, height ], false);

cube([ thickness, depth, height ], false);

translate([0, 0, (height-thickness)/2])
cube([width, depth, thickness]);
}

