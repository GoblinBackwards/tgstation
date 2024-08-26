/obj/machinery/computer/experimental_cloner
	name = "experimental cloner console"
	var/obj/machinery/experimental_cloning/pod/connected_pod = null
	var/obj/machinery/experimental_cloning/scanner/connected_scanner = null
	var/max_link_range = 5

/obj/machinery/computer/experimental_cloner/multitool_act(mob/living/user, obj/item/multitool/tool)
	if (!istype(tool))
		return

	if (QDELETED(tool.buffer))
		balloon_alert(user, "Buffer empty")
		return ITEM_INTERACT_BLOCKING

	if (!(tool.buffer in range(max_link_range)))
		balloon_alert(user, "Not in range")
		return ITEM_INTERACT_BLOCKING

	if (istype(tool.buffer, /obj/machinery/experimental_cloning/pod))
		connected_pod = tool.buffer
		balloon_alert(user, "Pod linked")
		RegisterSignal(connected_pod, COMSIG_QDELETING, PROC_REF(on_pod_del))

	if (istype(tool.buffer, /obj/machinery/experimental_cloning/scanner))
		connected_scanner = tool.buffer
		balloon_alert(user, "Scanner linked")
		RegisterSignal(connected_scanner, COMSIG_QDELETING, PROC_REF(on_scanner_del))

	return ITEM_INTERACT_SUCCESS

/obj/machinery/computer/experimental_cloner/proc/on_pod_del()
	SIGNAL_HANDLER
	connected_pod = null

/obj/machinery/computer/experimental_cloner/proc/on_scanner_del()
	SIGNAL_HANDLER
	connected_scanner = null
