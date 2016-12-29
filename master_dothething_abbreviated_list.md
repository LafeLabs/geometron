### Processing Command Action Table

	0300:x = x0;y = y0;theta = theta0;side = unit;thetaStep = PI/2;scaleFactor = 2;
    0304:thetaStep = PI/2;    
    0305:thetaStep = 2*PI/5;    
    0306:thetaStep = PI/3;    
    0310:scaleFactor = sqrt(2); 
    0311:scaleFactor = phi;
    0312:scaleFactor = sqrt(3);
    0313:scaleFactor = 2;  //2x
    0314:scaleFactor = 3; //3x
    0330:x += side*cos(theta);y += side*sin(theta);
    0331:x -= side*cos(theta);y -= side*sin(theta);
    0332:x += side*cos(theta - thetaStep);y += side*sin(theta - thetaStep);
	0333:x += side*cos(theta + thetaStep);y += side*sin(theta + thetaStep);
    0334:theta -= thetaStep; // CCW
    0335:theta += thetaStep; // CW
    0336:side /= scaleFactor; // -
    0337:side *= scaleFactor; // +
    0340:strokeWeight(5);point(x,y);strokeWeight(1);//point
    0341:ellipse(x,y,2*side,2*side);//circle
    0342:line(x,y,x + side*cos(theta),y + side*sin(theta));//line
    0343:arc(x,y,2*side,2*side,theta - thetaStep,theta + thetaStep);//arc
    0350:thetaStep /= 2;  //angle/2
    0351:thetaStep *= 2;  //2angle
    0352:thetaStep /= 3; //angle/3
    0353:thetaStep *= 3; //3angle
