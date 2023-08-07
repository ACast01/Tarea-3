float sunX, sunY; // Posición del sol
float[] cloudX, cloudY, cloudSize, cloudSpeed; // Arrays para las nubes

void setup() {
  size(800, 600); // Tamaño de la ventana
  sunX = width / 2; // Posición inicial del sol en el centro horizontal
  sunY = height / 3; // Posición inicial del sol en la parte superior
  
  // Inicializar las nubes
  int numClouds = 5; // Número de nubes
  cloudX = new float[numClouds];
  cloudY = new float[numClouds];
  cloudSize = new float[numClouds];
  cloudSpeed = new float[numClouds];
  
  for (int i = 0; i < numClouds; i++) {
    cloudX[i] = random(-width, width); // Posición inicial aleatoria de la nube
    cloudY[i] = random(50, 200); // Altura aleatoria de la nube
    cloudSize[i] = random(40, 100); // Tamaño aleatorio de la nube
    cloudSpeed[i] = random(0.5, 2.5); // Velocidad aleatoria de la nube
  }
}

void draw() {
  drawSky(); // Dibuja el cielo con gradiente
  drawSun(); // Dibuja el sol que sigue al puntero del mouse
  drawMountains(); // Dibuja las montañas
  drawLake(); // Dibuja el lago
  drawTrees(); // Dibuja los árboles
  drawFlowers(); // Dibuja las flores
  drawClouds(); // Dibuja las nubes animadas
}

void drawSky() {
  background(135, 206, 235); // Color del cielo (celeste claro)
  for (int y = 0; y < height/2; y++) {
    stroke(135, 206, 235, map(y, 0, height/2, 150, 0)); // Crea un gradiente desde celeste claro a transparente
    line(0, y, width, y);
  }
}

void drawSun() {
  sunX = mouseX; // Actualiza la posición X del sol con la posición X del puntero del mouse
  sunY = mouseY; // Actualiza la posición Y del sol con la posición Y del puntero del mouse
  
  fill(255, 255, 0); // Color amarillo para el sol
  ellipse(sunX, sunY, 100, 100); // Sol que sigue al puntero del mouse
}

void drawMountains() {
  noStroke();
  fill(139, 69, 19); // Color marrón oscuro para las montañas
  triangle(0, 400, 200, 100, 400, 400); // Montaña izquierda
  triangle(300, 400, 500, 150, 700, 400); // Montaña derecha
}

void drawLake() {
  fill(0, 0, 139); // Color azul oscuro para el lago
  rect(0, 400, width, 200); // Lago en la parte inferior
}

void drawTrees() {
  for (int i = 100; i < width; i += 200) {
    drawTree(i, 400); // Árboles en el suelo cerca del lago
  }
}

void drawTree(float x, float y) {
  fill(139, 69, 19); // Color marrón para el tronco del árbol
  rect(x - 10, y, 20, -100); // Tronco del árbol
  
  fill(34, 139, 34); // Color verde para las hojas del árbol
  ellipse(x, y - 100, 120, 120); // Hojas del árbol
}

void drawFlowers() {
  for (int i = 50; i < width; i += 100) {
    drawFlower(i, 500); // Flores cerca del lago
  }
}

void drawFlower(float x, float y) {
  fill(255, 192, 203); // Color rosa claro para la flor
  ellipse(x, y, 30, 30); // Pétalos de la flor
  
  fill(255, 255, 0); // Color amarillo para el centro de la flor
  ellipse(x, y, 10, 10); // Centro de la flor
}

void drawClouds() {
  for (int i = 0; i < cloudX.length; i++) {
    drawCloud(cloudX[i], cloudY[i], cloudSize[i], cloudSpeed[i]); // Dibujar cada nube en el array
    cloudX[i] += cloudSpeed[i]; // Mover horizontalmente la nube en función de su velocidad
    
    // Reiniciar la posición de la nube si sale de la pantalla
    if (cloudX[i] > width + cloudSize[i]) {
      cloudX[i] = -cloudSize[i];
    }
  }
}

void drawCloud(float x, float y, float cloudSize, float speed) {
  noStroke();
  fill(255); // Color blanco para la nube
  ellipse(x, y, cloudSize, cloudSize / 1.5); // Círculo central
  ellipse(x - cloudSize / 3, y - cloudSize / 4, cloudSize, cloudSize / 1.5); // Círculo izquierdo
  ellipse(x + cloudSize / 3, y - cloudSize / 4, cloudSize, cloudSize / 1.5); // Círculo derecho
}
