import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioInput player;
AudioMetaData meta;
BeatDetect beat;
int  r = 6400;
float rad = 70;
int backC = 0;
int scalar = 11;
void setup()
{
  //size(displayWidth, displayHeight);
  fullScreen();
  //size(600, 400);
  minim = new Minim(this);
  //player = minim.loadFile("/Users/robinonsay/Music/iTunes/iTunes Media/"+
  //"Music/Unknown Artist/Unknown Album/DVBBS & Borgeous - TSUNAMI (Original Mix).mp3");
  //player = minim.loadFile("/Users/robinonsay/Music/song.mp3");
  player = minim.getLineIn();
  beat = new BeatDetect();
  //player.loop();
  background(-1);
  noCursor();
}
 
void draw()
{ 
  float red= random(200,255);
  float g = random(50,200);
  float b = random(50,100);
  //float t = map(mouseX, 0, width, 0, 1);
  
  beat.detect(player.mix);
  //fill(#1A1F18, 20);
  noStroke();
  int bsize = player.bufferSize();
  //translate(0, height/2);
  noFill();
  
  
  //else rad = 70;
  //ellipse(0, 0, 2*rad, 2*rad);
  int y = displayHeight/2;
  
  clear();
  //noFill();
  float s = (float)scalar/((float)scalar);
  scalar*=s;
  if (beat.isOnset()){
    //clear();

   red= abs(r-255);
    g = abs(g-255);
    b = abs(b-255);
    r*=2;
    scalar*=s;
  }else if(beat.isHat()){
    red= random(50,100);
    g = random(50,100);
    b = random(200,255);
  }
  r/=2;
  scalar/=s;
  //stroke(r,g,b);
  fill(255-red,255-g,255-b);
    for(int i=0; i<bsize-1;i+=15){
       float y2 = (r + player.left.get(i)*100);
        
        ellipse(displayWidth/2,y,y2*scalar*2,y2*scalar*2);

      }
      beginShape();
    stroke(r,g,b);
    beginShape();
    vertex(0,y);
    
    fill(red,g,b);
    for (int i = 0; i < bsize - 1; i+=15)
    {
      //clear();
      
      float x = map(i,0,bsize,0,displayWidth);
      float y2 = (r + player.left.get(i)*100);

      y2 *= (i%2 == 0)?scalar/4:-scalar/4;
      
      
      
      ellipse(displayWidth/2,y,y2*scalar/2,y2*scalar/2);
      curveVertex(x,y);
      curveVertex(x+10,y2*8+y);

       pushStyle();
       stroke(-1);
       strokeWeight(2);
       popStyle();
    }
    
    vertex(displayWidth,y);
    endShape();
    
  //noFill();
  //beginShape();
  //noFill();
  //stroke(-1, 50);
  //for (int i = 0; i < bsize; i+=30)
  //{
  //  float x2 = (r + player.left.get(i)*100)*cos(i*2*PI/bsize);
  //  float y2 = (r + player.left.get(i)*100)*sin(i*2*PI/bsize);
  //  vertex(x2, y2);
  //  pushStyle();
  //  stroke(-1);
  //  strokeWeight(2);
  //  point(x2, y2);
  //  popStyle();
  //}
  //endShape();
   //if (flag) showMeta();
}
 
 

 

 
//
//boolean sketchFullScreen() {
//  return true;
//}
 
void keyPressed() {
 if(key==' ')exit();
 if(key=='s')saveFrame("###.jpeg");
}