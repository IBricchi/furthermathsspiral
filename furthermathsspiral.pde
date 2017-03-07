import peasy.*;

ArrayList<PVector> points = new ArrayList<PVector>();
float a = 0;
float c = 0;
float k = 1.01;
float ohu = 0;
boolean move = false;
boolean omove = false;

PeasyCam cam;

void setup(){
  //size(600, 600, P3D);
  fullScreen(P3D);
  colorMode(HSB); 
  cam = new PeasyCam(this, 1500);
}

void draw(){
  float x = 0;
  float y = 0;
  float z = 0;
  
  float k = 1.01;
  float r = 4;
  float c = 0;
  background(0);
  
  for( int i = 0; i < 750; i++){
    x += cos(radians(a) * c) * r * k;
    y += sin(radians(a) * c) * r * k;
    //z += x + y;
    z++;
    r = r * k;
    c++;
    points.add(new PVector(x,y,z));
  }
  
  a+=50/c;
  if(a > 360){
    a = 0;
  }
  if(a >= 180){
    //move = false;
    //omove = true;
  }
  if(a < 180){
    //omove = false;
    //move = true;
  }
  strokeWeight(4);
  noFill();
  float hu = ohu;
  
  beginShape();
  if(move){
    ohu += 5;
    if(ohu > 255){
      ohu = 0;
    } 
  }
  if(omove){
    ohu -= 5;
    if(ohu < 0){
      ohu = 255;
    } 
  }
  for(int i = 0; i < points.size(); i++){
    stroke(hu, 255, 255);
    vertex(points.get(i).x, points.get(i).y, points.get(i).z);
    
    hu += pow(k,c/100);
    if (hu > 255) {
      hu = 0;
    }
  }
  endShape();
  points.clear();
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      move = true;
    }else{
      move = false;
    }
    if(keyCode == DOWN){
      omove = true;
    }else{
      omove = false;
    }
  }
}

void keyReleased() {
  if(key == CODED){
    if(keyCode == UP){
      move = false;
    }else{
      move = false;
    }
    if(keyCode == DOWN){
      omove = false;
    }else{
      omove = false;
    }
  }
}