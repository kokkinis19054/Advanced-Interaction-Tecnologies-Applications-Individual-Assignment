import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;
MultiMarker nya;
PImage img;

void setup() 
{
  size(640,480,P3D);
  colorMode(RGB, 100);
  println(MultiMarker.VERSION);
  cam=new Capture(this,640,480);
  nya=new MultiMarker(this,width,height,"data/camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker("data/patt.hiro",80);
  img=loadImage("skeleton_3.jpg");
  cam.start();
}

void draw()
{
  if (cam.available() !=true) 
  {
      return;
  }
  cam.read();
  nya.detect(cam);
  background(0);
  nya.drawBackground(cam);
  
  if((!nya.isExist(0)))
  {
    return;
  }
  
  nya.beginTransform(0);
  image(img,0,0,width,height);
  nya.endTransform();
}
