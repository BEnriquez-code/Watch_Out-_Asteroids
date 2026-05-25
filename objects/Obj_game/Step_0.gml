switch(game_state){
	 case GameState.Title:
		if (keyboard_check(vk_space)){ 
			game_state = GameState.Controls
			countdown_timer = 5*game_get_speed(gamespeed_fps)
			room_goto(rm_game)
		}	
		
		
		break
		
	 case GameState.Controls:
		countdown_timer -= 1
		if(countdown_timer <= 0){
			game_state = GameState.StartGame
		}
		break
	 
	 case  GameState.StartGame:
		audio_play_sound(snd_Retro_Platforming, 100, true)
		player_lives = 3
		player_score = 0
		current_round = 1
		game_state = GameState.StartRound
		
		break
		
	 case  GameState.StartPlayer:
		instance_create_layer(room_width / 2, room_height/ 2, "Instances", Obj_ship)
		game_state = GameState.Round
		break
		
	 case  GameState.StartRound:
		var total_enemies = instance_number(Obj_asteroid) +
							instance_number(Obj_moon) +
							instance_number(Obj_small_planet) +
							instance_number(Obj_planet)
	 
		if (total_enemies == 0){
			
			var spawn_count = 3 + current_round
			repeat(spawn_count){
				var sx = choose(0, room_width)
				var sy = choose(0, room_height)
				
				if(current_round == 1){
					spawn_asteroid(sx, sy, Size.Large)
				}else if (current_round == 2){
					instance_create_layer(sx, sy, "Instances", Obj_moon)
				}else if (current_round == 3){
					instance_create_layer(sx, sy, "Instances", Obj_small_planet)
				}else{
					instance_create_layer(sx, sy, "Instances", Obj_planet)
				}
			}
		}
		
		if(instance_number(Obj_ship) == 0){
			game_state = GameState.StartPlayer
			
		}else{
			game_state = GameState.Round
		}
		
		break
		
	 case  GameState.Round:
	 	var total_enemies = instance_number(Obj_asteroid) +
							instance_number(Obj_moon) +
							instance_number(Obj_small_planet) +
							instance_number(Obj_planet)
	 
		if (total_enemies == 0){ 
			current_round += 1
			game_state = GameState.StartRound
		}
		break
		
	 case  GameState.StartEndRound:
		break
	 case  GameState.EndRound:
		break
		
	 case  GameState.StartPlayerDead:
		player_lives--
		game_state = (player_lives == 0) ? GameState.GameOver : GameState.PlayerDead
		alarm[0] = seconds(2)
		break
	 case  GameState.PlayerDead:
		break
	 case  GameState.GameOver:
		break

}