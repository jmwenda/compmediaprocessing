class Photo{
  String name;
  String tag;
  String date;
  PImage image;
  float x,y;
  
  
  // Create the Bubble
  Photo(String n, String t, String d,float imageplacementX, float imageplacementY) {
    name = n;
    tag = t;
    date = d;
    x = imageplacementX;
    y = imageplacementY;
    image = loadImage(name + ".JPG");
  }
  
  void display() {
    image(image,x,y,100,100);
  }
  
}
