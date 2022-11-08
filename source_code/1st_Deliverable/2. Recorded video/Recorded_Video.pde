
import processing.video.*;

Movie movie; 

void setup() {
  size(1920, 1080);

  movie = new Movie(this, "00051.MTS"); 

  movie.loop();
}

void movieEvent(Movie movie) {
  movie.read();
}

void draw() {
  image(movie, 0, 0, 640, 360);
  float r = map(mouseX, 0, width, 0, 4);
  movie.speed(r); 
}
