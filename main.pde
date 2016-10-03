
/*20150505 12:38 change to multi ball */

//Mover m ;

/* mouse attract multiple balls -- m and b , start */
//mouseball[] mbs = new mouseball[10];
/* m and b , end */

//fricmover f;

/* attractor-a and ball-b , start */
ball b;
attractor a;
/* 2016.02.18 pm 22:11 , 
revolve force for ball -- rb , start */
float radius , theta;
/* rb , end */
/* a and b , end */

/* 2016.02.18 pm 20:55 start to code for 
   polar to cartesian (ptc) .
   ptc , start
*/
//float r = 75 ;
//float theta = 0 ;
/* ptc , end */

void setup()
{
  size(640 , 360);
  //m = new Mover();
  
  /* m and b , start */
  /*
  for(int i = 0 ; i < mbs.length ; i++)
  {
    mbs[i] = new mouseball();
  }
  */
  /* m and b , end */
  
  /* a and b , start */
  b = new ball();
  a = new attractor();
  /* rb , start */
  radius = 0.15;
  theta = 0;
  /* rb , end */
  /* a and b , end */
  
  //f = new fricmover();

}

void draw()
{

  /* (20150504 11:39) . read language ref doc carefully . 
  background ( within draw() ) : clear the display window 
  at the " beginning " of each frame . 
  so , write background() before display() .
  */
  background(200); 

  /*
  m.update();
  m.checkedge();
  m.display();
  */
  
  /* m and b , start */
  /*  
  for(int i = 0 ; i < mbs.length ; i++)
  {
    mbs[i].update();
    mbs[i].checkedge();
    mbs[i].display();
  }
  */
  /* m and b , end */
  
  /* a and b , start */
  //b.applyforce(a.attract(b));  
  //b.update();
  /* rb , start */
  b.update(radius , theta);
  /* rb , end */
  b.checkedge();
  a.display();
  b.display();
  /* rb , start */
  theta += 0.01;
  /* rb , end */
  /* a and b , end */

  /*
  f.update();
  f.checkedge();
  f.display();
  */
  //wrong to use in here : background(204);

  /* ptc , start */
  /*  
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  noStroke();
  fill(0);
  ellipse(x + width / 2 , y + height / 2 , 16 , 16);
  theta += 0.01;
  */
  /* ptc , end */
}
