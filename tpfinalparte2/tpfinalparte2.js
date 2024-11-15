//Victoria Di Lorenzo y Azul Ceballos
//Comisión 1
//link a video 
let juego;
let sonidoFondo;

function preload() {
  fondoInicio = new Fondo("data/imagen5.jpeg");
  fondoJuego = new Fondo("data/imagen.jpg");
  sonidoFondo = loadSound("data/fondo.mp3");
}

function setup() {
  createCanvas(640, 480);
  juego = new Juego(); 
}

function draw() {
  juego.mostrar();  
}

function keyPressed() {
  if (key === 'R' || key === 'r') {
    juego.iniciarJuego(); // Reinicia el juego cuando se presiona 'R'
  }
}
