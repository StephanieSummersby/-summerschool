var col = "grey";

function setup() {
  createCanvas(640, 480);
}

function draw() {
  if (mouseIsPressed) {
    fill(col);
  } else {
    fill("violet");
  }
  ellipse(mouseX, mouseY, 80, 80);
}