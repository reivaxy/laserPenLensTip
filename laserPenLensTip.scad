

tol = 0.1;
laserPenDiam = 13.7;

tipHeight = 17;
tipWall = 0.8;
holeDiam = 4;

lensDiam = 8.2;
lensZ = 1.8;
lensCoverZ = 0.3;

bumpX = 0.5;
bumpY = 1;
bumpZ = 3;

translate([30, 0, 0])
  lensCover();

laserPenLensTip();
// bump();

module laserPenLensTip() {
  difference() {
    cylinder(d = laserPenDiam + tol + tipWall*2, h = tipHeight, $fn=150);
    translate([0, 0, tipWall + lensZ]) {
      cylinder(d = laserPenDiam + tol, h = tipHeight, $fn=150);
    }
    translate([0, 0, tipWall]) {
      cylinder(d = lensDiam + tol, h = tipHeight, $fn=150);
    }
    translate([0, 0, -3]) {
      cylinder(d = holeDiam, h = tipHeight, $fn=50);
    }
  }
  translate([-laserPenDiam/2 - tol, 0, lensCoverZ + 0.07 + tipWall + lensZ]) {
    bump();
  }
  rotate(120, [0, 0, 1])
    translate([-laserPenDiam/2 - tol, 0, lensCoverZ + 0.07 + tipWall + lensZ]) {
      bump();
  } 
  rotate(240, [0, 0, 1])
    translate([-laserPenDiam/2 - tol, 0, lensCoverZ + 0.07 + tipWall + lensZ]) {
      bump();
  }
}

module lensCover() {
  difference() {
    cylinder(d = laserPenDiam, h = lensCoverZ, $fn=150);
    translate([0, 0, -0.1])  // nicer preview
      cylinder(d = holeDiam + tol, h = lensCoverZ +2, $fn=150);
     
  }
}

module bump() {
  translate([0, -bumpY/2, 0]) {
    difference() {
      cube([bumpX, bumpY, bumpZ]);
      translate([bumpX, -0.1, 0]) {
        rotate(-10,[0, 1, 0]) {
          cube([bumpX*4, bumpY*2, bumpZ*2]);
        }
      }
    }
  }
  
}