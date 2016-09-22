private Frog frog;
private Car car;
private Car car2;
private boolean right;
private boolean left;
private boolean up;
private boolean down;
private float textX;
private float textY;
private float x, y = 600/2;
private int carSize;
private boolean lose = false;
private int loseTimer = 0;

boolean intersects(Car car) {
  if ((frog.getY() > car.getY() && frog.getY() < car.getY()+50) && (frog.getXPos() > car.getXPos() && frog.getXPos() < car.getXPos
    ()+car.getSize()))
    return true;
  else 
  return false;
}

void setup() {
  carSize = 1;
  frog = new Frog(600/2, 550, 50, 50);
  car = new Car(0, 600/2, 100, 50);
  car2 = new Car(600, 600/2, 100, 50);
  size(600, 600);
  background(0, 200, 0);
}

void draw() {
  print(loseTimer+ " ");
  background(0, 200, 0);
    detectCollision();
  frog.render();
  car.render();
  car2.render();
  car.carAIRight();
  car2.carAILeft();
  if (up && loseTimer <=1) {
    frog.setYPos(frog.getYPos() - 2);
  } else if (down && loseTimer <= 1) {
    frog.setYPos(frog.getYPos() + 2);
  } else if (right && loseTimer <= 1) {
    frog.setXPos(frog.getXPos() + 2);
  } else if (left && loseTimer <= 1) {
    frog.setXPos(frog.getXPos() - 2);
  }
  if (intersects(car)) {
    lose = true;
  } else if (lose == true) {
    loseTimer++;
    textX = random(0, 600);
    textY = random(0, 600);
    fill(0, 0, 0);
    textSize(50);
    text("GAME OVER", textX, textY);
    text("GAME OVER", textX, textY);
    text("GAME OVER", textX, textY);
  }
  if (loseTimer == 222) {
    System.exit(0);
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
  boolean win = false;
  if (frog.getYPos() <= 20) {
    //frog.setYPos(frog.getYPos() + 10);
    win = true;
  } else if (frog.getYPos() >= 580) {
    frog.setYPos(frog.getYPos() - 10);
  } else if (frog.getXPos() >= 580) {
    frog.setXPos(frog.getXPos() - 10);
  } else if (frog.getXPos() >= 580) {
    frog.setXPos(frog.getXPos() - 10);
  } if(win){
   fill(0,0,0);
   text("U WIN", 600/2, 600/2);
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

class Car {
  public int x;
  public int y;
  public int width;
  public int height;

  public Car(int x, int y, int width, int height) {
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
  public void render() {
    fill(0, 0, 200);
    rect(x, y, width, height);
  }

  public int getSize() {
    return getWidth() + getHeight();
  }

  public void carAIRight() {
    x++;
    if(getXPos() >= 600){
    setXPos(-100);
    }
  }
    public void carAILeft() {
    x--;
    if(getXPos() <= -100){
    setXPos(600/2);
    }
  }
}