extends Node2D

## Save filename
const SAVE_DIR = "user://savedata.save"

################################
##### SET PRICES OF THINGS #####
################################

var coins = Big.new(0.001)
var cps = Big.new(0)
var click_power = Big.new(1,0)
var cursor_price = Big.new(1,2)

var already_saved = false
var playtime_seconds = 0
var leave_time = 0
var current_time = get_time()
# The ammount of time the user was gone
var time_elapsed = 0

var hand_price = Big.new(15)
var hand_power = Big.new(0.1)
var hand_count = 0

var pickaxe_price = Big.new(1,2)
var pickaxe_power = Big.new(1)
var pickaxe_count = 0

var miner_price = Big.new(11,2)
var miner_power = Big.new(8)
var miner_count = 0

var drill_price = Big.new(12,3)
var drill_power = Big.new(47)
var drill_count = 0

var stone_mine_price = Big.new(13,4)
var stone_mine_power = Big.new(260)
var stone_mine_count = 0

var coal_mine_price = Big.new(14,5)
var coal_mine_power = Big.new(14,2)
var coal_mine_count = 0

var iron_mine_price = Big.new(20,6)
var iron_mine_power = Big.new(78,2)
var iron_mine_count = 0

var gold_mine_price = Big.new(33,7)
var gold_mine_power = Big.new(44,3)
var gold_mine_count = 0

var diamond_mine_price = Big.new(51,8)
var diamond_mine_power = Big.new(26,4)
var diamond_mine_count = 0

var delivery_service_price = Big.new(75,9)
var delivery_service_power = Big.new(16,5)
var delivery_service_count = 0

var wizard_price = Big.new(1,12)
var wizard_power = Big.new(1,7)
var wizard_count = 0

var portal_price = Big.new(14,12)
var portal_power = Big.new(65,6)
var portal_count = 0

var wishing_well_price = Big.new(17,13)
var wishing_well_power = Big.new(43,7)
var wishing_well_count = 0

var particle_accelerator_price = Big.new(21,14)
var particle_accelerator_power = Big.new(29,8)
var particle_accelerator_count = 0

var terminal_price = Big.new(31,16)
var terminal_power = Big.new(15,10)
var terminal_count = 0

#################################################################################
############################### SAVING LOGIC ####################################
#################################################################################

##########################
##### SAVE VARIABLES #####
##########################

func save_score() -> void:
	var file: FileAccess = FileAccess.open(SAVE_DIR, FileAccess.ModeFlags.WRITE)
	file.store_line(coins.toString())
	file.store_line(cps.toString())
	file.store_line(click_power.toString())
	file.store_line(cursor_price.toString())
	file.store_32(playtime_seconds)
	
	file.store_line(hand_price.toString())
	file.store_line(hand_power.toString())
	file.store_32(hand_count)
	
	file.store_line(pickaxe_price.toString())
	file.store_line(pickaxe_power.toString())
	file.store_32(pickaxe_count)
		
	file.store_line(miner_price.toString())
	file.store_line(miner_power.toString())
	file.store_32(miner_count)
		
	file.store_line(drill_price.toString())
	file.store_line(drill_power.toString())
	file.store_32(drill_count)
	
	file.store_line(stone_mine_price.toString())
	file.store_line(stone_mine_power.toString())
	file.store_32(stone_mine_count)
	
	file.store_line(coal_mine_price.toString())
	file.store_line(coal_mine_power.toString())
	file.store_32(coal_mine_count)
		
	file.store_line(iron_mine_price.toString())
	file.store_line(iron_mine_power.toString())
	file.store_32(iron_mine_count)
		
	file.store_line(gold_mine_price.toString())
	file.store_line(gold_mine_power.toString())
	file.store_32(gold_mine_count)
		
	file.store_line(diamond_mine_price.toString())
	file.store_line(diamond_mine_power.toString())
	file.store_32(diamond_mine_count)
	
	file.store_line(delivery_service_price.toString())
	file.store_line(delivery_service_power.toString())
	file.store_32(delivery_service_count)
			
	file.store_line(wizard_price.toString())
	file.store_line(wizard_power.toString())
	file.store_32(wizard_count)
	
	file.store_line(portal_price.toString())
	file.store_line(portal_power.toString())
	file.store_32(portal_count)
			
	file.store_line(wishing_well_price.toString())
	file.store_line(wishing_well_power.toString())
	file.store_32(wishing_well_count)
				
	file.store_line(particle_accelerator_price.toString())
	file.store_line(particle_accelerator_power.toString())
	file.store_32(particle_accelerator_count)
	
	file.store_line(terminal_price.toString())
	file.store_line(terminal_power.toString())
	file.store_32(terminal_count)
	
	file.close()
	null

##########################
##### LOAD VARIABLES #####
##########################

func load_score() -> void:
	if FileAccess.file_exists(SAVE_DIR):
		var file: FileAccess = FileAccess.open(SAVE_DIR, FileAccess.ModeFlags.READ)
		coins = Big.new(file.get_line())
		cps = Big.new(file.get_line())
		click_power = Big.new(file.get_line())
		cursor_price = Big.new(file.get_line())
		playtime_seconds = file.get_32()
		
		hand_price = Big.new(file.get_line())
		hand_power = Big.new(file.get_line())
		hand_count = file.get_32()
		
		pickaxe_price = Big.new(file.get_line())
		pickaxe_power = Big.new(file.get_line())
		pickaxe_count = file.get_32()
		
		miner_price = Big.new(file.get_line())
		miner_power = Big.new(file.get_line())
		miner_count = file.get_32()
		
		drill_price = Big.new(file.get_line())
		drill_power = Big.new(file.get_line())
		drill_count = file.get_32()
		
		stone_mine_price = Big.new(file.get_line())
		stone_mine_power = Big.new(file.get_line())
		stone_mine_count = file.get_32()
		
		coal_mine_price = Big.new(file.get_line())
		coal_mine_power = Big.new(file.get_line())
		coal_mine_count = file.get_32()
		
		iron_mine_price = Big.new(file.get_line())
		iron_mine_power = Big.new(file.get_line())
		iron_mine_count = file.get_32()
		
		gold_mine_price = Big.new(file.get_line())
		gold_mine_power = Big.new(file.get_line())
		gold_mine_count = file.get_32()
		
		diamond_mine_price = Big.new(file.get_line())
		diamond_mine_power = Big.new(file.get_line())
		diamond_mine_count = file.get_32()
		
		delivery_service_price = Big.new(file.get_line())
		delivery_service_power = Big.new(file.get_line())
		delivery_service_count = file.get_32()
		
		wizard_price = Big.new(file.get_line())
		wizard_power = Big.new(file.get_line())
		wizard_count = file.get_32()
		
		portal_price = Big.new(file.get_line())
		portal_power = Big.new(file.get_line())
		portal_count = file.get_32()
		
		particle_accelerator_price = Big.new(file.get_line())
		particle_accelerator_power = Big.new(file.get_line())
		particle_accelerator_count = file.get_32()
		
		terminal_price = Big.new(file.get_line())
		terminal_power = Big.new(file.get_line())
		terminal_count = file.get_32()
		
		file.close()
		null
	else:
		null


#################################################################################
############################### ON LOAD #########################################
#################################################################################

func afk_time_handler():
	current_time = get_time()
	var difference =  (current_time - leave_time)
	coins += ((hand_count * hand_power) + (pickaxe_count * pickaxe_power) + (miner_count * miner_power) +
	(drill_count * drill_power) + (stone_mine_count * stone_mine_power) + (coal_mine_count * coal_mine_power) + 
	(iron_mine_count * iron_mine_count) + (gold_mine_count * gold_mine_power) + (diamond_mine_count * diamond_mine_power) +
	(delivery_service_count * delivery_service_power) + (wizard_count * wizard_power) + (portal_count *portal_power) + (wishing_well_count * wishing_well_power) + 
	(particle_accelerator_count * particle_accelerator_power) + (terminal_count * terminal_power)) * 0.1

func _ready():
	Big.setSmallDecimals(1)
	Big.setThousandDecimals(2)
	Big.setBigDecimals(3)
	$Canvas/ClickingRect/RichTextLabel.text =  "[center]%s coins
%s cps[/center]" % [coins.toMetricSymbol(), cps.toMetricSymbol()]
	await (load_score())
	afk_time_handler()

#################################################################################
####################### SECONDS TO TIME FORMAT ##################################
#################################################################################

func playtime(total_seconds: float) -> String:
	var seconds:float = fmod(total_seconds , 60.0)
	var minutes:int   =  int(total_seconds / 60.0) % 60
	var hours:  int   =  int(total_seconds / 3600.0)
	var timer:String = "Playtime: %0ds" % [seconds]
	if playtime_seconds > 60:
		timer = "Playtime: %0dm %0ds" % [minutes, seconds]
	elif playtime_seconds > 3600:
		timer = "Playtime: %0dh %0dm %0ds" % [hours, minutes, seconds]
	return timer

#################################################################################
############################ NOTIFICATION SYSTEM ################################
#################################################################################

func notify_user(string) -> void:
	$Canvas/Notification.text = "[center]%s[/center]" % string
	$Canvas/Notification/ColorRect.visible = true;
	await get_tree().create_timer(3).timeout
	$Canvas/Notification.text = ""
	$Canvas/Notification/ColorRect.visible = false;
	pass

#################################################################################
################################# GAME LOGIC ####################################
#################################################################################

func handle_button_visibility(variable, short):
	var power_string = variable + "_power"
	var price_string = variable + "_price"
	var count_string = variable + "_count"
	
	var power = Big.new(get(power_string))
	var price = Big.new(get(price_string))
	var count = get(count_string)
	
	var node_path = "Canvas/ScrollContainer/Control/" + variable
	var node = get_node(node_path)
	
	if coins.isGreaterThanOrEqualTo(price.dividedBy(100).times(80)):
		node.visible = true
	if coins.isGreaterThanOrEqualTo(price):
		node.disabled = false
	else:
		node.disabled = true
	if count > 0: 
		node.text = "%s | %sx
%s coins" % [short, count, price.toMetricSymbol()]
	else:
		node.text = "%s
%s coins" % [variable.capitalize(), price.toMetricSymbol()]
	node.tooltip_text = "Each %s provides %s cps" % [variable, power.toMetricSymbol()]

func get_time():
	return Time.get_unix_time_from_system()


#############################
####### LOOP FUNCTION #######
#############################

func _process(delta):
## Save game every five minutes (300s)
	if (int(playtime_seconds) % 300 == 0 and playtime_seconds > 1 and already_saved == false):
		notify_user("Game saved automatically")
		save_score()
		leave_time = get_time()
		already_saved = true
		
## Prevent saving for a thousand times in the second
	if (int(playtime_seconds) % 301 == 0 and playtime_seconds > 1 and already_saved == true):
		already_saved = false
## Coin system
	coins.plusEquals(cps.times(delta))
	$Canvas/ClickingRect/RichTextLabel.text = "[center]%s coins
%s cps[/center]" % [coins.toMetricSymbol(), cps.toMetricSymbol()]

## Playtime counter
	playtime_seconds += delta
	$Canvas/time.text = playtime(playtime_seconds)
	
## Cursor upgrade
	$Canvas/ScrollContainer/Control/cursor.text = "2x click power
%s coins" % [cursor_price.toMetricSymbol()]
	if coins.isGreaterThanOrEqualTo(cursor_price):
		$Canvas/ScrollContainer/Control/cursor.disabled = false
	else:
		$Canvas/ScrollContainer/Control/cursor.disabled = true

## Hand button
	handle_button_visibility("hand", "Hand")
	
## Pickaxe button
	handle_button_visibility("pickaxe", "Pickaxe")
	
## Miner button
	handle_button_visibility("miner", "Miner")

## Drill button
	handle_button_visibility("drill", "Drill")
	
## stone_mine button
	handle_button_visibility("stone_mine", "Stone mine")

## coal_mine button
	handle_button_visibility("coal_mine", "Coal mine")

## iron_mine button
	handle_button_visibility("iron_mine", "Iron mine")

## gold_mine button
	handle_button_visibility("gold_mine", "Gold mine")

## diamond_mine button
	handle_button_visibility("diamond_mine", "Diamond mine")
	
## delivery_service button
	handle_button_visibility("delivery_service", "Delivery se.")

func _on_color_rect_mouse_exited():
	$Canvas/Notification.text = ""
	$Canvas/Notification/ColorRect.visible = false;

# Main click button
func _on_button_3_pressed():
	coins.plusEquals(click_power)
	
###########################
##### Cursor upgrades #####
###########################

func _on_cursor_pressed():
	if coins.minus(cursor_price).isPositive() and coins.isGreaterThanOrEqualTo(cursor_price):
		coins.minusEquals(cursor_price)
		click_power.timesEquals(Big.new(2))
		cursor_price.timesEquals(5)

#############################
#### Handle button press ####
#############################

func button_press_handle(variable):
	var power_string = variable + "_power"
	var price_string = variable + "_price"
	var count_string = variable + "_count"
	
	var power = Big.new(get(power_string))
	var price = Big.new(get(price_string))
	var count = get(count_string)
	
	if coins.minus(price).isPositive() and coins.isGreaterThanOrEqualTo(price):
		coins = Big.subtract(coins, price)
		cps.plusEquals(power)
		price.timesEquals(1.2)
		count += 1
		
		set(price_string, price)
		set(power_string, power)
		set(count_string, count)

func _on_hand_btn_pressed():
	button_press_handle("hand")

func _on_pickaxe_btn_pressed():
	button_press_handle("pickaxe")

func _on_miner_btn_pressed():
	button_press_handle("miner")

func _on_drill_btn_pressed():
	button_press_handle("drill")

func _on_stone_mine_pressed():
	button_press_handle("stone_mine")

func _on_coal_mine_pressed():
	button_press_handle("coal_mine")

func _on_iron_mine_pressed():
	button_press_handle("iron_mine")

func _on_gold_mine_pressed():
	button_press_handle("gold_mine")

func _on_diamond_mine_pressed():
	button_press_handle("diamond_mine")

func _on_delivery_service_pressed():
	button_press_handle("delivery_service")

func _on_save_button_pressed():
	notify_user("
Game saved!")
	leave_time = get_time()
	save_score()
