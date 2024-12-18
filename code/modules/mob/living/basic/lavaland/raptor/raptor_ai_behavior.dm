/datum/ai_behavior/hunt_target/interact_with_target/heal_raptor
	always_reset_target = TRUE

/datum/ai_behavior/find_hunt_target/injured_raptor
	action_cooldown = 7.5 SECONDS

/datum/ai_behavior/find_hunt_target/injured_raptor/valid_dinner(mob/living/source, mob/living/target, radius)
	return (source != target && target.health < target.maxHealth)

/datum/ai_behavior/find_hunt_target/raptor_victim
	action_cooldown = 30 SECONDS

/datum/ai_behavior/find_hunt_target/raptor_victim/valid_dinner(mob/living/source, mob/living/target, radius)
	if(target.ai_controller?.blackboard[BB_RAPTOR_TROUBLE_MAKER])
		return FALSE
	return target.stat != DEAD && can_see(source, target, radius)

/datum/ai_behavior/hunt_target/interact_with_target/reset_target/bully_raptors

/datum/ai_behavior/hunt_target/interact_with_target/bully_raptors/finish_action(datum/ai_controller/controller, succeeded, hunting_target_key, hunting_cooldown_key)
	if(succeeded)
		controller.set_blackboard_key(BB_RAPTOR_TROUBLE_COOLDOWN, world.time + 2 MINUTES)
	return ..()

/datum/ai_behavior/find_hunt_target/raptor_baby/valid_dinner(mob/living/source, mob/living/target, radius)
	return can_see(source, target, radius) && target.stat != DEAD

/datum/ai_behavior/hunt_target/interact_with_target/reset_target_combat_mode_off/care_for_young

/datum/ai_behavior/hunt_target/interact_with_target/reset_target_combat_mode_off/care_for_young/target_caught(mob/living/hunter, atom/hunted)
	hunter.manual_emote("grooms [hunted]!")
	return ..()

/datum/ai_behavior/find_hunt_target/raptor_trough
	action_cooldown = 7.5 SECONDS

/datum/ai_behavior/find_hunt_target/raptor_trough/valid_dinner(mob/living/source, atom/movable/trough, radius)
	return !!(locate(/obj/item/stack/ore) in trough.contents)
