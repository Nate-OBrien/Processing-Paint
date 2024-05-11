int mSize = 25;
int mChoice = 0;
color dColor;
ChildApplet colorSwap;
Cursors c;
drawing d;

public boolean colorWindowOpen = false;

void setup(){
  size(1000,1000);
  
  c = new Cursors(mSize, dColor);
 
}

void draw(){
  frameRate(60);
  noStroke(); 
  background(255);
  screenTop();
  c.drawPoints();
  c.cursorSet(mChoice);
}


void mouseWheel(MouseEvent event) {
  //gets which way mouse moves and changes brush size
  float e = event.getCount();
  c.update(e);
}

void screenTop(){
  //sets menu top
  fill(200);
  rectMode(CENTER);
  rect(width/2, height/20, width,height/10);
  fill(255);
  stroke(0);
  strokeWeight(5);
  rect(100,50,50,50);
  circle(200,50,50);
  triangle(275,75,300,25,325,75);
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("ERASE", 925,40);
  text("CLEAR", 925,80);
  fill(dColor);
  rect(400,50,50,50);
  
  fill(255,0);
  if(!colorWindowOpen){
    //highlight for items
    if((mouseX > 60 && mouseX < 140) && (mouseY > 10 && mouseY < 90)){
      rect(100,50,75,75);
    } else if((mouseX > 160 && mouseX < 240) && (mouseY > 10 && mouseY < 90)){
      rect(200,50,75,75);
    } else if((mouseX > 260 && mouseX < 340) && (mouseY > 10 && mouseY < 90)){
      rect(300,50,75,75);
    } else if((mouseX > 875 && mouseX<975) && (mouseY > 10 && mouseY<52.5)){
      rect(925,30,100,40);
    } else if((mouseX > 875 && mouseX<975) && (mouseY > 60 && mouseY<95)){
      rect(925,70,100,40);
    } else if((mouseX > 360 && mouseX<440) && (mouseY > 10 && mouseY<90)){
      rect(400,50,75,75);
    }
  }
  
  strokeWeight(1);
  noStroke();
}

void mousePressed(){
  if(!colorWindowOpen){
    //actually changes info
    if(((mouseX > 60 && mouseX < 140) && (mouseY > 10 && mouseY < 90)) && mousePressed){
      mChoice = 1;
    } else if(((mouseX > 160 && mouseX < 240) && (mouseY > 10 && mouseY < 90)) && mousePressed){
      mChoice = 0;
    } else if(((mouseX > 260 && mouseX < 340) && (mouseY > 10 && mouseY < 90)) && mousePressed){
        mChoice = 2;
    } else if(((mouseX > 360 && mouseX<440) && (mouseY > 10 && mouseY<90)) && mousePressed){
      openColorSwap();
    //sets to opposite to get toggle to work
    } else if(((mouseX > 875 && mouseX<975) && (mouseY > 10 && mouseY<52.5))){
        c.erase = !c.erase;
      //sets to true to call the clear function
    }else if(((mouseX > 875 && mouseX<975) && (mouseY > 60 && mouseY<95))){
      c.clear = true;
    }
  }
}

//not needed rn, maybe if a udno/redo is added??
void mouseReleased(){

}

public void updateColor(color newColor){
    dColor = newColor;
}

void openColorSwap(){
  colorSwap = new ChildApplet();
  String[] args = {"TwoWindows"};
  PApplet.runSketch(args, colorSwap);
  colorWindowOpen = true;
}

class ChildApplet extends PApplet{
  public void settings() {
    size(525, 525);
  }

  public void setup() {
    background(200);
    surface.setAlwaysOnTop(true);
    
    d = new drawing();
  }

  public void draw() {
    background(255);
    
    textAlign(CENTER);
    textSize(35);
    fill(0);
    noStroke();
    text("COLOR PICKER",width/2,50);
    rectMode(CENTER);
    //adds preset colors
    fill(#0000FF);
    rect(75,100,50,50);
    fill(#FF0000);
    rect(150,100,50,50);
    fill(#00FF00);
    rect(225,100,50,50);
    fill(#FFA500);
    rect(300,100,50,50);
    fill(#FFFF00);
    rect(375,100,50,50);
    fill(#A020F0);
    rect(450,100,50,50);
  }
  
  
  
  public void mousePressed(){
    //prolly unoptimized way to change color
    if((mouseX > 50 && mouseX < 100) && (mouseY > 50 && mouseY < 150)){
      dColor = #0000FF;
      c.dColor = #0000FF;
    } else if((mouseX > 125 && mouseX < 175) && (mouseY > 50 && mouseY < 150)){
      dColor = #FF0000;
      c.dColor = #FF0000;
    } else if((mouseX > 200 && mouseX < 250) && (mouseY > 50 && mouseY < 150)){
      dColor = #00FF00;
      c.dColor = #00FF00;
    } else if((mouseX > 275 && mouseX < 325) && (mouseY > 50 && mouseY < 150)){
      dColor = #FFA500;
      c.dColor = #FFA500;
    } else if((mouseX > 350 && mouseX < 400) && (mouseY > 50 && mouseY < 150)){
      dColor = #FFFF00;
      c.dColor = #FFFF00;
    } else if((mouseX > 425 && mouseX < 475) && (mouseY > 50 && mouseY < 150)){
      dColor = #A020F0;
      c.dColor = #A020F0;
    }
   
  }
  
  public void exit(){
    //hides window
    surface.setVisible(false);
    noLoop();
    //reenables main window function
    colorWindowOpen = false;
  }
}
