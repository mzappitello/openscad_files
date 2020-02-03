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

h1 = 50;
h2 = 10;
w1 = 20;
w2 = 100;
depth = 50;

cube([ w2, depth, h2 ], false);
cube([ w1, depth, h1 ], false);
translate([ 5, 5, h1 - h2 ]) { cube([ w2 - 10, depth-10, h2 ], false); }
