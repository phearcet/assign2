PImage ship; //your character
PImage bg;
PImage bg2; //the backgrounds
PImage hp;  //healthbar
PImage ene; //enemy
PImage tre; //tresure
PImage starttheme; //the picture at start
PImage startbutton; //picture when mouse is on the button
PImage endtheme;
PImage endbutton;
final int GAMESTART=0;
final int GAMEPLAY=1;
final int GAMELOSE=2;
int enex=floor(random(15,400));
int eney=floor(random(50,300));
int trex=floor(random(0,600));
int trey=floor(random(30,400));
int r =0;
int positionx=580,positiony=240,speed;
int gamestate;
int healthpoint; 
boolean pressup=false;
boolean pressdown=false;
boolean pressleft=false;
boolean pressright=false;

void setup () {
  size(640, 480) ;
   ship=loadImage("img/fighter.png");
 bg=loadImage("img/bg1.png");
 hp=loadImage("img/hp.png");
 ene=loadImage("img/enemy.png");
 tre=loadImage("img/treasure.png");
 bg2=loadImage("img/bg2.png");
 starttheme=loadImage("img/start2.png");
 startbutton=loadImage("img/start1.png");
 endtheme=loadImage("img/end2.png");
 endbutton=loadImage("img/end1.png");
 gamestate=GAMESTART;
 healthpoint=45;
}

void draw() {
  eney=positiony+positiony/2;
  switch(gamestate){
      case GAMESTART:
      image(starttheme,0,0);
      if(mouseX>210 && mouseX<450 && mouseY>380 && mouseY<410){
        if(mousePressed){
          gamestate=GAMEPLAY;
        }else{
        image(startbutton,0,0);
        }
        
      }
      break;
      case GAMEPLAY: 
    r=r+4;
    r= r %1280;
    speed=1;
    speed=speed+4;
    image(bg,r,0);
    image(bg2,r-640,0);
    image(bg,r-1280,0);
    if(pressup){
      positiony-=speed;
    }
    if(pressdown){
      positiony+=speed;
    }
    if(pressleft){
      positionx-=speed;
    }
    if(pressright){
      positionx+=speed;
    }
    image(ship,positionx,positiony);
    if(positionx>width-50){
      positionx=width-50;
    }
    if(positionx<0){
      positionx=0;
    }
    if(positiony>height-50){
      positiony=height-50;
    }
    if(positiony<0){
      positiony=0;
    }
    enex=enex+3;
    enex=enex%640;
    image(ene,enex,eney);
    if(positionx<=enex+60 && positionx>=enex){
      if(positiony>=eney && positiony<=eney+60){
        healthpoint=healthpoint-45;
       enex=0;
       eney=floor(random(50,300));
        }
      }


    fill(255,0,0);
    rect(15,0,healthpoint,20);
    image(hp,10,0);
    image(tre,trex,trey);       //the random tresure
    if(positionx<=trex+40 && positionx>=trex){
      if(positiony>=trey && positiony<=trey+40){
        healthpoint=healthpoint+23;
        trex=floor(random(0,600));
        trey=floor(random(30,400));
      }
    }
    if(healthpoint<=0){
      gamestate=GAMELOSE;
    }
    if(healthpoint>=225){
      healthpoint=225;
    }
    break;
  case GAMELOSE:
  image(endtheme,0,0);
  if(mouseX>210 && mouseX<435 && mouseY>310 && mouseY<350){
        if(mousePressed){
          gamestate=GAMEPLAY;
        }else{
        image(endbutton,0,0);
        }
        healthpoint=45;
        positionx=580;
        positiony=240;
      }
      break;
  }
}

 void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case UP:
      pressup=true;
   
      break;
      case DOWN:
      pressdown=true;
      
      break;
      case LEFT:
      pressleft=true;
      
      break;
      case RIGHT:
      pressright=true;
      
      break;
    }
  }

}
void keyReleased(){
  if(key==CODED){
    switch(keyCode){
      case UP:
      pressup=false;
      break;
      case DOWN:
      pressdown=false;
      break;
      case LEFT:
      pressleft=false;
      break;
      case RIGHT:
      pressright=false;
      break;
    }
  }
}
