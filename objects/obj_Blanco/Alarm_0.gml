image_blend = c_white;

	if (!global.aimbotActivo) {
		
			global.kills += 1;
			
	    if (global.kills >= 5) {
	        global.aimbotListo = true;
	        global.kills = 5;
	    }
	
	}
