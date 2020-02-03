width = 15;
depth = 7.5;
thickness = 2;
height = 10;
head = 5;

scale([2, 4, 4]) {
translate([0, 0, 4.5]){
union() {
    translate([0, width / 4 -.81, -2]) {
        rotate([-45, 0, 0]) {
            cube([depth, width / 2, thickness], true);
        }
    }
    translate([0, -width / 4 + .81, -2]) {
        rotate([45, 0, 0]) {
            cube([depth, width / 2, thickness], true);
        }
    }
    translate([0, 0, height / 2]) {
        cube([depth, thickness, height], true);
    }
    translate([0, 0, height]) {
        cube([depth, width, thickness], true);
    }
    translate([0, 0, height + head]) {
        rotate([0, 90, 0]) {
            difference() {
                cylinder(thickness * 1.5, head, head, true);
                cylinder($fn=50, thickness * 1.5, head / 2, head / 2, true);
            }
        }
    }
}
}
}