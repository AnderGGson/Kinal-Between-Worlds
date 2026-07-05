function scrGenDungeon(_piso) {
	var templates = scrGenTemplates();
	if (array_length(templates) == 0) {
		show_debug_message("ERROR scrGenDungeon: No hay templates cargados");
		return undefined;
	}

	var graph = scrGenGraph();
	var nodes = graph.nodes;

	scrGenAssignTypes(nodes, _piso);
	scrGenSelectTemplates(nodes, templates);
	scrGenPositionRooms(nodes);

	var floorData = scrGenBuildFloor(nodes, templates);
	scrGenCarveCorridors(floorData, nodes, templates);

	floorData.piso = _piso;
	return floorData;
}

function scrGenAssignTypes(_nodes, _piso) {
	var n = array_length(_nodes);
	var maxDepth = 0;
	for (var i = 0; i < n; i++) {
		if (_nodes[i].depth > maxDepth) maxDepth = _nodes[i].depth;
	}

	for (var i = 0; i < n; i++) {
		if (i == 0) {
			_nodes[i].type = "start";
		} else if (_nodes[i].depth == maxDepth) {
			if (_piso > 0 && _piso % 5 == 0) {
				_nodes[i].type = "boss";
			} else {
				var r = irandom(100);
				if (r < 40) _nodes[i].type = "treasure";
				else if (r < 70) _nodes[i].type = "shop";
				else _nodes[i].type = "event";
			}
		} else {
			_nodes[i].type = "normal";
		}
	}
}

function scrGenSelectTemplates(_nodes, _templates) {
	var usedIds = [];
	var n = array_length(_nodes);

	for (var i = 0; i < n; i++) {
		var node = _nodes[i];
		var candidates = [];

		for (var t = 0; t < array_length(_templates); t++) {
			if (_templates[t].type == node.type) {
				array_push(candidates, t);
			}
		}

		if (array_length(candidates) == 0) {
			for (var t = 0; t < array_length(_templates); t++) {
				array_push(candidates, t);
			}
		}

		var fresh = [];
		for (var c = 0; c < array_length(candidates); c++) {
			if (!array_contains(usedIds, candidates[c])) {
				array_push(fresh, candidates[c]);
			}
		}
		if (array_length(fresh) == 0) fresh = candidates;

		var idx = irandom(array_length(fresh) - 1);
		node.templateId = fresh[idx];
		array_push(usedIds, node.templateId);

		var tmpl = _templates[node.templateId];
		node.w = tmpl.w;
		node.h = tmpl.h;
	}
}

function scrGenPositionRooms(_nodes) {
	var n = array_length(_nodes);
	var cols = 3;
	var spacing = 4;

	for (var i = 0; i < n; i++) {
		var row = floor(i / cols);
		var col = i % cols;
		_nodes[i].posX = col * (_nodes[i].w + spacing);
		_nodes[i].posY = row * (_nodes[i].h + spacing);
	}
}

function scrGenBuildFloor(_nodes, _templates) {
	var maxX = 0;
	var maxY = 0;
	for (var i = 0; i < array_length(_nodes); i++) {
		var n = _nodes[i];
		var ex = n.posX + n.w + 4;
		var ey = n.posY + n.h + 4;
		if (ex > maxX) maxX = ex;
		if (ey > maxY) maxY = ey;
	}
	if (maxX < 20) maxX = 20;
	if (maxY < 20) maxY = 20;

	var tileData = array_create(maxY);
	var deco = array_create(maxY);
	var wallMap = array_create(maxY);

	for (var yy = 0; yy < maxY; yy++) {
		tileData[yy] = array_create(maxX, 0);
		deco[yy] = array_create(maxX, 0);
		wallMap[yy] = array_create(maxX, 0);
	}

	for (var i = 0; i < array_length(_nodes); i++) {
		var n = _nodes[i];
		var tmpl = _templates[n.templateId];

		for (var ty = 0; ty < n.h; ty++) {
			for (var tx = 0; tx < n.w; tx++) {
				var gx = n.posX + tx;
				var gy = n.posY + ty;
				if (gx < 0 || gx >= maxX || gy < 0 || gy >= maxY) continue;

				var fv = tmpl.floor[ty][tx];
				if (fv != 0) tileData[gy][gx] = fv;

				var wv = tmpl.walls[ty][tx];
				if (wv != 0) {
					tileData[gy][gx] = wv;
					wallMap[gy][gx] = 1;
				}

				var dv = tmpl.deco[ty][tx];
				if (dv != 0) deco[gy][gx] = dv;
			}
		}
	}

	return {
		tileW: maxX,
		tileH: maxY,
		tileData: tileData,
		deco: deco,
		wallMap: wallMap,
		spawns: [],
		rooms: _nodes,
		pixelW: maxX * 32,
		pixelH: maxY * 32,
		piso: 1
	};
}

function scrGenCarveCorridors(_floor, _nodes, _templates) {
	var n = array_length(_nodes);
	var connected = array_create(n);
	for (var i = 0; i < n; i++) {
		connected[i] = array_create(n, false);
	}

	for (var i = 0; i < n; i++) {
		for (var c = 0; c < array_length(_nodes[i].connections); c++) {
			var j = _nodes[i].connections[c];
			if (j >= 0 && j < n) {
				connected[i][j] = true;
				connected[j][i] = true;
			}
		}
	}

	for (var i = 0; i < n; i++) {
		for (var j = i + 1; j < n; j++) {
			if (connected[i][j]) {
				scrGenCarveOneCorridor(_floor, _nodes, _templates, i, j);
			}
		}
	}
}

function scrGenCarveOneCorridor(_floor, _nodes, _templates, _a, _b) {
	var nodeA = _nodes[_a];
	var nodeB = _nodes[_b];
	var tmplA = _templates[nodeA.templateId];
	var tmplB = _templates[nodeB.templateId];

	var doorsA = tmplA.doors;
	var doorsB = tmplB.doors;

	var startX, startY, endX, endY;

	if (array_length(doorsA) > 0 && array_length(doorsB) > 0) {
		var bestDist = 999999;
		var bestDA = 0;
		var bestDB = 0;

		for (var da = 0; da < array_length(doorsA); da++) {
			var dax = nodeA.posX + doorsA[da].x;
			var day = nodeA.posY + doorsA[da].y;

			for (var db = 0; db < array_length(doorsB); db++) {
				var dbx = nodeB.posX + doorsB[db].x;
				var dby = nodeB.posY + doorsB[db].y;

				var dist = abs(dax - dbx) + abs(day - dby);
				if (dist < bestDist) {
					bestDist = dist;
					bestDA = da;
					bestDB = db;
				}
			}
		}

		startX = nodeA.posX + doorsA[bestDA].x;
		startY = nodeA.posY + doorsA[bestDA].y;
		endX = nodeB.posX + doorsB[bestDB].x;
		endY = nodeB.posY + doorsB[bestDB].y;
	} else {
		var ctrA_x = nodeA.posX + floor(nodeA.w / 2);
		var ctrA_y = nodeA.posY + floor(nodeA.h / 2);
		var ctrB_x = nodeB.posX + floor(nodeB.w / 2);
		var ctrB_y = nodeB.posY + floor(nodeB.h / 2);

		if (irandom(1) == 0) {
			startX = ctrA_x; startY = nodeA.posY + nodeA.h;
			endX = ctrB_x; endY = nodeB.posY;
		} else {
			startX = nodeA.posX + nodeA.w; startY = ctrA_y;
			endX = nodeB.posX; endY = ctrB_y;
		}
	}

	scrGenCarveLShape(_floor, startX, startY, endX, endY);
}

function scrGenCarveLShape(_floor, _x1, _y1, _x2, _y2) {
	var hw = 1;

	var minX = min(_x1, _x2) - hw;
	var maxX = max(_x1, _x2) + hw;
	var midY = _y1;

	for (var xx = minX; xx <= maxX; xx++) {
		for (var wy = -hw; wy <= hw; wy++) {
			var gy = midY + wy;
			if (gy >= 0 && gy < _floor.tileH && xx >= 0 && xx < _floor.tileW) {
				if (_floor.tileData[gy][xx] == 0) {
					_floor.tileData[gy][xx] = 2;
				}
				_floor.wallMap[gy][xx] = 0;
			}
		}
	}

	var minY = min(_y1, _y2) - hw;
	var maxY = max(_y1, _y2) + hw;
	var midX = _x2;

	for (var yy = minY; yy <= maxY; yy++) {
		for (var wx = -hw; wx <= hw; wx++) {
			var gx = midX + wx;
			if (yy >= 0 && yy < _floor.tileH && gx >= 0 && gx < _floor.tileW) {
				if (_floor.tileData[yy][gx] == 0) {
					_floor.tileData[yy][gx] = 2;
				}
				_floor.wallMap[yy][gx] = 0;
			}
		}
	}
}

function scrGenRenderToRoom(_floor) {
	var playerObj = asset_get_index("obj_kinalero");
	var tileSize = 32;

	if (layer_get_id("Instances") == -1) {
		layer_create(1500, "Instances");
	}

	var tilemapLayerId = layer_get_id("tileColision");
	if (tilemapLayerId == -1) {
		tilemapLayerId = layer_create(1200, "tileColision");
	} else {
		var oldTmId = layer_tilemap_get_id("tileColision");
		if (oldTmId != -1) {
			layer_tilemap_destroy(oldTmId);
		}
	}

	var tilesetId = asset_get_index("tilesCampoKinal");
	if (tilesetId == -1) {
		show_debug_message("ERROR scrGenDungeon: tilesCampoKinal no encontrado");
		return;
	}

	var tileScale = 32 div 16;
	var tmId = layer_tilemap_create(tilemapLayerId, 0, 0, tilesetId, _floor.tileW * tileScale, _floor.tileH * tileScale);

	for (var yy = 0; yy < _floor.tileH; yy++) {
		for (var xx = 0; xx < _floor.tileW; xx++) {
			if (_floor.wallMap[yy][xx] == 1) {
				for (var dy = 0; dy < tileScale; dy++) {
					for (var dx = 0; dx < tileScale; dx++) {
						tilemap_set(tmId, 1, xx * tileScale + dx, yy * tileScale + dy);
					}
				}
			}
		}
	}

	room_set_width(room, _floor.pixelW);
	room_set_height(room, _floor.pixelH);

	view_enabled = true;

	var viewW = min(640, _floor.pixelW);
	var viewH = min(480, _floor.pixelH);

	var camId = view_camera[0];
	if (camId == -1) {
		camId = camera_create();
		view_camera[0] = camId;
	}
	camera_set_view_size(camId, viewW, viewH);

	if (playerObj != -1 && array_length(_floor.rooms) > 0) {
		var startRoom = _floor.rooms[0];
		var startCX = (startRoom.posX + floor(startRoom.w / 2)) * tileSize;
		var startCY = (startRoom.posY + floor(startRoom.h / 2)) * tileSize;

		if (instance_number(playerObj) == 0) {
			instance_create_layer(startCX, startCY, "Instances", playerObj);
		}

		camera_set_view_pos(camId, startCX - viewW / 2, startCY - viewH / 2);
	}

	global.floorData = _floor;
}
