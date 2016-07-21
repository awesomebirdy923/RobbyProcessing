float blueRandom = random(20);
float yellowRandom = random(20);
int score;
void setup(){
  size(800,800);
  
}

void draw(){
  line(400,0,400,800);

  
}

void keyPressed(){
if(keyCode == ENTER){
  background(255,255,255);
drawCircleLeft(yellowRandom);
drawCircleRight(blueRandom);
  }
   if(blueRandom == yellowRandom){
 blueRandom = random(20);
 yellowRandom = random(20);
 }
 if(keyCode == LEFT){
 if(yellowRandom>blueRandom){
    blueRandom = random(20);
 yellowRandom = random(20);
score++;
   println("Correct " + score);
 }else{
   println("Incorrect");
   exit();
 }
 }
 if(keyCode==RIGHT){
 if(blueRandom>yellowRandom){
    blueRandom = random(20);
 yellowRandom = random(20);
 
score++;
   println("Correct " + score);
 }else{
 println("Incorrect");
 exit();
 }
 }
}

void drawCircleLeft(float range){

  for(int i = 0; i < range; i++){
    float yellowX = random(375);
  float yellowY = random(800);
    fill(225,225,0);
    ellipse(yellowX, yellowY, 25, 25);    
 }
}
 void drawCircleRight(float range){

  for(int i = 0; i < range; i++){
     float blueX = random(375);
  blueX+=425;
  float blueY = random(800);
    fill(0,0,225);
    ellipse(blueX, blueY, 25, 25);    
 }
 }




