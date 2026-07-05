if (alarm[0] < 0){
    hp -= other.dano;
    alarm[0] = 60;
    image_blend = c_red;
    
    if (hp <= 0) {
		hp = totalHp;
		
		instance_create_layer(0, 0, "Instances", obj_pantalla_muerte);
       
        instance_destroy();
    }
}