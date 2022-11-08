import processing.video.*;


import qrcodeprocessing.*;

Decoder decoder;
PImage img; 

void setup() 
{
  size(248, 248);
  decoder = new Decoder(this);
  img = loadImage("dpsd19054.png");
  decoder.decodeImage(img);
}

void draw() 
{
  background(0);
  image(img, 0, 0, width, height);
}

void decoderEvent(Decoder decoder) 
{
  String statusMsg = decoder.getDecodedString(); 
  println(statusMsg);
}
