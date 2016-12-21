# Square Root of Two, and Divided Angles

It's time to add more flexibility to the system of angles.  To that end, we're going to add two more angle manipulation commands, one which divides the current thetaStep by two and one which multiplies by 2.  Note that since we're starting with thetaStep being always 90 degrees, the first application of this is to divide by 2 to get a 45 degree angle.  That is very useful!  If we also add a divide by 3 and multiply by 3, we can get most of the angles we care about, such as 30 degrees and 60 degrees as well.  In addition to these we will add one more drawing command, which will draw an arc across the span of the cursor.  

Also, note that since the main point of this section is to add 45 degree angles we are going to really want to be able to multiply and divide by factors of the square root of two.  This will make it easy to make isosceles right triangles of all sizes and angles.   

So in total we are adding 6 commands: halve angle(bisect), double angle, trisect angle, triple angle, draw arc, and set scaleFactor to sqrt(2).  Each of these will need its own glyph.  The angle manipulation commands will all go in the 0350's row of the octal address space.  Draw arc lives on the 0340's line next to the other draw commands, and setting multiples for distance all go in the 0310's line below the symmetry settings and operational commands like reset.  

Angle manipulation commands indicate the "from" and "to" angles with solid and dotted lines, respectively, and are drawn to make the proportions as obvious as possible as follows:

![](root2newglyphs.png)

    if(localCommand == 0310){
       scaleFactor = sqrt(2); 
    }
    
    if(localCommand == 0343){
        arc(x,y,2*side,2*side,theta - thetaStep,theta + thetaStep);//arc
    }
    
    if(localCommand == 0350){
      thetaStep /= 2;  //angle/2
    }
    if(localCommand == 0351){
      thetaStep *= 2;  //2angle
    }
    if(localCommand == 0352){
      thetaStep /= 3; //angle/3
    }
    if(localCommand == 0353){
      thetaStep *= 3; //3angle
    }


the above adds the six new commands to doTheThing(), and now we add them to keyPressed():


	 if(key == 'j'){
     	currentGlyph = append(currentGlyph,0350);                   
     }
     if(key == 'k'){
     	currentGlyph = append(currentGlyph,0351);                   
     }
     if(key == 'l'){
     	currentGlyph = append(currentGlyph,0352);                   
     }
     if(key == ';'){
     	currentGlyph = append(currentGlyph,0353);                   
     }
     if(key == '2'){
     	currentGlyph = append(currentGlyph,0313);                   
     }
     if(key == '1'){
     	currentGlyph = append(currentGlyph,0310);                   
     }
     if(key == 'b'){
     	currentGlyph = append(currentGlyph,0343);                  
     }


Also we want to add the following line to the 0300 command:

      thetaStep = PI/2;
to make sure each iteration of the glyph starts out clean and the angle does't either infinitely shrink or grow.  

Here's a screenshot:

![](root2screenshot2.png)

It is now very straight forward to construct letters in English as well as most other languages.  




code goes here:

[square_root_2.pde](square_root_2/square_root_2.pde)

