PImage panda;
void setup(){
  size(800,400);
  background(205,235,200);
 panda=loadImage("panda 2.jpg");
  
}

void draw(){
image(panda, 0, 0);
  noStroke();
  fill(255);
  circle(600,275,175); //cuerpo
  fill(40);
  rect(645,290,100,70,40); //pata izquierda
  rect(465,290,100,70,40); //pata izquierda
  fill(0);
  ellipse(540,280,70,180); //brazo derecho
  ellipse(670,280,70,180); //brazo izquierdo
  fill(0);
  circle(665,110,60); //oreja izquierda
  circle(540,110,60); //oreja derecho
  fill(255);
  circle(605,160,135); //cabeza
  fill(0);
  circle(639,150,50); //ojo izquierdo
  circle(570,150,50); //ojo derecho
  fill(255);
  circle(630,150,25); //ojo izquierdo
  circle(580,150,25); //ojo derecho
  fill(0);
  circle(630,150,15); //ojo izquierdo
  circle(580,150,15); //ojo derecho
  triangle(615,170,595,170,605,185); //naríz
  stroke(0);
  line(605,185,605,198); //boca
  line(605,198,610,200);
  

}
