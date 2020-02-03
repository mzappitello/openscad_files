// four inverted pyramids about the origing
//
// width = the width of the base of a single pyramid
// angle = angle of the slope of a pyramid

width = 40;
angle = 75;

height = width / 2 * tan(angle);

points = [
    // bottom points
    [width / 2, width / 2, 0],          // 0
    [-width / 2, width / 2, 0],         // 1
    [-width / 2, -width / 2, 0],        // 2
    [width / 2, -width / 2, 0],         // 3
    
    // center point
    [0, 0, height],                     // 4

    // top corners
    [width, width, height],             // 5
    [-width, width, height],            // 6
    [-width, -width, height],           // 7
    [width, -width, height],            // 8

    // top midpoints
    [0, width, height],                 // 9
    [-width, 0, height],                // 10
    [0, -width, height],                // 11
    [width, 0, height],                 // 12

    // top cube corners
    [width, width, height + 10],       // 13
    [-width, width, height + 10],      // 14
    [-width, -width, height + 10],     // 15
    [width, -width, height + 10],      // 16
];

faces = [
    // I
    [ 5, 0, 12 ],
    [ 12, 0, 4 ],
    [ 4, 0, 9 ],
    [ 9, 0, 5 ],

    // II
    [ 9, 1, 4 ],
    [ 4, 1, 10 ],
    [ 10, 1, 6 ],
    [ 6, 1, 9 ],

    // III
    [ 4, 2, 11 ],
    [ 11, 2, 7 ],
    [ 7, 2, 10 ],
    [ 10, 2, 4 ],

    // IV
    [ 12, 3, 8 ],
    [ 8, 3, 11 ],
    [ 11, 3, 4 ],
    [ 4, 3, 12 ],

    // cube atop
    [ 13, 14, 15, 16 ],
    [ 13, 5, 8, 16 ],
    [ 16, 8, 7, 15 ],
    [ 15, 7, 6, 14 ],
    [ 14, 6, 5, 13 ]
    
];

polyhedron( points, faces);
