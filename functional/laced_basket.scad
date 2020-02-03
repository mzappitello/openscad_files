/*

openSCAD program to make a basket with
sides weaved or laced from strands of plastic

module strand makes this possible -
it creates a strand that undulates up and
down in z - the strands are then fit together
to form the sides of the basket

the strands do not touch so the sides of the
basket are flexible - strong yet flexible
sides are especially noted when Makerbot's
tough PLA is used.

code is simple - see the explanation in
the strand module 

pcm Febuary 2018
*/



/*
parameters for frame width, length, height, and thickness of support frame members 
*/

bw = 40;
bl = 20;
bh = 65;
th = 4;

/*
difference statement makes the holes for the handles

basket module makes the basket by moving weaved sides into position to
accomodate the frame
*/

difference() {
 union() {
   basket();
   
   // outline for handle
   // translate([30,0,50]) cube([5,18,12],center=true);
   // translate([-30,0,50]) cube([5,18,12],center=true);
 }

  union() {
    // removed bits to make handle
    // translate([30,0,50]) cube([16,14,8],center=true);
    // translate([-30,.5,50]) cube([16,14,8],center=true);
  }
}

module basket() {
  union() {
    /* adds the four "weaved" sides to the frame */
    frame(bw, bl, bh, th);

    length = bl - th;
    width = bw - th;
    height = bh - th;

    translate([0, length / 2, height / 2])
    rotate([90,0,0])
    weave(0, width, height, 1, 1.25, 1, 1.45);

    translate([0,-length / 2, height / 2])
    rotate([90,0,0])
    weave(0, width, height, 1, 1.25, 1, 1.45);

    translate([width / 2, 0, height / 2])
    rotate([90,0,90])
    weave(0, length , height, 1, 1.25, 1, 1.45);

    translate([-width / 2, 0, height / 2])
    rotate([90,0,90])
    weave(0, length, height, 1, 1.25, 1, 1.45);
  }
}

module frame(bw,bl,bh,th) {
  bw = bw - th;
  bl = bl - th;

  translate([bw/2,bl/2,bh/2]) cube([th,th,bh],center=true);
  translate([-bw/2,bl/2,bh/2]) cube([th,th,bh],center=true);
  translate([bw/2,-bl/2,bh/2]) cube([th,th,bh],center=true);
  translate([-bw/2,-bl/2,bh/2]) cube([th,th,bh],center=true);

  cube([bw+th,bl+th,th],center=true); // solid bottom

  translate([bw/2, 0, bh - th/2]) cube([th,bl,th],center=true);
  translate([-bw/2, 0, bh - th/2]) cube([th,bl,th],center=true);
  translate([0, -bl/2, bh - th/2]) cube([bw,th,th],center=true);
  translate([0, bl/2, bh - th/2 ]) cube([bw,th,th],center=true);

}

module weave(ns, nfx, nfy, ni, radius, sc1, sc2) {
/*
parameters are passed on to strand makes a weaved fabric ca 60 x 60 mm
*/
  offset = 7;

  translate([-(nfx / 2), -(nfy / 2), 0])
  union() {
    for (tr = [9 : 9 : nfy]) {
      translate([0, tr, 0])
      strand(ns, nfx, ni, radius, 1, 0, 40, offset, sc1, sc2);
    }
   
    for (tr = [9 : 9 : nfx]) {
      translate([tr,0,0])
      strand(ns, nfy, ni, radius, 0, 1, 40, -offset, sc1, sc2);
    }

    for (tr = [9 : 9 : nfy]) {
      translate([0, tr - 4.5, 0])
      strand(ns, nfx, ni, radius, 1, 0, 40, -offset, sc1, sc2);
    }

    for (tr = [9 : 9 : nfx]) {
      translate([tr -4.5,0,0])
      strand(ns, nfy, ni, radius, 0, 1, 40, offset, sc1, sc2);
    }
  }
}

module strand(ns,nf,ni,rb,a,b,c,d,sc1,sc2) {
/*
  makes an undulating strand -  along x or y or other direction
  if required - undulation up and down z with use of sin

  parameters -

  ns = start value for strand
  nf = end value for strand
  ni = interval between ns and nf - determines number of pieces in strand

  a  = multiplicative value for x coordinates
  b  = multiplicative value for y coordinates

  c  = multiplicative value - times position
       in strand determines length of undulation - sin wave
       normally some factor of 360 - say 36, 40, 60 etc
  d  = sets offset for undulation - related to 90, 180, etc

  rb = sets size of ribbon

  sc1 scale factor for x and y coordinates
  sc2 scale factor for z (undulation)

  strand(0,100,1,1,1,0,36,0,1,1);
  makes a strand 100 mm long along x with 10 undulations

  */

  for ( t = [ns:ni:nf]) {
    u = t -d;
    x1 = a * t * sc1;
    y1 = b * t * sc1;
    x2 = a * (t+ni) * sc1;
    y2 = b * (t+ni) * sc1;
    z1 = sin(c * u) * sc2;
    z2 = sin((c * u) + (c * ni)) * sc2;
    tx = (x1 + x2) / 2;
    ty = (y1 + y2) / 2;
    tz = (z1 + z2) / 2;
    ax = x1 - x2;
    ay = y1 - y2;
    az = z1 - z2;

    translate(v = [tx, ty, tz])
    rotate(a = [-acos(az/sqrt(ax*ax + ay*ay + az*az)), 0, -atan2(ax, ay)])
    cube([1.6 * rb, .7 * rb, 1.25 * sqrt(ax*ax + ay*ay + az*az)], center=true);
  }
}

/*
weave(0, 90, 70, 1, 1.25, 1, 1.45);

strand(0, 100,  // start and end
       0.1,     // interval
       1,       // width of ribbon
       1,       // multiplicitive x
       0,       // multiplicitive y
       36,      // frequency
       0,       // offset at start
       1,       // x / y scale
       8);      // z scale (amplitude)
*/
