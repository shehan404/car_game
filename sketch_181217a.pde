
PImage my ;
PImage eng ;
PImage eno ;
PImage enp ;
PImage enyl ;

PImage crash;

PImage encar;

int carselection;

float enx ;
float eny ;
float enspeed =5;

int trak;

float originalcarw=200;
float originalcarh=404;

float scl=3;

float carw=originalcarw/scl;
float carh=originalcarh/scl;

float carx=390/2-carw/2;

float slidespeed=10;
float vibrat=1;

float k=0;

void setup() {
  frameRate(60);
  size(390, 650);

  my = loadImage("my.png");
  eng = loadImage("eng.png");
  eno = loadImage("eno.png");
  enp = loadImage("enp.png");
  enyl = loadImage("enyl.png");
  crash = loadImage("crash.png");
  
  
  // enx = random(0,width);
   eny = random(-200,-400) ;
   
  trak=int(random(1,7));    // track choosing
      carselection = int(random (1,5));   //car selection

   }

void draw() {
  
  background(30, 30, 30);
 
 trak=int(random(1,7));    // trak selection
 

  for (int i=width/3; i<450; i=i+width/3) {

    stroke(255);
    fill(255);
    rect(i, 0, 10, height);
    // line(i,0,i,height);
  }

  if (carx>=width-carw) {
    carx=width-carw;
  }


  if (carx<0) {
    carx=0;
  }

  //image(img, 10+carw/scl, 20,carw/scl,carh/scl );
  //image(img, 10+(carw/scl)*2, 20,carw/scl,carh/scl );

  lines();
  enemy();
  carcontrol();
  gameover();
}


void carcontrol () {

  image(my, carx+random(-vibrat, vibrat), (height-carh)+random(-vibrat, vibrat), carw, carh );

   if (keyPressed) {

    if (key== 'd'||key=='D') {
        carx=carx+slidespeed;
    }


    if (key== 'a'||key=='A') {
       carx=carx-slidespeed;
    }
  }
}



void lines() {



    for (int j=-650; j<650; j=j+width/3) {
      k=k+0.2;
      float t=j+k;
      
      fill(180, 180, 5);
      stroke(180, 180, 5);
      rect(width/3-width/6, t+65, 10, 50);
      rect(width/2, t+130, 10, 50);
      rect(width-width/6, t+65, 10, 50);
      
      if (t>=650) {
        k=0;
      }
    }
  
}




void enemy () {


 
 //eny = eny + enspeed ;
  
 
 
 if (carselection== 1){
   encar=eng;
  }
  
   if (carselection== 2){
   encar=eno;
  }
  
   if (carselection== 3){
   encar=enp;
  }
  
   if (carselection== 4){
   encar=enyl;
  }
 
     
     image(encar, enx,eny,carw,carh);

  eny = eny + enspeed ; 
  
  if (eny > height){
     eny = random(-200,-400) ;
    
    
     carselection = int(random (1,5));   //car selection
    
    
     
  enspeed = enspeed+0.2; //increes enemi car speed
  
   if (trak == 1){
     enx =0;
     }
     
     if (trak == 2){
     enx =(width/6);
     }
      
     if (trak == 3){
     enx =(width/6)*2;
     }
     
          
     if (trak == 4){
     enx =(width/6)*3;
     }
     
          
     if (trak == 5){
     enx =(width/6)*4;
     }
     
          
     if (trak == 6){
     enx =(width/6)*5;
     }
    
  }



}




void gameover(){
  
    if ((enx+carw>=carx && enx<=carx+carw) && (eny+carh>=(height-carh) && eny<=height) ){
    
      
     image(crash,carx-40,height-carh-40,150,150);
   
     println("over");
   
    }
  else{
  println("no");
  
  }

}
