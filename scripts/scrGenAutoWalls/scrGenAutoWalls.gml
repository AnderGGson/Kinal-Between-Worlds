function scrGenAutoWalls(_floor) {
	var h = _floor.tileH;
	var w = _floor.tileW;
	var map = _floor.wallMap;
	var td = _floor.tileData;

	for (var yy = 0; yy < h; yy++) {
		for (var xx = 0; xx < w; xx++) {
			if (map[yy][xx] != 1) continue;

			var up    = (yy > 0   && map[yy-1][xx] == 1);
			var down  = (yy < h-1 && map[yy+1][xx] == 1);
			var left  = (xx > 0   && map[yy][xx-1] == 1);
			var right = (xx < w-1 && map[yy][xx+1] == 1);

			var tile;
			if (!up && !left)      tile = 7;  // ↖ esquina izquierda arriba
			else if (!up && !right) tile = 5; // ↗ esquina derecha arriba
			else if (!down && !left) tile = 8; // ↙ esquina izquierda abajo
			else if (!down && !right) tile = 6; // ↘ esquina derecha abajo
			else if (!up || !down) tile = 3;   // pared horizontal
			else if (!left || !right) tile = 4; // pared vertical
			else                   tile = 1;   // interior de pared (suelo)

			td[yy][xx] = tile;
		}
	}
}
