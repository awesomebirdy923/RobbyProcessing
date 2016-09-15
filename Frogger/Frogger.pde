private Frog frog;
private Car car;
private boolean right;
private boolean left;
private boolean up;
private boolean down;
private int carSize;

void setup() {
  carSize = 1;
  frog = new Frog(600/2, 550, 50, 50);
  car = new Car(0,600/2,100,50);
  size(600, 600);
  background(0, 200, 0);
}

void draw() {
  detectCollision();
  print(car.getXPos() + " ");
  background(0, 200, 0);
  frog.render();
  car.render();
  car.carAI();
  if (up) {
    frog.setYPos(frog.getYPos() - 2);
  } else if(down){
  frog.setYPos(frog.getYPos() + 2);
} else if(right){
frog.setXPos(frog.getXPos() + 2);
} else if(left){
frog.setXPos(frog.getXPos() - 2);
}
}

void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP)
    {
      up = true;
    } else if (keyCode == DOWN)
    {
      down = true;
    } else if (keyCode == RIGHT)
    {
      right = true;
    } else if (keyCode == LEFT)
    {
      left = true;
    }
  }
}

void keyReleased()
{
  if (key == CODED) {
    if (keyCode == UP)
    {
      up = false;
    } else if (keyCode == DOWN)
    {
      down = false;
    } else if (keyCode == RIGHT)
    {
      right = false;
    } else if (keyCode == LEFT)
    {
      left = false;
    }
  }
}

void detectCollision() {
  if(frog.getYPos() <= 20){
  frog.setYPos(frog.getYPos() + 10);
  } else if(frog.getYPos() >= 580){
  frog.setYPos(frog.getYPos() - 10);
  } else if(frog.getXPos() >= 580){
  frog.setXPos(frog.getXPos() - 10);
  } else if(frog.getXPos() >= 580){
  frog.setXPos(frog.getXPos() - 10);
  }
}



class Frog {
  int xPos;
  int yPos;
  int width;
  int height;
  public Frog(int xPos, int yPos, int width, int height) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.width = width;
    this.height = height;
  }
  public int getXPos() {
    return xPos;
  }

  public int getY() {
    return yPos;
  }

  public void setXPos(int xPos) {
    this.xPos = xPos;
  }

  public void setYPos(int yPos) {
    this.yPos = yPos;
  }

  public int getYPos() {
    return yPos;
  }

  public int getWidth() {
    return width;
  }

  public int getHeight() {
    return height;
  }
  public void render() {
    fill(200, 0, 0);
    ellipse(getXPos(), getYPos(), getWidth(), getHeight());
  }
}

class Car{
public int x;
public int y;
public int width;
public int height;

public Car(int x, int y, int width, int height){
this.x = x;
this.y = y;
this.width = width;
this.height = height;
}
  public int getXPos() {
    return x;
  }

  public int getY() {
    return y;
  }

  public void setXPos(int x) {
    this.x = x;
  }

  public void setYPos(int y) {
    this.y = y;
  }

  public int getYPos() {
    return y;
  }

  public int getWidth() {
    return width;
  }

  public int getHeight() {
    return height;
  }
  public void render(){
   fill(0,0,200);
  rect(x,y,width,height);
  }
  
  public void carAI(){
  if(getXPos() >= 0){
  setXPos(getXPos() + 10);
  }
  setXPos(getXPos() - 10);
  }

}