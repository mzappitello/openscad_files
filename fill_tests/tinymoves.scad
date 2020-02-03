y_length = 150;
height = 10;

translate([-5, 0, 0]) {
  for (i = [2:2]) {
    translate([(i-1) *10, -y_length / 2, 0]) {
      cube([i, y_length, height], false);
    }
  }
}
