// More information: https://danielupshaw.com/openscad-rounded-corners/

// Set to 0.01 for higher definition curves (renders slower)
$fs = 0.15;
$fa = 7;


module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							sphere(r = radius);
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							rotate(a = rotate)
							cylinder(h = diameter, r = radius, center = true);
						}
					}
				}
			}
		}
	}
}

// An integer creates a cube with specified wall distance. Default [1, 1, 1]
size = [300, 200, 1];

// Whether or not to place the object centered on the origin. Default false
//center = true|false;
center = true;

// Specify a rounding radius. Default 0.5
radius = 60 ;

// Specify where to apply the rounded corners. Default "all"
//apply_to = "all"|"x"|"y"|"z"|"zmax"|"zmin"|"xmax"|"xmin"|"ymax"|"ymin"
apply_to = "all";
outline = 1-0.05;




////////////////////////////////////////////////////////////
plant_name = "Yellow";
plant_two = "Woodsorrel";
plant_three = "";
plant_size = 38;
plant_spacing = plant_size / 4;


subtitle = "";
    
scientific ="Oxalis";
scientific_two ="dillenii";
scientific_font = "Sitka:style=Text Italic";
scientific_size = 30;


native = true ;  

///////////////////////////////////////////////////////////

translate([0,100,-105])
 
difference(){

    union(){    
        difference(){
            difference(){
            roundedcube(size, center, radius, "z");
            translate([-200,-250,-200 ])
            cube([400,500,200]);
            };
        translate(v = [0, 0, 20])             
        roundedcube([size[0]*outline,size[1]*0.9,size[2]*2], center, radius*0.9, "z");}
    
    translate([0,0,-5])
    roundedcube(size, center, radius, "z");
    }

translate([-200,-250,-495 ])
color("Red")
cube([600,600,600]);};

if (plant_two==""){
    translate([0,125,0])
    color("Green")
    linear_extrude(height = 12)
    text(plant_name, size = plant_size,halign = "center", font="Sitka:style=Banner Bold");
    
    translate([0,57,0])
    color("Green")
    linear_extrude(height = 12)
    //text(scientific, size = 20,halign = "center", font="Sitka:style=Text Italic");
    text(scientific, size = scientific_size,halign = "center", font=scientific_font);
        
    translate([0,22,0])
    color("Green")
    linear_extrude(height = 12)
    //text(scientific, size = 20,halign = "center", font="Sitka:style=Text Italic");
    text(scientific_two, size = scientific_size,halign = "center", font=scientific_font);

}

else if (plant_three==""){

    translate([0,145,0])
    color("Green")
    linear_extrude(height = 12)
    text(plant_name, size = plant_size,halign = "center", font="Sitka:style=Banner Bold");
    
    translate([0,145 - (plant_size + plant_spacing),0])
    color("Green")
    linear_extrude(height = 12)
    text(plant_two, size = plant_size,halign = "center", font="Sitka:style=Banner Bold");
    
    translate([0,55,0])
    color("Green")
    linear_extrude(height = 12)
    //text(scientific, size = 20,halign = "center", font="Sitka:style=Text Italic");
    text(scientific, size = scientific_size,halign = "center", font=scientific_font);
        
    translate([0,22,0])
    color("Green")
    linear_extrude(height = 12)
    //text(scientific, size = 20,halign = "center", font="Sitka:style=Text Italic");
    text(scientific_two, size = scientific_size,halign = "center", font=scientific_font);
}

else {
        translate([0,150,0])
    color("Green")
    linear_extrude(height = 12)
    text(plant_name, size = plant_size,halign = "center", font="Sitka:style=Banner Bold");
    
    translate([0,150  - (plant_size + plant_spacing),0])
    color("Green")
    linear_extrude(height = 12)
    text(plant_two, size = plant_size,halign = "center", font="Sitka:style=Banner Bold");
    
    translate([0,150  - 1.7*(plant_size + plant_spacing),0])
    color("Green")
    linear_extrude(height = 12)
    text(plant_three, size = plant_size,halign = "center", font="Sitka:style=Banner Bold");
    
    translate([0,30,0])
color("Green")
linear_extrude(height = 12)
//text(scientific, size = 20,halign = "center", font="Sitka:style=Text Italic");
text(scientific, size = scientific_size,halign = "center", font=scientific_font);
    
}

translate([0,48,0])
color("Green")
linear_extrude(height = 12)
text(subtitle, size = 20,halign = "center",font="Segoe Print:style=Regular");





if(native==true){
    translate([-50,200,0])
    color("Green")
    linear_extrude(height = 14)
    text("Native", size = 20,halign = "center", font="Segoe Print:style=Bold");
    translate([-95,190,0])
    linear_extrude(height = 8)
    square([90,35]);
    };


    translate([-30,-250,0])
    linear_extrude(height = 10)
    square([60,250]);

    translate([0,-250,0])
    linear_extrude(height =10)
    polygon(points=[[-30,0],[-5,-200],[5,-200],[30,0]]);;
    
    
    translate([-5,-150,10])
    rotate([0,90,0])
    linear_extrude(height =10)
    polygon(points=[[-25,0],[0,-300],[5,0],[0,0]]);;
    
    
    translate([-30,-150,35])
    rotate([90,90,0])
    linear_extrude(height = 10)
    square([35,60]);
    
    translate([0,-440,0])
    linear_extrude(height = 1)
    circle(40);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
