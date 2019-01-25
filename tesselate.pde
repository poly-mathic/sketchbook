ArrayList<point> points = new ArrayList<point>();
void setup (){
  size(500, 500);
  for (int i=0; i<60; i++)
  {
    points.add(new point(random(0,500), random(0,500), random(1,3), random(1,3)));
  }
}
double getDistance(point a, point b){
  return sqrt((float)((a.xPos - b.xPos)*(a.xPos - b.xPos)+(a.yPos - b.yPos)*(a.yPos - b.yPos)));
}
class point {
  public double xPos;
  public double yPos;
  public double xVel;
  public double yVel;
  point(double xPos1,double yPos1, double xVel1, double yVel1){
    xPos = xPos1;
    yPos = yPos1;
    xVel = xVel1;
    yVel = yVel1;
  }
  public void applyStep(){
    xPos -= xVel;
    yPos -= yVel;
    if(xPos>500 || xPos<0){
     xVel *=-1;
    }
    if(yPos>500 || yPos<0){
     yVel *=-1; 
    }
  }
  public void draws(){
   color(255,255,255);
   ellipse((float)xPos, (float)yPos, 0, 0);
  }
  public void drawLines(){
    
   for(point p : points){
     if(!this.equals(p)){
     if(getDistance(this,p)<100){
       stroke(255-(float)getDistance(this,p)*2.55, 255-(float)getDistance(this,p)*2.55, 255-(float)getDistance(this,p)*2.55);
       line((float)this.xPos, (float)this.yPos, (float)p.xPos, (float)p.yPos);
     }
     }
     }
  }
 
}
void draw(){
 background(0,0,0);
 point a = new point(mouseX, mouseY, 0,0);
 points.add(a);
 for(point p : points){
    p.applyStep();
    p.draws();
    p.drawLines();
 }
 points.remove(a);
}
