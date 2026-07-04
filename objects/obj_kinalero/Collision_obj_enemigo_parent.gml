
if (alarm[0] < 0){
	hp -= other.dano;
	alarm[0] = 60;
	image_blend = c_red;
	
	if (hp <= 0) {
		room_restart();
		x = 20;
		y = 980;
		hp = totalHp;
	}
}