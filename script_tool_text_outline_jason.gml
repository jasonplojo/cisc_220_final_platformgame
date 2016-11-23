/*
argument0: x-position
arugment1: y-position
arugment2: outline thickness
argument3: main text color
argument4: text to display
*/

// draw the outline first
draw_set_color(c_dkgray);
draw_text(argument0 - argument2, argument1, argument4);
draw_text(argument0 + argument2, argument1, argument4);
draw_text(argument0, argument1 - argument2, argument4);
draw_text(argument0, argument1 + argument2, argument4);

// place the main text on top of outline
draw_set_color(argument3);
draw_text(argument0, argument1, argument4);
