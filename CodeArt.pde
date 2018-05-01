void setup(){
  size(1000, 1000);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 0);
  noFill();
}

void draw(){
  translate(width / 2, height / 2);
  if(mousePressed){
    PVector mouse = new PVector(mouseX - width / 2, mouseY - height / 2);
    PVector pmouse = new PVector(pmouseX - width / 2, pmouseY - height / 2);
    float circle = map(constrain(PVector.dist(pmouse, mouse), 0, 10), 0, 10, random(40, 70), 5);
    float alpha = map(constrain(PVector.dist(pmouse, mouse), 0, 50), 0, 10, 10, 70);
    stroke((frameCount * 0.5) % 360, 100, 100, alpha);
    float ang = atan2(mouse.y, mouse.x);
    if(ang < 0){
      ang = TWO_PI + ang;
    }
    int pos = int(ang / (TWO_PI / 9.0));
    float diff = pos % 2 == 0? ang - pos * TWO_PI / 9.0: (pos + 1) * TWO_PI - ang;
    for(int i = 0; i < 8; i++){
      float mag = mouse.mag();
      if(i % 2 == 0){
        ellipse(mag * cos(diff + i * TWO_PI / 8.0),  mag * sin(diff + i * TWO_PI / 8.0), circle, circle);
      } else {
        ellipse(mag * cos(-diff + (i + 1) * TWO_PI / 8.0),  mag * sin(-diff + (i + 1) * TWO_PI / 8.0), circle, circle);      
      }
    }
  }
}