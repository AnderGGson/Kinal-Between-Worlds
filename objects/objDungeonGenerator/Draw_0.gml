if (!ready || floorData == undefined) exit;

var ts = 32;
var td = floorData.tileData;
var dc = floorData.deco;

for (var yy = 0; yy < floorData.tileH; yy++) {
	for (var xx = 0; xx < floorData.tileW; xx++) {
		var tid = td[yy][xx];
		if (tid != 0) {
			draw_sprite(bckTileset, tid, xx * ts, yy * ts);
		}
		var did = dc[yy][xx];
		if (did != 0) {
			draw_sprite(bckTileset, did, xx * ts, yy * ts);
		}
	}
}
