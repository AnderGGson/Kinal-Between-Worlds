//Verificar cuando el personaje toque la puerta
if place_meeting(x,y,obj_kinalero){
    room_goto(target_rm);
    obj_kinalero.x = target_x;
    obj_kinalero.y = target_y;
}