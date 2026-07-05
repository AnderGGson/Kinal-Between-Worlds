if (!ready || floorData == undefined) exit;

var player = instance_find(obj_kinalero, 0);
if (player == noone) exit;

var viewW = min(640, floorData.pixelW);
var viewH = min(480, floorData.pixelH);

var camId = view_camera[0];
if (camId == -1) exit;

var camX = clamp(player.x - viewW / 2, 0, floorData.pixelW - viewW);
var camY = clamp(player.y - viewH / 2, 0, floorData.pixelH - viewH);

camera_set_view_pos(camId, camX, camY);
