if(room == rm_game && game_state == GameState.Controls){
	draw_set_alpha(0.6)
	draw_set_color(c_black)
	draw_rectangle(0,0, room_width, room_height, false)
	draw_set_alpha(1.0)
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	
	draw_text(room_width / 2, room_height / 2 - 60, "How To Play")
	draw_text(room_width / 2, room_height / 2 - 20, "Arrow Keys to Move")
    draw_text(room_width / 2, room_height / 2 + 10, "SPACEBAR to Shoot")
	
	var seconds_left = ceil(countdown_timer / game_get_speed(gamespeed_fps))
	draw_text(room_width / 2, room_height /2 + 80, "Starting in: "+ string(seconds_left))
	
	draw_set_halign(fa_left)
}