
/* 20150501 18:43
20150502 14:01 add acceleration , 
14:18 add perlin as acceleration
*/

class Mover
{
  PVector location ;
  PVector velocity ;
  PVector acceleration ;
  float topspeed , tx , ty , ax , ay;
  
  Mover()
  {
    location = new PVector(width / 2 , height / 2);
    velocity = new PVector(0 , 0);
    acceleration = new PVector(0 , 0);
    topspeed = 10;
    tx = 0;
    ty = 10000;
  }
  
  void update()
  {
    ax = noise(tx);
    ay = noise(ty);
    /* how to regive value to a vector ? 
    20150505 12:30 , make vector noisevec with ax and ay .  
    */
    PVector noisevec = new PVector(ax , ay);
    acceleration = noisevec;
    println(" ax = " , ax);
    println(" ay = " , ay);
    /* " limit() " limit value , but acce forever change */
    /* move direction by vector acce and vector velo adding */
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    acceleration.mult(0);
    tx += 0.01;
    ty += 0.01;
  }
  
  void checkedge()
  {
    if(location.x < 0 || location.x > width)
    {
      //velocity.mult(-1) ;
      velocity.x = (-1) * velocity.x ;
      
    }
    
    if(location.y < 0 || location.y > height)
    {
      //velocity.mult(-1);
      velocity.y = (-1) * velocity.y ; 
    }
    
  }
  
  void display()
  {
    ellipse(location.x , location.y , 16 , 16);
  }
}

