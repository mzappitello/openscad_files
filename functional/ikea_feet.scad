leg_height = 60;
leg_base = 25;
leg_top = 20;

inset_height = 25;
inset_base = 17;
inset_top = 15;

difference() {
    cylinder(leg_height, leg_base, leg_top, false);
    translate([0, 0, leg_height - inset_height])
    cylinder(inset_height, inset_base, inset_top, false);
}