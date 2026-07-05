draw_set_alpha(0.85);
draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1.0);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var centro_x = display_get_gui_width() / 2;
var centro_y = display_get_gui_height() / 2;

// Título 
draw_set_color(c_white);
draw_text(centro_x, centro_y - 120, tituloMuerte);

// Dato curioso
draw_set_color(c_white);
draw_text_ext(centro_x, centro_y, historia, 24, 600);


draw_set_color(c_gray);
draw_text(centro_x, display_get_gui_height() - 100, "Presiona espacio para reintentar");