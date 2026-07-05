piso = 250;
autoGenerate = true;
debugDraw = true;

if (autoGenerate) {
	var fd = scrGenDungeon(piso);
	if (fd != undefined) {
		scrGenRenderToRoom(fd);
		floorData = fd;
		ready = true;
	} else {
		show_debug_message("ERROR objDungeonGenerator: Falló la generación del piso " + string(piso));
	}
} else {
	floorData = undefined;
	ready = false;
}
