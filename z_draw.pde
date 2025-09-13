void draw(){
  bgmusic.amp(0.15);
  if(pantalla==0){
    image(inicio,0,0,width, height);
    float botonAncho = 340;
    float botonAlto = 150;
    float botonX = (width - 345) / 2;
    float botonInicioY = height * 0.39; // Posición vertical del primer botón (Inicio)
    float botonGuiaY = height * 0.53; // Posición vertical del segundo botón (Guía)
    float botonSalirY = height * 0.66; 
    if (menu) {
      image(volumen, width*0.95,80, 60, 60); 
      if (cancel){
       image(inicio, 0, 0, width, height);
       image(volumenX, width*0.95,80,60,60); 
      }
    }
    
    image(ajustes, width*0.95, 10, 60, 60);// botón de ajustes
    textSize(35);
    textFont(font);
    
    //Botón Inicio
    btn1.resize(width, height);
    image(btn1, botonX, botonInicioY, botonAncho, botonAlto); 
    if ( (mouseX>=width*0.393 && mouseX<=(width*0.393+260) && mouseY>=height*0.44 && mouseY<=(height*0.44+70)) ) {
      fill(155);
    } else {
      fill(255);
    }
    text("INICIO", width*0.456, height*0.48);
    
    // Botón de Guía
    image(btn1, botonX, botonGuiaY, botonAncho, botonAlto); 
    if ( (mouseX>=width*0.395 && mouseX<=(width*0.395+300) && mouseY>=height*0.565 && mouseY<=(height*0.565+90)) ) {
      fill(155);
    } else {
      fill(255);
    }
    text("Guía", width*0.457, height*0.625);
    
    // Botón de Salir
    image(btn1, botonX, botonSalirY, botonAncho, botonAlto);  
    if ( (mouseX>=width*0.469 && mouseX<=(width*0.469+200) && mouseY>=height*0.695 && mouseY<=(height*0.695+90)) ) {
      fill(155);
    } else {
      fill(255);
    }
    text("Salir", width*0.452, height*0.75);
    //rect(width*0.395, height*0.695, 400, 90); //Salir
    
  }else if (pantalla==1){
    float botonAncho = 220;  // Ancho del botón
    float botonAlto = 120;  //  Alto del botón
    float botoX = width * 0.75; //  Posición horizontal del primer botón (Inicio)
    float botoMenuY = height * 0.86; // Posición vertical del primer botón (Menú)
    float botoInicioY = height * 0.175; // Posición vertical del primer botón (Inicio)
    float botonAlto1 = 100;  //  Alto del botón
    float botoX1 = width * 0.05; //  Posición horizontal 
    float botoInicioY1 = height * 0.076; //Posición vertical
    
    image(fondo, 0, 0, width, height);  // Dibuja el fondo
    
    stroke(255);
    strokeWeight(5);
    fill(254, 121, 152);
    
    image(btn2, botoX1, botoInicioY1, botonAncho, botonAlto1); //Señal
    image(btn2, botoX, botoInicioY, botonAncho, botonAlto);    // botón Inicio
    image(btn2, botoX, botoMenuY, botonAncho, botonAlto);    //botón Menú
    
    rect(width*0.75, height*0.4, 260, 66, 20); //Puntos
    rect(width*0.75, height*0.5, 300, 66, 20); //Movimientos
    rect(width*0.4, height*0.03, 300, 66, 20); //Tiempo
    fill(255);
    textFont(font);
    
    int nume = 0;// Cuadro donde irá la información de los jugadores
    for (int h = 0; h<numjug; h++){
      stroke(255);
      strokeWeight(5);
      fill(254, 121, 152);
      rect(width*0.05, height*0.21 + nume, 280, 90, 15); 
      nume += 93;
    }
    
    for (int i=0; i<numjug; i++) {
      fill (255, 255, 255);
      textSize(13);
      text("Intentos: "+intento[i]+" /3", width*0.06, height*(0.28+(0.1*i)));
      textSize(23);
      text("Jugador "+(i+1)+": "+ points[i][3], width*0.06, height*(0.25+(0.1*i)));
    }
    
    textSize(25);
    text("Tiempo: "+time+" seg", width*0.415, height*0.08);
    text("Puntos: "+counter, width*0.76+(width*0.005), (height*0.4)+(height*0.05));
    text("Movimientos: "+mov, width*0.76+(width*0.005), (height*0.5)+(height*0.05));
    //text("Reiniciar", width*0.737+(width*0.025), (height*0.6)+(height*0.05));
    text("Menú", width*0.77+(width*0.025), (height*0.88)+(height*0.05));
    if (pause) {
      text("Iniciar", width*0.765+(width*0.025), (height*0.2)+(height*0.044));
    } else {
      text("Pausar", width*0.757+(width*0.025), (height*0.2)+(height*0.044));
    }
    
    if (!pause && millis() - lastTime >= 1000) {
      time--;
      lastTime = millis();
      if (time<0) {
        time = 15;
        reiniciar();
      }
      if(!pause){
        parpadeo();
      }
    }
    drawmatriz();  //Matriz de dulces
    
    } else if(pantalla==2){
      fill(255, 184, 228);
      noStroke();
      rect(width * 0.15, height * 0.15, width * 0.7, height * 0.7, 20); 
      image(marco, width*0.15,height*0.15,width*0.7,height*0.7); //Marco
      fill(255, 143, 183);
      
      rect(width*0.25, height*0.3, (280 + tama), (190 + tama), 20);
      image(galleta, width*0.301, height*0.32, (135 + tama), (135+tama)); //Galleta 1 jugador
      fill(0);
      textSize(25);
      text("1 Jugador", width*0.288 + tama, height*0.5 + tama);
      
      fill(255, 143, 183);
      rect(width*0.55, height*0.3, (280 + tama2), (190 + tama2), 20);
      image(galleta, width*0.562, height*0.32,(135+ tama3), (135+ tama3)); //Galleta
      image(galleta, width*0.652, height*0.32, (135+ tama3),(135+ tama3)); //Galleta
      fill(0);
      textSize(25);
      text("2 Jugadores", width*0.569 + tama2, height*0.5 + tama2);
      
      fill(255, 143, 183);
      rect(width*0.25, height*0.52, (280 + tama2), (190 + tama3), 20);
      image(galleta, width*0.256, height*0.515, (135+ tama3), (135+ tama3)); //Galelta
      image(galleta, width*0.356, height*0.515, (135+ tama3), (135+ tama3)); //Galleta
      image(galleta, width*0.302, height*0.56, (135+ tama3), (135+ tama3));  //Galleta
      fill(0); 
      textSize(25);
      text("3 Jugadores", width*0.265 +tama3, height*0.725 + tama3);
      
      fill(255, 143, 183);
      rect(width*0.55, height*0.52,(280 + tama2), (190 + tama4), 20);
      image(galleta, width*0.65, height*0.509, (135 + tama4), (135 + tama4));
      image(galleta, width*0.57, height*0.509, (135 + tama4),(135 + tama4));
      image(galleta, width*0.55, height*0.565, (135 + tama4),(135 + tama4));
      image(galleta, width*0.63, height*0.565, (135 + tama4), (135 + tama4));
      fill(0);
      textSize(25);
      text("4 Jugadores", width*0.569 + tama4, height*0.725 + tama4);
      
      image(back, width * 0.78,height * 0.777, 60, 60);//Devolver  
      
    }else if (pantalla == 3){
      image(fondoCandy, 0, 0, width, height);
    
      image(back, width * 0.9, height * 0.88, 90, 90); // Botón de devolución
      fill(255, 255, 255); //bordes morados
      rect(width * 0.24, height *0.245, (700 + tama2), (400 + tama3), 20);
      fill(255, 143, 183);// rosado 
      rect(width * 0.24, height * 0.245, (700 + tama2), (400 + tama3), 20);
      fill(0);
      textSize(45);
      text("¡Fin del juego!", width * 0.0677 + ((700 + tama2) )/ 2, (height * 0.27)+50);
      fill(255, 255, 255);

      float textX = width * 0.3 + 20; 
      float textY = height * 0.33 + 50;
      float lineHeight = 50;
      textSize(32);
      text("GANADOR: JUGADOR " + positions[0][0], textX, textY);
      textY += 2 * lineHeight;

      for (int i = 0; i < numjug; i++) {
        textSize(32 );
        text("JUGADOR " + positions[i][0] + ": " + positions[i][1] + " puntos", textX,textY + (i - 1) * lineHeight);
      }
    } else if (pantalla==4){
      float ancho = 900; //tamaño pantalla ancho
      float alto = 600; //tamaño pantalla alto
      float xpos = (width - ancho)/2;
      float ypos = (height - alto) /2;
      float xpos2 = width * 0.52; //posicion horizontal
      float ypos1 = height * 0.71; //posicion vertical
      float xpos1 = width * 0.28; //posicion horizontal
      float anboton = 270;
      float alboton = 120;
      
      image(men, xpos, ypos, ancho, alto);
      image(btn1, xpos2, ypos1, anboton, alboton); // botón salir
      image(btn1, xpos1, ypos1, anboton, alboton); // botón "manual de usuarios"
      
      textSize(18);
      fill(0);
      text("MANUAL DE USUARIO", width*0.292, height*0.776); // posición vertical 
      text("SALIR", width*0.597, height*0.776); // posición vertical 
      
    } else if (pantalla == 5){
       image(nivel, 0,0, width, height);
       image(back, width * 0.01, height * 0.01, 90, 90);
       image(ele, width*0.2, height*0.28, width*0.22, height*0.27);
       image(normal, width*0.31, height*0.28, width*0.22, height*0.27);
       image(normal, width*0.42, height*0.28, width*0.22, height*0.27);
       image(normal, width*0.53, height*0.28, width*0.22, height*0.27);
       image(normal, width*0.64, height*0.28, width*0.22, height*0.27);
       
       image(barra, width*0.23, height*0.52, width*0.495, height*0.45);
       fill(159, 255, 81);// verde
       rect(width*0.255, height*0.724, width*0.145, height* 0.04);
       fill(255, 180, 81); // Naranja
       rect(width*0.405, height*0.724, width*0.145, height* 0.04);
       fill(244, 71, 71); // Rojo
       rect(width*0.555, height*0.724, width*0.145, height* 0.04);
       
       if (verde){
         noFill();
         stroke(0);
         strokeWeight(5);
         rect(width*0.255, height*0.724, width*0.145, height* 0.04);
         noStroke();
       } else if (naranja){
         noFill();
         stroke(0);
         strokeWeight(5);
         rect(width*0.405, height*0.724, width*0.145, height* 0.04);
         noStroke();
       } else if (rojo){
        noFill();
         stroke(0);
         strokeWeight(5); 
         rect(width*0.555, height*0.724, width*0.145, height* 0.04);
         noStroke();
         
       }
       
       if (img5){
        image(ele, width*0.31, height*0.28, width*0.22, height*0.27);
        image(ele, width*0.42, height*0.28, width*0.22, height*0.27);
        image(ele, width*0.53, height*0.28, width*0.22, height*0.27);
        image(ele, width*0.64, height*0.28, width*0.22, height*0.27);
      } else if (img4){
       image(ele, width*0.31, height*0.28, width*0.22, height*0.27);
        image(ele, width*0.42, height*0.28, width*0.22, height*0.27);
        image(ele, width*0.53, height*0.28, width*0.22, height*0.27); 
      } else if (img3){
        image(ele, width*0.31, height*0.28, width*0.22, height*0.27);
        image(ele, width*0.42, height*0.28, width*0.22, height*0.27);
      } else if (img){
        image(ele, width*0.31, height*0.28, width*0.22, height*0.27);
      }
        image(btn2, width*0.4, height*0.85, width*0.2, height*0.13); 
    }
}
