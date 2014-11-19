Star [] b;
Asteroids[] c;
boolean wIsPressed = false;
SpaceShip a = new SpaceShip();
boolean dIsPressed = false;
boolean aIsPressed = false;
public void setup() 
{
  background(0);
  size (800,800);
  b = new Star[100];
  
    for(int i=0;i<b.length;i++)
      {
        b[i]=new Star();
      }
  c = new Asteroids[10];
  
    for(int i=0;i<c.length;i++)
      {
        c[i]=new Asteroids();
      }

   }   

public void draw() 
{
  background(0);
  a.show();
  a.move();
  for(int i=0;i<b.length;i++)
      {
        b[i].show();
      }
  for(int i=0;i<c.length;i++)
      {
        c[i].show();
        c[i].rotate(10);
        c[i].move();
      }
  if(wIsPressed == true && aIsPressed == true)
  {
    a.accelerate(.05);
    a.rotate(-5);
  }
  else if(wIsPressed == true && dIsPressed == true)
  {
    a.accelerate(.05);
    a.rotate(5);
  }
  else if(wIsPressed == true)
  {
    a.accelerate(.1);
  }
  else if(aIsPressed == true)
  {
    a.rotate(-5);
  }
  else if(dIsPressed == true)
  {
    a.rotate(5);
  }
}
class SpaceShip extends Floater  
{   
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return (double)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return (double)myPointDirection;}
  SpaceShip()
  {
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = -8;
    yCorners[1] = 8;
    xCorners[2] = 16;
    yCorners[2] = 0;
    myColor = color(255);
    myCenterX = 400;
    myCenterY = 400;
  }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
public void keyPressed()
{
  if(key=='h')
  {
    a.setDirectionX(0);
    a.setDirectionY(0);
    a.setX((int)(Math.random()*800));
    a.setY((int)(Math.random()*800));
    a.setPointDirection((int)(Math.random()*360));
  }
  if(key=='w')
  {
    wIsPressed = true;
  }
  if(key=='a')
  {
    aIsPressed = true;
  }
  if(key=='d')
  {
    dIsPressed = true;
  }
}

public void keyReleased()
{
  if(key=='w')
  {
    wIsPressed = false;
  }
  if(key=='a')
  {
    aIsPressed = false;
  }
  if(key=='d')
  {
    dIsPressed = false;
  }  
}

class Asteroids extends Floater  
{   
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return (double)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return (double)myPointDirection;}
  public Asteroids()
  {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0;
    yCorners[0] = 28;
    xCorners[1] = (int)(28*Math.cos(Math.PI/5.5));
    yCorners[1] = (int)(28*Math.sin(Math.PI/5.5));
    xCorners[2] = (int)(28*Math.cos(Math.PI/5.5));
    yCorners[2] = (int)(-28*Math.sin(Math.PI/5.5));
    xCorners[3] = 0;
    yCorners[3] = -28; 
    xCorners[4] =(int)(-28*Math.cos(Math.PI/5.5));
    yCorners[4] = (int)(-28*Math.sin(Math.PI/5.5));
    xCorners[5] = (int)(-28*Math.cos(Math.PI/5.5));
    yCorners[5] = (int)(28*Math.sin(Math.PI/5.5));

    myColor = color(255);
    myCenterX = Math.random()*800;
    myCenterY = Math.random()*800;
    myPointDirection=Math.random()*360;
    myDirectionX=Math.random()*1;
    myDirectionY=Math.random()*1;
  }
}

class Star    
 {  int myX, myY;
  Star()
  {
    myX=(int)(Math.random()*800);
    myY=(int)(Math.random()*800);
    
    }

  void show()
  {   
    ellipse(myX,myY,2,2);
  }

 }

