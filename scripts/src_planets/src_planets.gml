function destroy_planet_object(enemy_instance, score_value, sound_asset){
	with(enemy_instance){
		instance_create_layer(x, y, "Instances", Obj_explosion)
		global.game.player_score += score_value
		
		audio_play_sound(sound_asset, 10, false)
		instance_destroy()
	}

}

function damage_enemy(enemy, projectile, damage_amount, score_award, explosion_sound){

	enemy.hit_points -= damage_amount
	
	with(projectile){
		instance_destroy()
	}
	
	if(enemy.hit_points <= 0){
		instance_create_layer(enemy.x, enemy.y, "Instances", Obj_explosion)
		
		audio_play_sound(explosion_sound, 10, false)
		
		if(instance_exists(Obj_game)){
			Obj_game.player_score += score_award
		}
		
		with(enemy){
			instance_destroy()
		}
	}
}