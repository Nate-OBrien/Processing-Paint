class Cursors{
  ArrayList<Point> points = new ArrayList<Point>();
  
  float mSize;
  int mSizeCnt = 1;
  //hex code for coloring
  int dColor;
  boolean erase = false;
  boolean clear = false;
  public Cursors(float mSize, color dColor){
    this.mSize = mSize;
    this.dColor = dColor;
  }
  
  void update(float e){
  
    //increases/deceases brush size
    if(e == -1){
      mSize+=12.5;
    } else {
      mSize-=12.5;
    }
  
  //locks size
    if(mSize <= 12.5){mSize=12.5;}
    if(mSize >= 250){mSize=250;}
  }
  void drawPoints() {
  // Draw the points here
  for (Point point : points) {
    fill(point.c);
      noStroke();

    //switches shape for each drawn
    switch(point.brushType){
      case 0:
        circle(point.x, point.y, point.size);
        break;
      case 1:
        rect(point.x, point.y, point.size, point.size);
        break;
      case 2:
        triangle(point.x - point.size/2, point.y + point.size/2, point.x ,point.y - point.size/2, point.x + point.size/2, point.y + point.size/2);
        break;
      }
    }
  }
  void cursorSet(int s) {
    //sets shape to cursor
    fill(dColor,0);
    float shapeOffset =  mSize / 2;
    stroke(#FF0000);
    strokeWeight(10);
    if(mouseY > 100+shapeOffset){
       switch(s){
      case 0:
        circle(mouseX,mouseY,mSize);
        break;
      case 1:
        rect(mouseX,mouseY,mSize,mSize);
        break;
      case 2:
        triangle(mouseX-mSize/2,mouseY+mSize/2,mouseX,mouseY -mSize/2, mouseX+mSize/2,mouseY+mSize/2);
        break;
      }
    } 
    
    
    if(clear){
      points.clear();
      //sets back to default if cleared
      clear = false;
      erase = false;
    } else if(erase){
      dColor = #FFFFFF;
    }
    //adds new points to arraylist
    if(mousePressed && !colorWindowOpen && mouseY > 100+mSizeCnt + shapeOffset){
      
      points.add(new Point(mouseX, mouseY, mSize, s, dColor));
    }
  }
}  
