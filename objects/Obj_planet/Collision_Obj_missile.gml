hit_points -= 1
with(other){
	instance_destroy()
}

if(hit_points <= 0){
	player_score += 200
	instance_destroy()
}