Table table;
Photo[] photos;

int imagePlacementX = 0; // X axis position of the image
int imagePlacementY = 0; // Y axis position of the image
int moveImage = 0;

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
    // Make a Bubble object out of the data from each row.
    photos[i] = new Photo(name,time, tag);

  }
  
}

void draw() {
  background(255);
  // Display all bubbles
  for (int i = 0; i<photos.length; i++) {

    println(photos[i].name);
    PImage img = loadImage(photos[i].name + ".JPG");
    image(img,imagePlacementX,imagePlacementY,40,40); // Display the image from the current JSON Object
    println(imagePlacementX+ " , " + imagePlacementY);
    
    imagePlacementX = moveImage * 40;
    if (imagePlacementX >= 800) {
     imagePlacementX = 0;
     imagePlacementY += 40;
     moveImage = 0;
    } else if (imagePlacementY >= 800) {
     imagePlacementX = 0;
     imagePlacementY = 0;
     moveImage = 0;
    }
    moveImage++;
    
    if(i >= photos.length) { // Reset loop
      i = 0;
    }

    
  }
}
