
/* 20150508 18:17
*/

class ball
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed , mass;
  PVector force;
  
  ball()
  {
    location = new PVector(width / 2 , 80);
    velocity = new PVector(0 , 0);
    acceleration = new PVector(0 , 0);
    topspeed = 10;
    mass = 10;
    force = new PVector(0 , 0.5);
  }
  
  PVector revolve(float r , float tt)
  {
    float x = 0 , y = 0 ;
    //float theta = 0 ;
    PVector revForce ;
    
    x = r * cos(tt);
    y = r * sin(tt);
    println(" x = " , x , " , y = " , y);
    revForce = new PVector(x , y);
    
    return revForce;
  }
  void update(float r , float tt)
  {
    applyforce(revolve(r , tt));
    
    /* " limit() " limit value , but acce forever change */
    /* move direction by vector acce and vector velo adding */
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    acceleration.mult(0);
    
    theta += 0.01;
  }

  void applyforce(PVector force)
  {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
    /*
    acceleration.add(f.div(mass));
    this statement is wrong , because f.div() change value f 
    in function inner , but this function does not have any 
    return value . method add() need a value as input arguments . 
    
    Must think according to programs .  
    */
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

