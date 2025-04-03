$fn=72;
ssd_w=72;
ssd_d=100;
ssd_h=8;
ssd_space=1;
ssd_poke=20;

h_wall=3;
h_bump=0.25;

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
translate ([ssd_w*h_bump,0,0]) rotate([-90,0,0]) cylinder(r=h_wall,h=2);
translate ([0,0,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) cylinder(r=h_wall,h=2);
translate ([ssd_w*h_bump,0,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) cylinder(r=h_wall,h=2);

translate ([0,ssd_d-ssd_poke,0]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([ssd_w*h_bump,ssd_d-ssd_poke,0]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([0,ssd_d-ssd_poke,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([ssd_w*h_bump,ssd_d-ssd_poke,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) sphere(r=h_wall);
}

translate ([ssd_w*(1-h_bump),0,0])hull()
{
rotate([-90,0,0]) cylinder(r=h_wall,h=2);
translate ([ssd_w*h_bump,0,0]) rotate([-90,0,0]) cylinder(r=h_wall,h=2);
translate ([0,0,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) cylinder(r=h_wall,h=2);
translate ([ssd_w*h_bump,0,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) cylinder(r=h_wall,h=2);

translate ([0,ssd_d-ssd_poke,0]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([ssd_w*h_bump,ssd_d-ssd_poke,0]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([0,ssd_d-ssd_poke,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([ssd_w*h_bump,ssd_d-ssd_poke,ssd_h*3+ssd_space*2]) rotate([-90,0,0]) sphere(r=h_wall);
}

hull()
{
    translate ([0,0,-h_wall/2])cube([ssd_w,ssd_d-ssd_poke-h_wall,ssd_h*3+ssd_space*2+h_wall]);

translate ([0,ssd_d-ssd_poke-h_wall/2,h_wall/2]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([ssd_w,ssd_d-ssd_poke-h_wall/2,h_wall/2]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([0,ssd_d-ssd_poke-h_wall/2,ssd_h*3+ssd_space*2-h_wall/2]) rotate([-90,0,0]) sphere(r=h_wall);
translate ([ssd_w,ssd_d-ssd_poke-h_wall/2,ssd_h*3+ssd_space*2-h_wall/2]) rotate([-90,0,0]) sphere(r=h_wall);
}
}

   union() {
translate ([0,-ssd_poke,0]) drives();
//translate ([ssd_w*h_bump+h_wall,h_wall,-h_wall])cube([ssd_w*(h_bump*2)-h_wall*2,h_wall,ssd_h*4+ssd_space*3+h_wall/2]);
       translate ([ssd_w*h_bump+h_wall*1.5,h_wall,-h_wall])hull(){
           cylinder(r=h_wall/2,h=ssd_h*4+ssd_space*3+h_wall/2);
           translate ([ssd_w*(h_bump*2)-h_wall*3,0,0])cylinder(r=h_wall/2,h=ssd_h*4+ssd_space*3+h_wall/2);
       }
}
}