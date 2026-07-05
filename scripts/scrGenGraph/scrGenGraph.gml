function scrGenGraph() {
	var numRooms = irandom_range(4, 6);
	var nodes = array_create(numRooms);

	for (var i = 0; i < numRooms; i++) {
		nodes[i] = {
			id: i,
			type: "normal",
			depth: 0,
			connections: [],
			templateId: -1,
			posX: 0, posY: 0,
			w: 0, h: 0
		};
	}

	for (var i = 0; i < numRooms - 1; i++) {
		array_push(nodes[i].connections, i + 1);
		array_push(nodes[i + 1].connections, i);
	}

	if (numRooms >= 5) {
		var a = 0;
		var b = irandom_range(2, numRooms - 2);
		if (!array_contains(nodes[a].connections, b)) {
			array_push(nodes[a].connections, b);
			array_push(nodes[b].connections, a);
		}
	}

	scrGenCalcDepths(nodes);

	return { nodes: nodes, num: numRooms };
}

function scrGenCalcDepths(_nodes) {
	var n = array_length(_nodes);
	var visited = array_create(n, false);
	visited[0] = true;
	var queue = [0];

	while (array_length(queue) > 0) {
		var curr = queue[0];
		array_delete(queue, 0, 1);

		for (var i = 0; i < array_length(_nodes[curr].connections); i++) {
			var next = _nodes[curr].connections[i];
			if (!visited[next]) {
				visited[next] = true;
				_nodes[next].depth = _nodes[curr].depth + 1;
				array_push(queue, next);
			}
		}
	}
}
