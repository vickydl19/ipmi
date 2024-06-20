//victoria Di Lorenzo
//legajo 95495/7
//comision 1
//https://youtu.be/HNF65QvrGbA?si=UfMT7REgnL8OPNaa
//quiero aclarar que el video va a destiempo porque lo hice por separado
//y cuando los juntos queda asi
boolean alternar = false; // Variable de estado para alternar colores
boolean escala = false; // Variable de estado para habilitar el escalado
PImage ilusion;
int espaciado = 100; // Espacio entre los centros de los conjuntos de círculos
int numCirculos = 10; // Número de círculos concéntricos en cada conjunto
int diametroMaximo = 90; // Diámetro máximo del círculo más grande
int inicioX; // Inicia en la mitad derecha de la ventana
int anchoFondo = 400; // Ancho del área donde se dibujan los círculos de fondo (mitad derecha)
int altoFondo = 400; // Alto del área donde se dibujan los círculos de fondo (igual a la altura de la ventana)
float factorEscala = 1.0; // Factor de escala para agrandar/achicar los círculos

void setup() {
  size(800, 400); 
   background(255);
  noStroke(); 
  ilusion = loadImage("ilusion.jpg"); 
  inicioX = width / 2; 
}

void draw() {
  image(ilusion, 0, 0, 400, 400);

  // Ajustar el factor de escala basado en la posición del mouse si está habilitado
  if (escala) {
    factorEscala = map(mouseX, 0, width, 0.5, 2.0);
  }

  // Dibujar círculos concéntricos en el fondo
  for (int x = 150 + anchoFondo / 2; x < inicioX + anchoFondo; x += espaciado) {
    for (int y = -55; y < altoFondo; y += espaciado) {
      for (int i = 0; i < numCirculos; i++) {
        int diametro = int((diametroMaximo - i * (diametroMaximo / numCirculos)) * factorEscala);
        dibujarCirculo(x + espaciado / 2, y + espaciado / 2, diametro, colorAlterno(i)); // Llamada a la función para dibujar el círculo
      }
    }
  }

  // Dibujar círculos concéntricos en los conjuntos principales
  for (int x = inicioX; x < inicioX + anchoFondo; x += espaciado) {
    for (int y = -10; y < altoFondo; y += espaciado) {
      for (int i = 0; i < numCirculos; i++) {
        int diametro = int((diametroMaximo - i * (diametroMaximo / numCirculos)) * factorEscala);
        dibujarCirculo(x + espaciado / 2, y + espaciado / 2, diametro, colorAlterno(i)); // Llamada a la función para dibujar el círculo
      }
    }
  }
}

void keyPressed() {
  if (key == 'e' || key == 'E') {
    alternar = !alternar; // Alternar el estado
  }
  if (key == 'r' || key == 'R') {
    reiniciar(); // Reiniciar el programa
  }
}

// Habilitar el escalado cuando se presiona el mouse
void mousePressed() {
  escala = true;
}

// Función propia para dibujar un círculo con parámetros (no retorna un valor)
void dibujarCirculo(int x, int y, int diametro, int col) {
  fill(col);
  ellipse(x, y, diametro, diametro);
}

// Función propia para determinar el color alternado (retorna un valor)
int colorAlterno(int iteracion) {
  if (alternar) {
    if (iteracion % 2 == 0) {
      return color(255); // Blanco si es par
    } else {
      return color(0); // Negro si es impar
    }
  } else {
    if (iteracion % 2 == 0) {
      return color(0); // Negro si es par
    } else {
      return color(255); // Blanco si es impar
    }
  }
}

// Función para reiniciar el programa (volviendo variables a estado original)
void reiniciar() {
  alternar = false; // Restablecer el estado alterno
  escala = false; // Deshabilitar el escalado
  factorEscala = 1.0; // Restablecer el factor de escala
 
}
