/obj/machinery/experimental_cloning
	density = TRUE

/obj/machinery/experimental_cloning/multitool_act(mob/living/user, obj/item/multitool/tool)
	tool.set_buffer(src)
	balloon_alert(user, "saved to multitool buffer")
	return ITEM_INTERACT_SUCCESS

/obj/machinery/experimental_cloning/pod
	name = "experimental cloning pod"
	icon = 'icons/obj/machines/cloning.dmi'
	icon_state = "pod_0"

/obj/machinery/experimental_cloning/scanner
	name = "experimental DNA scanner"
	icon = 'icons/obj/machines/cloning.dmi'
	icon_state = "scanner"

/obj/machinery/experimental_cloning/scanner/interact(mob/user)
	if (state_open)
		close_machine()
	else
		open_machine()
