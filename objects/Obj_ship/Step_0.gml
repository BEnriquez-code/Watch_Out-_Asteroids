if (keyboard_check(vk_left)){
	image_angle += rotation_rate
}

if (keyboard_check(vk_right)){
	image_angle -= rotation_rate
}

if (keyboard_check(vk_up)){
	motion_add(image_angle, acceleration)
	audio_play_sound(snd_thrust, 100, false)
}

if(can_fire_timer > 0){
	can_fire_timer -= 2.5
}

if (keyboard_check(vk_space) && can_fire_timer <= 0){
	var instance = instance_create_layer(x, y, "Instances", Obj_missile)
	instance.direction = image_angle
	instance.image_angle = image_angle
	
	audio_play_sound(snd_fire, 100,  false)
	can_fire_timer = fire_cooldown
}

if(speed > max_speed) speed = max_speed

speed *= drag

move_wrap(true, true, sprite_width / 2)

update_particles()

function update_particles()
{
  // particle system
  // set particle position relative to the ship angle
  var ox = x - lengthdir_x(32, image_angle)
  var oy = y - lengthdir_y(32, image_angle)

  part_system_position(flame, ox, oy)
  part_system_angle(flame, image_angle)

  if (keyboard_check(vk_up)) 
  {
      part_emitter_stream(flame, emitter, particle_type, 3);
  } 
  else 
  {
      part_emitter_stream(flame, emitter, particle_type, 0);
  }
}