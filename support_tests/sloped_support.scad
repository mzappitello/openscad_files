// four inverted pyramids about the origing
//
// width = the width of the base of a single pyramid
// angle = angle of the slope of a pyramid

width_t = 90;
length_t = 35;
angle = 85;
height_t = length_t / 2 * tan(angle);

echo(height_t);

width_c = width_t -5;
length_c = length_t - 5;
height_c = 5;

points = [
  [ 0, 0, 0 ],                  // 0
  [ 0, width_t, 0 ],              // 1
  [ length_t, width_t, 0 ],         // 2
  [ length_t, 0, 0 ],             // 3

  [ length_t, width_t, height_t ],    // 4
  [ length_t, 0, height_t],         // 5
];

faces = [
  // bottom face
  [ 0, 1, 2 ],
  [ 2, 3, 0 ],

  // left face
  [ 2, 4, 5 ],
  [ 3, 2, 5 ],

  // back face
  [ 4, 2, 1 ],

  // front face
  [ 0, 3, 5 ],

  // top face
  [ 5, 1, 0 ],
  [ 5, 4, 1 ],
  
];

union() {
polyhedron(points, faces);

translate([ (length_t - length_c) / 2 , (width_t - width_c) / 2 , height_t / 4 ])
cube(size = [ length_c, width_c, height_c ]);
}
