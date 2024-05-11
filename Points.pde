class Point {
  float x, y, size;
  int brushType;
  color c;
  //gets all data for each drawn object
  Point(float x, float y, float size, int brushType, color c) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.brushType = brushType;
    this.c = c;
  }
}
