SpaceShip s = new SpaceShip();//your variable declarations here
ArrayList <Asteroid> seven = new ArrayList <Asteroid>();
ArrayList <Bullet> sevens = new ArrayList <Bullet>();
Star[] ss = new Star[90];
boolean w = false;
boolean a = false;
boolean d = false;
public void setup() 
{
  size(800,800);
  for(int i=0;i<ss.length;i++)
  {
    ss[i] = new Star();
  }
  for(int i=0;i<10;i++)
  {
    seven.add(i, new Asteroid());
  }
}
public void draw() 
{
  background(0);
  for(int i=0;i<ss.length;i++)
  {
    ss[i].show();
  }
  for(int i=0;i<seven.size();i++)
  {
    seven.get(i).show();
    seven.get(i).move();
  
  }
  for(int i=0;i<sevens.size();i++)
  {
    sevens.get(i).show();
    sevens.get(i).move();
    if(sevens.get(i).myCenterX<10 || sevens.get(i).myCenterX>690 || sevens.get(i).myCenterY<10 || sevens.get(i).myCenterY>690)
    {
      sevens.remove(i);
      break;
    }
    for(int s=0;s<seven.size();s++)
    {
      if(dist((float)seven.get(s).getX()+20, (float)seven.get(s).getY()+20, (float)sevens.get(i).getX(), (float)sevens.get(i).getY())<20 || dist((float)seven.get(s).getX()-20, (float)seven.get(s).getY()-20, (float)sevens.get(i).getX(), (float)sevens.get(i).getY())<20 || dist((float)seven.get(s).getX()+20, (float)seven.get(s).getY()-20, (float)sevens.get(i).getX(), (float)sevens.get(i).getY())<20 || dist((float)seven.get(s).getX()-20, (float)seven.get(s).getY()+20, (float)sevens.get(i).getX(), (float)sevens.get(i).getY())<20)
      {
        seven.remove(s);
        sevens.remove(i);
        break;
      }
    }
  }
  s.show();
  s.move();
  if(w == true && a == true)
  {
    s.accelerate(.15);
    s.rotate(-7);
  }
  else if(w==true&&d==true)
  {
    s.accelerate(.15);
    s.rotate(7);
  }
  else if(w == true)
  {
    s.accelerate(.15
      );
  }
  else if(a == true)
  {
    s.rotate(-7);
  }
  else if(d == true)
  {
    s.rotate(7);
  }
}
class SpaceShip extends Floater  
{   
  public void setX(int x){myCenterX = x;}//your code here
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
  SpaceShip()
  { 
    myColor = 255;
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -10;
    yCorners[0] = -10;
    xCorners[1] = 20;
    yCorners[1] = 0;
    xCorners[2] = -10;
    yCorners[2] = 10;
    myCenterX = 350;
    myCenterY = 350;
    myPointDirection = 0;
  }
}
abstract class Floater
{   
  protected int corners; 
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; 
  protected double myDirectionX, myDirectionY;
  protected double myPointDirection;
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
    fill(255);   
     
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
  if(key=='s')//hyperspace
  {
    s.setX((int)(Math.random()*700));
    s.setY((int)(Math.random()*700));
    s.setPointDirection((int)(Math.random()*360));
    s.setDirectionX(0);
    s.setDirectionY(0);
  }
  else if(key =='a')
  {
    a = true;
  }
  else if(key =='d')
  {
    d = true; 
  } 
  else if(key =='w')
  {
    w = true;
  }
  if(key ==' ')
  {
    if(sevens.size()<10)
      sevens.add(new Bullet(s));
  }
}
public void keyReleased()
{
  if(key=='a')
  {
    a = false;
  }
  else if(key=='d')
  {
    d = false;
  }
  else if(key=='w')
  {
    w = false;
  }
}
class Bullet extends Floater
{
  public void setX(int x){myCenterX = x;}//your code here
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
  public double dRadians =myPointDirection*(Math.PI/180);
  Bullet(SpaceShip theShip)
  {
    myCenterX = s.myCenterX;
    myCenterY = s.myCenterY;
    myPointDirection = s.myPointDirection;
    myColor = 200;
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + s.myDirectionX;
    myDirectionY = 5 * Math.sin(dRadians) + s.myDirectionY;
  }
  public void show()
  {
    fill(255);          
    double dRadians = myPointDirection*(Math.PI/180);                 
    beginShape();         
    ellipse((float)myCenterX,(float)myCenterY,(float)10,(float)10);
    endShape(CLOSE);  
  }
}
class Star
{
  int myX, myY;
  Star()
  {
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
  }
  void show()
  {
    fill(255);
    ellipse(myX,myY,4,4);
  }
}
class Asteroid extends Floater
{
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
  private double ten = (Math.random()*5-2);
  private int nine = (int)(Math.random()*6); 
  Asteroid()
  { 
    myDirectionX = (Math.random()*5-2);
    myDirectionY = (Math.random()*5-2);
    myColor = 255;
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -12;
    yCorners[0] = 24;
    xCorners[1] = 12;
    yCorners[1] = 24;
    xCorners[2] = 24;
    yCorners[2] = 0;
    xCorners[3] = 12;
    yCorners[3] = -24;
    xCorners[4] = -12;
    yCorners[4] = -24;
    xCorners[5] = -24;
    yCorners[5] = 0;
    if(nine==0)
    {
      myCenterX = 1;
      myCenterY = (int)(Math.random()*699+1);
    }
    else if(nine==1)
    {
      myCenterX = (int)(Math.random()*699+1);
      myCenterY = 1;
    }
    else if(nine==2)
    {
      myCenterX = 699;
      myCenterY = (int)(Math.random()*699+1);
    }
    else if(nine==3)
    {
      myCenterX = (int)(Math.random()*699+1);
      myCenterY = 699;
    }
  }
  public void move ()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY; 
    myPointDirection+=ten;  
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
}
