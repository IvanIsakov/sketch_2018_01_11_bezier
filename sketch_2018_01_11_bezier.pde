int noPoints = 6;

float[] coordinatesX = new float[noPoints + 2];

float[] coordinatesY = new float[noPoints + 2];

float initialIndex = -400.0;

float flowerInd;

int flowerIndInt = 4;

int index;
float indexCol;

int speed = 6;

int sizeOfIt = 104;

boolean ascending = true;


void setup() {

  size(720,720);
  //fullScreen();

  background(0);

  noFill();

  for (int i = 0; i < noPoints + 2; i++) {

    coordinatesX[i] = (0.8*sizeOfIt*cos(i*1.0/(noPoints)*2*PI));    

    coordinatesY[i] = (0.8*sizeOfIt*sin(i*1.0/(noPoints)*2*PI));

  }

  index = int(initialIndex);

  flowerInd = (2*abs(initialIndex))/flowerIndInt;

}


void draw() {

 // background(0);

  for (int i = -1; i < width/sizeOfIt/2+1; i++) { 
    for (int j = 0; j < height/sizeOfIt/2/2+1; j++) {
       hexagon(sizeOfIt + 2*sizeOfIt*i, 0.86*(sizeOfIt + 4*sizeOfIt*j));
    }
    for (int j = 0; j < height/sizeOfIt/2/2+1; j++) {
       hexagon(2*sizeOfIt + 2*sizeOfIt*i, 0.86*(3*sizeOfIt +4*sizeOfIt*j));
    }
  }
  

  if (ascending) {

    index += speed;

    if (index > -initialIndex) {

      ascending = false;  

    }

  } else {

    index -= 2 + 10*noise(index/100);;

    if (index < initialIndex) {

      ascending = true;  

   }

  }

  indexCol++;
  //saveFrame("video2/hexagonal_halucinations_2-####.tiff");

}

void hexagon(float x, float y) {
  pushMatrix();

  translate(x,y);
 // rotate(index/5);

  float col = sin(74*(indexCol)/flowerInd/flowerIndInt);

  stroke((1+col)*127,255*(1-col*col),127*(1 - col));

  beginShape();

  vertex(coordinatesX[0],coordinatesY[0]); // first point

  for (int i = 1; i < noPoints + 1; i++) {

    bezierVertex(coordinatesX[i]*index/flowerInd,coordinatesY[i]*index/flowerInd,coordinatesX[i-1]*index/flowerInd,coordinatesY[i-1]*index/flowerInd,coordinatesX[i],coordinatesY[i]);

  }

  endShape(CLOSE);

  popMatrix();

  
}