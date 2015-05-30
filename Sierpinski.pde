/*
Sierpinski
 by Alejandro García Salas
 
an interesting looking 3D visualization of the Sierpinski triangle based on Marc Vanlindt's Sierpinski Pyramid (http://www.vanlindt.be/2014/01/02/processing-sierpinski-pyramid/)
*/


    float rotationAngle;               
    float boxsize = 50;
    float minsize = 20;   
    float rotationSpeed = 0.03;
    
    void setup()
    {
      size(800, 500, P3D);
    }


    void draw()
    {
      lights();
      stroke(255, 255, 255);
      noFill();
      background(0, 0, 0);
      translate(width/2, height/2);
      rotationAngle += rotationSpeed; 
      if(rotationAngle > 180){
        rotationSpeed=-rotationSpeed;
      } 
      if(rotationAngle <-180){
        rotationSpeed=-rotationSpeed;
      }
      rotateX(rotationAngle); 
      rotateY(rotationAngle); 
      rotateZ(rotationAngle);
      box(boxsize);                
      sierpinski(boxsize);    
    }
 
 
    void sierpinski(float h) { 
    if (h > minsize)           // the function continues only if the height of the box is larger than the minimum size allowed i.e minsize
      {
        h /= 1.5; 
        //h /= 2;        
        
        pushMatrix(); //saves the current coordinate system to the stack
        translate(h+h*rotationAngle/2*(rotationAngle/2),0,0);
        rotateX(rotationAngle);  
        box(h);   
        sierpinski(h);  // We call sierpinski again until minsize
        popMatrix(); // restores the prior coordinate system
        
        pushMatrix(); 
        translate(-h-h/2*(rotationAngle/10),0,0); // created in X: +1 & -1 |    Y: +1 , -1   |    Z: -1 & +1 & -1    (6 in total)
        rotateX(-rotationAngle);
        box(h);
        sierpinski(h);
        popMatrix();
 
        pushMatrix();
        translate(0, h+h/2*(rotationAngle/10),0);
        rotateY(rotationAngle);
        box(h);
        sierpinski(h); 
        popMatrix();
   
        pushMatrix();
        translate(0, -h-h/2*(rotationAngle/10),0);
        rotateY(-rotationAngle);
        box(h);
        sierpinski(h);
        popMatrix();
       
        pushMatrix();
        translate(0, -h-h/2*(rotationAngle/10),0);
        rotateY(rotationAngle);
        box(h);
        sierpinski(h);
        popMatrix();
   
        pushMatrix();
        translate(0, 0, h+h/2*(rotationAngle/10));
        rotateZ(rotationAngle);
        box(h);
        sierpinski(h); 
        popMatrix();
   
        pushMatrix();
        translate(0, 0,-h-h/2*(rotationAngle/10));
        rotateZ(-rotationAngle);
        box(h);
        sierpinski(h);
        popMatrix();
      }
   }
