$fn=72;
ssd_w=72;
ssd_d=100;
ssd_h=9;
ssd_space=2;
ssd_poke=20;

h_wall=6;

module drives()
{
    cube([ssd_w,ssd_d,ssd_h]);
    translate([0,0,ssd_h+ssd_space]) cube([ssd_w,ssd_d,ssd_h]);
    translate([0,0,ssd_h*2+ssd_space*2]) cube([ssd_w,ssd_d,ssd_h]);
}


difference(){
   union() {
hull()
{
rotate([-90,0,0]) cylinder(r=h_wall,h=2);
translate ([ssd_w*0.3,0,0]) rotate([-90,0,0]) cylinder(r=h_wall,h=2);
translate ([0,0,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) cylinder(r=h_wall,h=2);
translate ([ssd_w*0.3,0,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) cylinder(r=h_wall,h=2);

translate ([0,ssd_d-ssd_poke,0]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([ssd_w*0.3,ssd_d-ssd_poke,0]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([0,ssd_d-ssd_poke,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([ssd_w*0.3,ssd_d-ssd_poke,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) sphere(r=h_wall);
}

translate ([ssd_w*0.7,0,0])hull()
{
rotate([-90,0,0]) cylinder(r=h_wall,h=2);
translate ([ssd_w*0.3,0,0]) rotate([-90,0,0]) cylinder(r=h_wall,h=2);
translate ([0,0,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) cylinder(r=h_wall,h=2);
translate ([ssd_w*0.3,0,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) cylinder(r=h_wall,h=2);

translate ([0,ssd_d-ssd_poke,0]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([ssd_w*0.3,ssd_d-ssd_poke,0]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([0,ssd_d-ssd_poke,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([ssd_w*0.3,ssd_d-ssd_poke,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) sphere(r=h_wall);
}
    translate ([0,0,-h_wall/2])cube([ssd_w,ssd_d-ssd_poke+h_wall/2,ssd_h*3+ssd_space*2+h_wall]);
}

translate ([0,-ssd_poke,0]) drives();
}