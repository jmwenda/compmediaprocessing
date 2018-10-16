Table table;
Photo[] photos;

float imagePlacementX = 0; // X axis position of the image
float imagePlacementY = 0; // Y axis position of the image
int moveImage = 1;
int displayImage = 0; // Element of the array being accessed


String showImage; // Current Image being displayed
String firstImage;
String nextImage;


void setup() {
  size(800, 800);
  // Load text file as a String
  table = loadTable("commuting_life.csv", "header");
  photos = new Photo[table.getRowCount()];
  for (int i = 0; i<table.getRowCount(); i++) {
    // Iterate over all the rows in a table.
    TableRow row = table.getRow(i);
  
    // Access the fields via their column name (or index).
    String time = row.getString("Date (yyyy_mm_dd_hh_mm_ss)");
    String name = row.getString("Name");
    String tag = row.getString("Tag 1");
    //make our photo
    photos[i] = new Photo(name,time, tag, imagePlacementX,imagePlacementY);
    imagePlacementX = moveImage * 100;
    if (imagePlacementX >= 800) {
      imagePlacementX = 0;
      imagePlacementY += 100;
      moveImage = 0;
    } else if (imagePlacementY >= 800) {
      imagePlacementX = 0;
      imagePlacementY = 0;
      moveImage = 0;
    }
    displayImage ++;
    moveImage++;
    
    if (displayImage >= photos.length){
      displayImage = 0;
      
    }

  }
  /*for (int i = 0; i<photos.length; i++) {
  println(photos[i].name+ " , "+i +" , " + photos[i].x + ", " + photos[i].y);
  }*/
  
}

void draw() {
  background(255);
  for (int i = 0; i<photos.length; i++) {
    photos[i].display();
  }
   
}
