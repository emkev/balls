
/* 20150511 15:00 
*/

class attractor
{
  PVector location;
  //PVector attracting;
  float distance , mass;
  float G;
  
  attractor()
  {
    location = new PVector(width / 2 , height / 2);
    mass = 20.0;
    G = 0.4;
  }
  
  PVector attract(ball b)
  {
    PVector force = PVector.sub(location , b.location);
    //force.normalize();
    
    distance = force.mag();
    //println("dis = " , distance);
    distance = constrain(distance , 5.0 , 25.0);
    //println("dis2 = " , distance);
    
    /*
    attracting = (G * mass * b.mass) / (distance * distance);
    attracting.mult(force);
    return attracting; 
    
    wrong -- attracting is a PVector , can not be used like 
    the first line . force is a PVector , can not be used within 
    mult() . 
    
    Note distinguish a vector from a scalar ( a value ) .
    */
    float strength = (G * mass * b.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
  void display()
  {
    ellipse(location.x , location.y , 32 , 32);
  }
}
