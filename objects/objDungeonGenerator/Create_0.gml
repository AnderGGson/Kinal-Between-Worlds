randomize();
piso = 1;
autoGenerate = true;
debugDraw = false;

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
