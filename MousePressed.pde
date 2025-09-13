
void mousePressed() {
if (pantalla==0  && mouseX>=width*0.385 && mouseX<=(width*0.385+320) && mouseY>=height*0.42 && mouseY<=(height*0.42+90)) { //boton inicio pantalla principal
    pantalla=2;      
    click.play();
    //Iniciar
  }
  
  else if (pantalla==0  && mouseX>=width*0.385 && mouseX<=(width*0.385+320) && mouseY>=height*0.695 && mouseY<=(height*0.695+90)) { // boton salir pantalla principal
    System.exit(0);
    click.play();
  }//rect(width*0.395, height*0.695, 400, 90); //Salir
  
  else if (pantalla==4  && mouseX>=width*0.52 && mouseX<=(width*0.52+270) && mouseY>=height*0.71 && mouseY<=(height*0.71+90)) {  //boton salir pantalla 4
    pantalla=0;
    click.play();
    //rect(width*0.52, height*0.71, 270, 90); 
  }
  
  else if (pantalla==4 && mouseX > width * 0.28 && mouseX < width * 0.28 + 270 && mouseY > height * 0.71 && mouseY < height * 0.71 + 120) { //Enlace de la pantalla 4 Manual De Usuario
    link("https://heyzine.com/flip-book/6502c75556.html"); 
  }
  
  else if (pantalla==0  && mouseX>=width*0.395 && mouseX<=(width*0.395+300) && mouseY>=height*0.565 && mouseY<=(height*0.565+90)) { // boton guia pantalla principal
    pantalla=4;      
    click.play();
    //rect(width*0.385, height*0.42, 320, 90); 
  } 
  
  else if (pantalla == 2 && mouseX>= width*0.25 && mouseX<= (width*0.25+280) && mouseY>= height*0.3 && mouseY <= (height*0.3 + 190)){ //boton pantalla de selección judador 1
    numjug = 1;
    pantalla = 5; 
    click.play();
    //rect(width*0.25, height*0.3, 280, 190);
  } // 1 jugador
  
  else if (pantalla == 2 && mouseX>= width*0.55 && mouseX<= (width*0.55+280) && mouseY>= height*0.3 && mouseY <= (height*0.3 + 190)){ //boton pantalla de selección 2 judadores
   numjug = 2;
   pantalla = 5; 
   click.play();
  } // 2 jugadores
  
  else if (pantalla == 2 && mouseX>= width*0.25 && mouseX<= (width*0.25+280) && mouseY>= height*0.52 && mouseY <= (height*0.52 + 190)){ //boton pantalla de selección 3 judadores
    numjug = 3;
    pantalla = 5;
   click.play();
  } // 3 jugadores
  
  else if (pantalla == 2 && mouseX>= width*0.55 && mouseX<= (width*0.55+280) && mouseY>= height*0.52 && mouseY <= (height*0.52 + 190)){ //boton pantalla de selección 4 judadores
    numjug = 4;
    pantalla = 5; 
   click.play();
  } // 4 jugadores
  
 else if (pantalla == 2 && mouseX>= width*0.78 && mouseX<= (width*0.78+60) && mouseY>= height*0.777 && mouseY <= (height*0.777 + 60)){ //boton de devolver pantalla de selección
   pantalla =0;
   click.play();
  }
  
  else if (pantalla==1  && mouseX>=width*0.73 && mouseX<=(width*0.73+300) && mouseY>=height*0.88 && mouseY<=(height*0.88+80)) { //Menú pantalla 1
    pantalla=0;
    pause=true;
    click.play();
    rect(width*0.73, height*0.88, 220, 80);
    ReiniciarJuego();
    
  } 
  // image(img9, width*0.95, 10, 60, 60);
  //fill(159, 255, 81);// verde
  //rect(width*0.255, height*0.724, width*0.145, height* 0.04);
  //fill(255, 180, 81); // Naranja
  //rect(width*0.405, height*0.724, width*0.145, height* 0.04);
  //fill(244, 71, 71); // Rojo
  //rect(width*0.555, height*0.724, width*0.145, height* 0.04);
  else if (pantalla == 5 && mouseX>= width*0.255 && mouseX<= (width*0.255+width*0.145) && mouseY>= height*0.724 && mouseY <= (height*0.724 + height* 0.04)){
    dificult = 1;
    a = 3;
    time = 15;
    verde = true;
    naranja = false;
    rojo = false;
    
  } 
  else if (pantalla == 5 && mouseX>= width*0.405 && mouseX<= (width*0.405+width*0.145) && mouseY>= height*0.724 && mouseY <= (height*0.724 + height* 0.04)){
    dificult = 2;
    a = 4;
    time = 10;
    naranja = true;
    verde = false;
    rojo = false;
    
  } 
  else if (pantalla == 5 && mouseX>= width*0.555 && mouseX<= (width*0.555+width*0.145) && mouseY>= height*0.724 && mouseY <= (height*0.724 + height* 0.04)){
    dificult = 3;
    a = 5;
    time = 5;
    rojo = true;
    naranja = false;
    verde = false;
    
  } 
  
  else if (pantalla==1 && mouseX>=width*0.73 && mouseX<=(width*0.73+300) && mouseY>=height*0.2 && mouseY<=(height*0.2+80)) { //Inicio pantalla 1
    if (pause) {
      pause=false;
      click.play();
    } else {
      pause=true;
      click.play();
    }
  }
  
  else if (pantalla == 3 && mouseX >= width * 0.9 && mouseX <= (width * 0.9 + 90 ) && mouseY >= height * 0.88 && mouseY <= (height * 0.88 + 90 )) {
    pantalla = 0; // Regresar a la pantalla principal
    ReiniciarJuego();
    click.play(); // Reproduce el sonido del clic si es necesario
  } // image(back, width * 0.16,height * 0.16, 65, 65);
  else if (pantalla == 5 && mouseX >= width*0.16 && mouseX <= (width*0.16 + 65) && mouseY >= height * 0.16 && mouseY<= (height*0.16 + 65)){
   pantalla = 2; 
   click.play();
  } //image(back, width * 0.01, height * 0.01, 90, 90);
    else if (pantalla == 5 && mouseX >= width*0.01 && mouseX <= (width*0.01 + 90) && mouseY >= height*0.01 && mouseY <= (height*0.01 + 90)){
     image(inicio,0,0,width, height);
     pantalla = 2;
     click.play();
    }
    //image(ele, width*0.2, height*0.28, width*0.22, height*0.27);
    //image(normal, width*0.31, height*0.28, width*0.22, height*0.27);
    //image(normal, width*0.42, height*0.28, width*0.22, height*0.27);
    //image(normal, width*0.53, height*0.28, width*0.22, height*0.27);
    //image(normal, width*0.64, height*0.28, width*0.22, height*0.27);
    
      else if (pantalla == 5 && mouseX >= width*0.64 && mouseX <= (width*0.64 + width*0.22) && mouseY >= height*0.28 && mouseY <= (height*0.28 + height*0.27)){
        img4 = false;
        img3 = false;
        img = false;
        img5 = true;
        round = 5;
        click.play();
      }
      else if (pantalla == 5 && mouseX >= width*0.53 && mouseX <= (width*0.53 + width*0.22) && mouseY >= height*0.28 && mouseY <= (height*0.28 + height*0.27)){
        img4 = true;
        img3 = false;
        img = false;
        img5 = false;
        round = 4;
        click.play();
      }
      else if (pantalla == 5 && mouseX >= width*0.42 && mouseX <= (width*0.42 + width*0.22) && mouseY >= height*0.28 && mouseY <= (height*0.28 + height*0.27)){
       img3 = true;
       img4 = false;
       img5 = false;
       img=false;
       round = 3;
       click.play();
      }
      else if (pantalla == 5 && mouseX >= width*0.31 && mouseX <= (width*0.31 + width*0.22) && mouseY >= height*0.28 && mouseY <= (height*0.28 + height*0.27)){
        img = true;
        img3 = false;
        img4 = false;
        img5 = false;
        round = 2;
        click.play();
      } else if (pantalla == 5 && mouseX >= width*0.2 && mouseX <= (width*0.2 + width*0.22) && mouseY >= height*0.28 && mouseY <= (height*0.28 + height*0.27)){
        img = false;
        img3 = false;
        img4 = false;
        img5 = false;
        round = 1;
        click.play();
      } else if (pantalla == 5 && mouseX >= width*0.4 && mouseX <= (width*0.4 + width*0.2) && mouseY >= height*0.85 && mouseY <= (height*0.85 + height*0.13)){
        pantalla = 1;
      }//image(btn2, width*0.4, height*0.85, width*0.2, height*0.13); 
      
    
  
  
  // Calcula la posición dentro de la matriz basado en el clic del mouse
  float offsetX = (width - (celdas * tamaño)) / 2;
  float offsetY = (height - (celdas * tamaño)) / 2;
  int j = int((mouseX - offsetX) / tamaño);
  int i = int((mouseY - offsetY) / tamaño);
  
  // Condición cuando el usuario da click a un dulce dentro de los límites de la matriz
  if (!pause && mov>0 && i >= 0 && i < celdas && j >= 0 && j < celdas) {
    PImage selectedImage = mimg[i][j];
    if (selectedImage != null) {
      explotar(i, j, selectedImage);
      bsound.play();
      counterR();
      mov=mov-1;
      if (mov<1) {
        reiniciar();
        
      }
    } 
  }  
  
  //opción de poder quitar la música en pantalla principal
  else if (pantalla == 0 && mouseX>= width*0.95 && mouseX<= (width*0.95+60) && mouseY>= 10 && mouseY <= (10 + 60)){ 
   menu = !menu;
  }
  
  if (pantalla == 0 && mouseX>= width*0.95 && mouseX<= (width*0.95+60) && mouseY>= 80 && mouseY <= (80 + 60)){
    if (music) {
      bgmusic.stop(); 
      cancel = true;
    } else {
      bgmusic.loop(); 
      cancel = false;
    }
    music = !music; 
  }
}
