top_side_length = 100;
top_thickness = 10;

stilts_height = 20;
stilts_side_length = 4;

translate([-50, -50, 0])
union() {
  // generate the top that the stilts will sit on
  difference() {
    translate([0, 0, stilts_height])
    cube([top_side_length, top_side_length, top_thickness], false);
    for(i = [0:4]) {
      for(j = [0:4]) {
        if ((i + j) % 2 == 0) {
          translate([(i*20+ 5), (j*20 + 5), 0])
          cube([10, 10, stilts_height + 20], false);
        } else {
          /*
          translate([(i*20+ 5), (j*20 + 5), stilts_height/2])
          cube([stilts_side_length, stilts_side_length, stilts_height/2], false);
          */
        }
      }
    }
  }

  for(i = [0:4]) {
    for(j = [0:4]) {
      if ((i + j) % 2 == 0) {
        /*
        translate([(i*20+ 5), (j*20 + 5), 0])
        cube([stilts_side_length, stilts_side_length, stilts_height], false);
        */
      } else {
        translate([(i*20+ 5), (j*20 + 5), stilts_height/2])
        cube([stilts_side_length, stilts_side_length, stilts_height/2], false);
      }
    }
  }
}

