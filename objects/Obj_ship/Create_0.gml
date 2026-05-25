flame = part_system_create(ps_flame)
part_system_global_space(flame, true)

// get emitter and particle type
var info = particle_get_info(flame);
emitter = info.emitters[0].ind;
particle_type = info.emitters[0].parttype.ind;