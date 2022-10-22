Walker[] bob;
int hor, ver;
void setup()
{
  frameRate(20);
  size(500,500);
  bob = new Walker[50];
  for(int i = 0; i < bob.length; i++)
  {
    bob[i] = new Walker();
  }
}
void draw()
{
  strokeWeight(2);
  noStroke();
  fill(255,255,255,40);
  rect(0,0,width,height);
  stroke(0);
  for(int i = 0; i < bob.length; i++)
  {
    bob[i].show();
    bob[i].walk();
    bob[i].distCheck();
    bob[i].explodeRandom();
  }
}
class Walker
{
  boolean active;
  int myX, myY, biasX, biasY, size, r, g, b, z, rad;
  Walker()
  {
    myX = width/2;
    myY = height/2;
    biasX = (int)(Math.random()*10);
    biasY = (int)(Math.random()*10);
    r = (int)(Math.random()*256);
    g = (int)(Math.random()*256);
    b = (int)(Math.random()*256);
    z = 1;
    active = true;
    rad = 70;
  }
  void walk()
  {
    myX = myX + (int)(Math.random()*10-biasX);
    myY = myY + (int)(Math.random()*10-biasY);
  }
  void show()
  {
    if(active==true){
      fill(r,g,b);
      ellipse(myX,myY,size,size);
    }
  }
  void distCheck()
  {
    size = 10000/(int)(dist(myX, myY, width/2, height/2)+200);
    if(myX<0)
      biasX--;
    if(myY<0)
      biasY--;
    if(myX>width)
      biasX++;
    if(myY>height)
      biasY++;
  }
  void explodeRandom()
  {
    if(active==true){
      hor = myX;
      ver = myY;
      if((int)(Math.random()*500)==0){
        active = false;
        int n = (int)(Math.random()*25)+10;
        while(n>0)
        {
          stroke(255,165,100,50+n);
          ellipse(hor,ver,rad,rad);
          rad+=(int)(2*Math.random());
          n-=2;
        }
        for(int i = 3; i>0; i--){
          z=5;
          while(myY>hor-100&&myX>ver-100&&myY<hor+100&&myX<ver+100){
            z-=Math.random();
            if(z<=2)
              z=2;
              stroke(255,0,0);
            strokeWeight(z);
            beginShape();
            vertex(myX,myY);
            myX-=(int)(40*Math.random()-20);
            myY-=(int)(40*Math.random()-20);
            vertex(myX,myY);
            endShape();
            stroke(0);
          }
        }
      }
    }strokeWeight(2);
  }
}
