//Victoria Di Lorenzo 95495/7
//comisión 1
//tp2
String estado = "pantalla1"; // Estado de la pantalla 
PImage panda1, panda2, panda3, panda4, panda5;
int yTexto2, yTexto3, xTexto4; 
int velTexto2, velTexto3, velTexto4;
PFont miFuente;
int contador4 = 0; // Contador para el tiempo en pantalla 4
boolean texto4Visible = false; 

void setup() {
  size(640, 480);
  frameRate(60); // Ajusta la velocidad de fotogramas a 60
  panda1 = loadImage("panda1.jpg");
  panda2 = loadImage("panda2.jpg");
  panda3 = loadImage("panda3.jpg");
  panda4 = loadImage("panda4.jpg");
  panda5 = loadImage("panda5.jpg");
  yTexto2 = 480;
  yTexto3 = -100; 
  xTexto4 = -100;
  
  velTexto2 = -1; // Reducir la velocidad del texto en pantalla 2
  velTexto3 = 1;  // pantalla 3
  velTexto4 = 1;  // pantalla 4
  
  miFuente = createFont("Hey Comic.ttf", 32);
  textFont(miFuente);
}

void draw() {
  if (estado.equals("pantalla1")) {
    image(panda1, 0, 0, 640, 480);
    // Dibujar contenido de la pantalla 1
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);
    
    // Botón de la pantalla inicial
    if (mouseX > 130 && mouseX < 230 && mouseY > 285 && mouseY < 335) {
      fill(255, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    stroke(255, 0, 0);
    rect(120, 285, 120, 50);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("Siguiente", 180, 310);
  } else if (estado.equals("pantalla2")) {
    image(panda2, 0, 0, 640, 480);
    fill(255);
    textSize(23);
    textAlign(CENTER, CENTER);
    
    yTexto2 += velTexto2;
    
    if (yTexto2 < -200) {
      estado = "pantalla3"; // Cambia a la pantalla 3 cuando el texto termina de subir en la pantalla 2
      yTexto2 = 480; // Restaura la posición inicial del texto al cambiar de pantalla
    }
    text("Es una cautivadora película de animación \n que sigue la historia de Po \n un panda que trabaja en un restaurante de fideos. \n Su vida cambia cuando se convierte en el \n legendario Guerrero Dragón ", width / 2, yTexto2);
  } else if (estado.equals("pantalla3")) {
    // Contenido de la pantalla 3
    image(panda3, 0, 0, 640, 480);
    // pantalla 3
    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    
    yTexto3 += velTexto3; // Mover el texto hacia abajo
    
    if (yTexto3 > height + 100) {
      estado = "pantalla4"; // Cambia a la pantalla 4 cuando el texto termina de bajar en la pantalla 3
      yTexto3 = -100; // Restaura la posición inicial del texto al cambiar de pantalla
    }
    text("A través de la enseñanza del maestro Shifu \n y con el apoyo de sus amigos, Po descubre el \n poder del trabajo duro, la perseverancia \n y la autoaceptación, superando sus propias dudas \n para convertirse en un verdadero héroe.", width / 2, yTexto3);
  } else if (estado.equals("pantalla4")) {
    // Contenido de la pantalla 4
    image(panda4, 0, 0, 640, 480);
    // pantalla 4
    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    
    if (!texto4Visible) {
      xTexto4 += velTexto4; // Mover el texto hacia la derecha
      if (xTexto4 > width / 2) { // Verificar si el texto está completamente visible
        texto4Visible = true; // El texto está completamente visible
      }
    } else {
      contador4++; // Incrementar el contador
      if (contador4 > 120) { // Esperar un rato 
        estado = "pantalla5"; // Cambiar a la pantalla 5
        xTexto4 = -100; // Restaura la posición inicial del texto al cambiar de pantalla
        contador4 = 0; // Reiniciar el contador
        texto4Visible = false; 
      }
    }
    text("La película fusiona hábilmente la comedia, \n la acción y la emotividad, ofreciendo \n un mensaje inspirador sobre \n el valor de ser uno mismo y la importancia \n del trabajo en equipo y la amistad.", xTexto4, height / 2);
  } else if (estado.equals("pantalla5")) {
    // Contenido de la pantalla 5
    image(panda5, 0, 0, 640, 480);
    
    // Texto 
    fill(255);
    textSize(25);
    textAlign(CENTER, CENTER);
    text("Y recuerda el ayer es historia \n el mañana es un misterio \n pero el hoy es un regalo \n por eso se llama presente \n Gracias ", width / 2, 200);
    
    // Botón para volver a la pantalla 1
    fill(255, 0, 0);
    stroke(255, 0, 0);
    rect(280, 285, 100, 50);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("Volver", 330, 310);
  }
}

void mousePressed() {
  if (mouseX > 120 && mouseX < 240 && mouseY > 285 && mouseY < 335 && estado.equals("pantalla1")) {
    estado = "pantalla2"; // Cambia a la pantalla 2 cuando se hace clic en el botón
  } else if (mouseX > 280 && mouseX < 380 && mouseY > 285 && mouseY < 335 && estado.equals("pantalla5")) {
    estado = "pantalla1"; // Cambia a la pantalla 1 cuando se hace clic en el botón de vuelta
  }
}
