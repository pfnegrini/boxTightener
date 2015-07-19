/*
The MIT License (MIT)

Copyright (c) 2015 Paolo Negrini <pfnegrini@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

//Number of faces, set to 150 for final rendering
$fn = 150;

//Define parameters
lenght=50;
height=5;
holeDiam=5;

module SUB_arm() {
	difference() {
		hull() {
			translate([lenght / 2, 0, 0]) cylinder(r = lenght / 4, h = height, center = true);
			translate([-lenght / 2, 0, 0]) cylinder(r = lenght / 4, h = height, center = true);
		}
		translate([0.85 * lenght / 2, 0, 0]) for (i = [0: 10: 20]) {
			translate([i, 0, 0]) cylinder(r = holeDiam / 2, h = 1.5 * height, center = true);
			translate([-i - 0.85 * lenght, 0, 0]) cylinder(r = holeDiam / 2, h = 1.5 * height, center = true);

		}
	}
}

module bottom() {
	difference() {
		cylinder(r = lenght / 4, h = height / 2, center = true); {
			translate([lenght / 4 - holeDiam, 0, 0]) cylinder(r = holeDiam / 2, h = 1.5 * height, center = true);
			translate([-lenght / 4 + holeDiam, 0, 0]) cylinder(r = holeDiam / 2, h = 1.5 * height, center = true);
			translate([0, lenght / 4 - holeDiam, 0]) cylinder(r = holeDiam / 2, h = 1.5 * height, center = true);
			translate([0, -lenght / 4 + holeDiam, 0]) cylinder(r = holeDiam / 2, h = 1.5 * height, center = true);

		}
	}
}


module boxTightener() {
	SUB_arm();
	rotate([0, 0, 90]) SUB_arm();
}

translate([1.5*lenght, 0, height/4])bottom();
translate([0, 0, height/2])boxTightener();