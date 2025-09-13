
import processing.sound.*;
SoundFile bgmusic, bsound, click;
boolean img=false, img3=false, img4=false, img5=false, verde = false, naranja = false, rojo = false;;
int tiempoEspera=0, start, celdas = 15, tamaño=72, counter=0, mov=5, pointsPos=0, time, lastTime=0, alea, pantalla=0, intentoPos=0, round = 1, total = 0, dificult = 1, a = 5;
PImage[][] mimg = new PImage[celdas][celdas];
PImage[] imagenes = new PImage [5];
ArrayList<PImage> images = new ArrayList<PImage>();
PImage Chocolat, base, img2,  r1, r2, r3, r4, r5, Caramelo, Oso, Lolipop, barra, fondoCandy, galleta, coo, back, ajustes, volumen, volumenX, marco, galletaHappy, fondo, inicio, btn1, btn2, men, personaje, nivel, normal, ele;
PFont font;
int[][] points = new int[10][10];
int[][] positions = new int[5][5];
int[] intento = new int[10];
String[] jugadores = {"Jugador 1", "Jugador 2", "Jugador 3", "Jugador 4"};
int jugadorActual = 0, numjug, may=0, tama=0, tama2=0, tama3=0, tama4=0, candy = 0, lollipop = 0, gummy = 0, col=1, pt;
boolean pause=true, btnact = false, igclick = true, cancel=false, MostrarAnuncio = false, juegoTerminado = false, menu = false, music = true;
float angle=0;

void setup() {
  fullScreen();
  start = millis();
  //Cargar sonidos y música de fondo
  bgmusic = new SoundFile(this, "bgsoundW.wav");
  bsound = new SoundFile(this, "random2.wav");
  click = new SoundFile(this, "click.wav");
  
  bgmusic.loop();

  // Carga la imagen de fondo y las imágenes de dulces
  r1 = loadImage("round1.png");
  r2 = loadImage("round2.png");
  r3 = loadImage("round3.png");
  r4 = loadImage("round4.png");
  r5 = loadImage("round5.png");
  fondo = loadImage("bgJuego.jpeg");
  inicio = loadImage("fondo2.png");
  btn1= loadImage("bt0.png");
  btn2= loadImage("bt2.png");
  men= loadImage("menu.png");
  Chocolat = loadImage("chocolate-bar.png");
  Caramelo = loadImage("sweet2.png");
  Oso = loadImage("gummy-bear (1).png");
  Lolipop = loadImage("lollipop.png");
  fondoCandy = loadImage("fondocandy.jpg");
  galleta = loadImage("galleta.png");
  back = loadImage("devolver.png");
  ajustes = loadImage("ajustes.png");
  volumen = loadImage("volumen.png");
  volumenX = loadImage("sinsonido.png");
  marco = loadImage("marco.png");
  galletaHappy = loadImage("galletahappy.png");
  personaje = loadImage("fondopersonaje.png");
  nivel = loadImage("niveles.png");
  normal = loadImage("norm.png");
  ele = loadImage("osos.png");
  barra = loadImage("barra.png");
  coo = loadImage("coo.png");

  // Añadimos las imágenes de dulces al ArrayList
 imagenes[0] = Chocolat;
 imagenes[1] = Caramelo;
 imagenes[2] = Oso;
 imagenes[3] = Lolipop;
 imagenes[4] = coo;

  // se carga la fuente que se usará para los textos
  font = loadFont("VirtualDJ-35.vlw");

  
  matriz(); //Subrutina para llenar la matriz
  
  llenarI(); //Subrutina para llenar el vector donde guardaremos la cantidad de intentos
  
}

//Subrutina para generar el parpadeo de las palabras
void parpadeo(){
  
  int intervalo = 1;
  int lastTime2 = 0;
  boolean blinking = false;
  int tiempoA = millis(), i=pointsPos;
  if (tiempoA - lastTime2 > intervalo) {
    blinking = !blinking;
    lastTime2 = tiempoA;
  }
  if (blinking) {
    fill(255);
  } else {
    fill(0);
  }
  textSize(25);
  text("Jugador "+(i+1), width*0.067, height*(0.135));
}

//Subrutina para reiniciar ciertos contadores y variables cada vez que se cambia de intento y/o jugador
void reiniciar() {
  if (dificult == 1){
     time = 15;
   } else if ( dificult == 2){
     time = 10;
   } else if (dificult == 3){
    time = 5; 
   }
  puntaje();
  mov=5;
  counter=0;
  matriz();
  drawmatriz();
}

void matriz() {
  // Llena la matriz con imágenes de dulces aleatorios
  for (int i = 0; i < celdas; i++) {
    for (int j = 0; j < celdas; j++) {
      if (dificult == 1){
        alea = int(random(3));
      }else if (dificult == 2){
        alea = int(random(4));
      } else if (dificult == 3){
        alea = int(random(5)); 
      }
      mimg[i][j] = imagenes[alea];
    }
  }
}

void llenarI(){
  for(int i=0; i< 4; i++){
    intento[i]=3;
  }
}

void drawmatriz() {
  // Calcula el punto de inicio para centrar la matriz de dulces
  if (dificult == 1){
   celdas = 8; 
   tamaño = 600 / celdas;
  } else if (dificult == 2){
    celdas = 10;
    tamaño = 640 / celdas;
  } else if (dificult == 3){
   celdas = 12; 
   tamaño = 690 / celdas;
  }
  
  float offsetX = (width - (celdas * tamaño)) / 2;
  float offsetY = (height - (celdas * tamaño)) / 2;

  for (int i = 0; i < celdas; i++) {
    for (int j = 0; j < celdas; j++) {
      // Fondo translúcido para cada celda
      strokeWeight(1);
      fill(150, 150, 200, 100);  // Color gris azulado con transparencia
      rect(offsetX + j * tamaño, offsetY + i * tamaño, tamaño, tamaño, 20);

      // Dibuja cada dulce en el centro de su celda, un poco más pequeño que el tamaño de la celda
      if (mimg[i][j] != null) {
        float imgSize = tamaño * 0.8;  // Tamaño del dulce ajustado
        float xPos = offsetX + j * tamaño + (tamaño - imgSize) / 2;
        float yPos = offsetY + i * tamaño + (tamaño - imgSize) / 2;
        image(mimg[i][j], xPos, yPos, imgSize, imgSize);
      }
    }
  }
}

// Nueva función para obtener el índice de la imagen en `images` para comparar
int getImageIndex(PImage img) {
  for (int i = 0; i < imagenes.length ; i++) {
    if (imagenes[i] == img) {
      return i;
    }
  }
  return -1;  // Retorna -1 si no se encuentra
}

void explotar(int i, int j, PImage selectedImage) {
    int targetIndex = getImageIndex(selectedImage);  // Índice de la imagen seleccionada
    boolean[][] Recorrido = new boolean[celdas][celdas]; // Matriz para marcar posiciones ya recorridas
    Recorrido[i][j] = true; // Marca la posición inicial como visitada

    boolean exploto = true; // Controla si hubo exploto una burbuja en el proceso

    while (exploto) {
        exploto = false; // Reinicia la variable para esta iteración

        // Recorre toda la matriz
        for (int x = 0; x < celdas; x++) {
            for (int y = 0; y < celdas; y++) {
                if (Recorrido[x][y]) {
                    // Si la posición actual tiene la imagen seleccionada, la eliminamos
                    if (mimg[x][y] != null && getImageIndex(mimg[x][y]) == targetIndex) {
                        mimg[x][y] = null;  // Elimina el dulce actual
                        exploto = true; // Indica que hubo una explocion

                        // Verifica las posiciones adyacentes
                        if (x > 0 && mimg[x - 1][y] != null && getImageIndex(mimg[x - 1][y]) == targetIndex && !Recorrido[x - 1][y]) {
                            Recorrido[x - 1][y] = true; // Marca como visitada
                            counterR(); // Llama a la función de contador
                        }
                        if (x < celdas - 1 && mimg[x + 1][y] != null && getImageIndex(mimg[x + 1][y]) == targetIndex && !Recorrido[x + 1][y]) {
                            Recorrido[x + 1][y] = true; // Marca como visitada
                            counterR(); // Llama a la función de contador
                        }
                        if (y > 0 && mimg[x][y - 1] != null && getImageIndex(mimg[x][y - 1]) == targetIndex && !Recorrido[x][y - 1]) {
                            Recorrido[x][y - 1] = true; // Marca como visitada
                            counterR(); // Llama a la función de contador
                        }
                        if (y < celdas - 1 && mimg[x][y + 1] != null && getImageIndex(mimg[x][y + 1]) == targetIndex && !Recorrido[x][y + 1]) {
                            Recorrido[x][y + 1] = true; // Marca como visitada
                            counterR(); // Llama a la función de contador
                        }
                    }
                }
            }
        }
    }
}

//Subrutina para llevar el conteo de puntos por cada elemento epxlotado
void counterR() {
  counter=counter+10;
}

//Subrutinas para guardar los puntajes de cada jugador en una matriz

void puntaje() {
    // Actualiza los puntos y llama a la función para manejar intentos y ordenar posiciones
    points[pointsPos][intentoPos] = counter;
    sumarPuntos();
    manejarIntentosYOrdenar();
}

void sumarPuntos() {
    // Suma los puntos de los primeros tres índices
    for (int i = 0; i < 3; i++) {
        points[pointsPos][3] += points[pointsPos][i];
    }
    positions[pointsPos][1] = points[pointsPos][3];
    positions[pointsPos][0] = pointsPos + 1;
}

void manejarIntentosYOrdenar() {
    intento[intentoPos] -= 1;

    if (intento[intentoPos] == 0) {
        pause = true;
        intentoPos += 1;
        pointsPos += 1;

        if (intentoPos > 3) {
            llenarI();
        }
    }

    if (pointsPos == numjug) {
        total += 1;
        pointsPos=0;
        intentoPos = 0;
        pause = true;
        llenarI();
    }
    if (total == round){
       ordenarPosiciones();
       pointsPos=0;
       intentoPos = 0;
       pause = true;
       llenarI();
       pantalla = 3;
    }
}

void ordenarPosiciones() {
    int col = 1; 
    for (int i = 0; i < numjug; i++) {
        for (int j = i + 1; j < numjug; j++) { 
            if (positions[i][col] < positions[j][col]) {
                int[] temp = positions[i];
                positions[i] = positions[j];
                positions[j] = temp;
            }
        }
    }
}

//Reinicio completo del juego cada vez que se acaba una partida
void ReiniciarJuego(){
   intentoPos=0;
   if (dificult == 1){
     time = 15;
   } else if ( dificult == 2){
     time = 10;
   } else if (dificult == 3){
    time = 5; 
   }
   
   img = false;
   img3 = false;
   img4 = false;
   img5 = false;
   verde = false;
   naranja = false;
   rojo = false;
   
   mov=5;
   counter = 0;
   round = 1;
   pointsPos = 0;
   llenarI();
   ReiniciarMatriz();
   ReiniciarPositions();
   matriz();
   total= 0;
   
}
void ReiniciarMatriz(){
  for(int i=0; i<4; i++){
     points[i][3] = 0;
  }
}
void ReiniciarPositions(){
  for (int j = 0; j<4; j++){
      for (int h = 0; h<3; h++){ 
       positions[j][h] = 0; 
      }
    }
}
