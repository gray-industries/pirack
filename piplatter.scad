usbheight=15.7;
usboff1=2;
usboff2=4.5;
usboff3=3.5;
ethheight=13.7;
ethoff1=2.5;
usbwid=14;
ethwid=16;
width=55.5;
length=87;
backheight=3;
boardheight=1.5;
od=6;
id=3;
$fs=0.1;
poff=22;

module pillar(h1) {
	difference() {
		cube([od,od,h1]);
		translate([od/2,od/2,0]) cylinder(d=id,h=h1);
	}
}

module platter() {
	translate([-3,0,0]) cube([od+5,length,boardheight]);
	cube([width,od+3,boardheight]);
//	translate([-3,length-od-2,0]) cube([width,od+2,boardheight]);
	translate([width-od-2,0,0]) cube([od+8,length,boardheight]);
	translate([-3,0,0]) cube([3+usboff1,boardheight,usbheight+boardheight]);
	translate([-3,boardheight,0]) cube([4,1,usbheight+boardheight*2-3]);
	translate([usboff1+usbwid,0,0]) cube([usboff2,boardheight,usbheight+boardheight]);
	translate([usboff1+usboff2+2*usbwid,0,0]) cube([usboff3,boardheight,usbheight+boardheight]);
	translate([usboff1+usboff2+usboff3+2*usbwid,0,0]) cube([ethwid,boardheight,usbheight-ethheight+boardheight]);
	translate([usboff1+usboff2+usboff3+2*usbwid+ethwid,0,0]) cube([ethoff1+5,boardheight,usbheight+boardheight]);
	translate([usboff1+usboff2+usboff3+2*usbwid+ethwid,boardheight,0]) cube([5+ethoff1,1,usbheight+boardheight*2-3]);
	translate([0.5,length-od-0.5,0]) pillar(usbheight+boardheight);
	translate([width-od,length-od-0.5,0]) pillar(usbheight+boardheight);
	translate([0.5,poff,0]) pillar(usbheight+boardheight);
	translate([width-od,poff,0]) pillar(usbheight+boardheight);
}

module lid() {
	difference() {
		union() {
			translate([-6,0,0]) cube([width+9,boardheight,boardheight*2+backheight]);
			translate([0,length-od-1,0]) pillar(backheight+boardheight);
			translate([width-od-0.5,length-od-1,0]) pillar(backheight+boardheight);
			translate([0,poff,0]) pillar(backheight+boardheight);
			translate([width-od-0.5,poff,0]) pillar(backheight+boardheight);
			translate([-2,0,0]) cube([width+2,boardheight+od+2,boardheight]);
			translate([-3,0,0]) cube([od+4,length,boardheight]);
			translate([width-od-2,0,0]) cube([od+3,length,boardheight]);
			translate([-6,boardheight,0]) cube([3+ethoff1,1,boardheight+backheight+2.9]);
			translate([width-1,boardheight,0]) cube([4,1,boardheight+backheight+2.9]);
		}
		translate([od/2,length-0.5-od/2,0]) cylinder(d1=od,d2=id,h=boardheight);
		translate([width-od/2-0.5,length-0.5-od/2,0]) cylinder(d1=od,d2=id,h=boardheight);
		translate([od/2,poff+od/2,0]) cylinder(d1=od,d2=id,h=boardheight);
		translate([width-od/2-0.5,poff+od/2,0]) cylinder(d1=od,d2=id,h=boardheight);
	}
}

//translate ([width+3,0,usbheight+boardheight*3+backheight]) rotate([0,180,0]) platter();
translate ([width+3*od+10,length+10+od,0]) rotate([0,0,180]) platter();

//translate ([3,boardheight,boardheight+backheight]) cube([width,length,boardheight]);

translate([3,0,0]) lid();
