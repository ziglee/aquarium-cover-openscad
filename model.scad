thickness = 4;
aqua_deepness = 170;
aqua_width = 352;
cover_height = 120;
pump_width = 90;
pump_height = 40;
back_cable_window_width = 15;
back_cable_window_height = 40;

module side_wall() {
	cube([aqua_deepness + thickness*2,20,thickness]);
	cube([70 + thickness,cover_height,thickness]);
	translate([70 + thickness,20,0]) {
		linear_extrude(height=thickness, convexity=0, twist=0)
		polygon(points=[[0,0],[100+thickness,0],[0,100]], paths=[[0,1,2]]);
	}
	translate([thickness,10,thickness]) {
		cube([aqua_deepness,thickness,thickness]);
	}
}

module back_wall_first_half() {
	difference() {
		union() {
			cube([aqua_width/2,cover_height,thickness]);
			translate([thickness,10,thickness]) {
				cube([aqua_width/2-thickness,thickness,thickness]);
			}
		}
		translate([20,0,0]) {
			cube([back_cable_window_width,back_cable_window_height,50]);
		}
	}
}

module back_wall_second_half() {
	difference() {
		union() {
			cube([aqua_width/2,cover_height,thickness]);
			translate([0,10,thickness]) {
				cube([aqua_width/2-thickness,thickness,thickness]);
			}
		}
		cube([pump_width,pump_height,50]);
	}
}

module front_wall_first_half() {
	cube([aqua_width/2,20,thickness]);
	translate([thickness,10,thickness]) {
		cube([aqua_width/2-thickness,thickness,thickness]);
	}
}

module front_wall_second_half() {
	cube([aqua_width/2,20,thickness]);
	translate([0,10,thickness]) {
		cube([aqua_width/2-thickness,thickness,thickness]);
	}
}

module front_window_half() {
	difference() {
		cube([aqua_width/2,140,thickness]);
		rotate(a=-45, v=[1,0,0]) {
			translate([0,-20,0]) {
				cube([aqua_width/2,20,20]);
			}
		}
		translate([0,140,0]) {
			rotate(a=-45, v=[1,0,0]) {
				translate([0,-20,0]) {
					cube([aqua_width/2,20,20]);
				}
			}
		}
	}
}

front_window_half();