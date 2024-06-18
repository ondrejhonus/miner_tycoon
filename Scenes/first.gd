extends Node2D

const SAVE_DIR = "user://savedata.save"

var coins = Big.new(0.001)
var cps = Big.new(0)
var click_power = Big.new(1,0)
var cursor_price = Big.new(1,2)
var already_saved = false

var playtime_seconds = 0

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
	print("Score saved successfully")
	pass
	
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
		print("Playtime loaded: ", playtime_seconds, "s")
	else:
		print("Save file not found, creating new game")

func _ready():
	Big.setSmallDecimals(1)
	Big.setThousandDecimals(2)
	Big.setBigDecimals(3)
	$Canvas/ClickingRect/RichTextLabel.text =  "[center]%s coins
%s cps[/center]" % [coins.toMetricSymbol(), cps.toMetricSymbol()]
	load_score()
	pass


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

func _process(delta):
	# Save game every five minutes
	if (int(playtime_seconds) % 10 == 0 and playtime_seconds > 1 and already_saved == false):
		$Canvas/Notification.text = "[center]Game saved automatically[/center]"
		$Canvas/Notification/ColorRect.visible = true;
		save_score()
		already_saved = true

	if (int(playtime_seconds) % 11 == 0 and playtime_seconds > 1 and already_saved == true):
		already_saved = false

# Coin system
	coins.plusEquals(cps.times(delta))
	$Canvas/ClickingRect/RichTextLabel.text = "[center]%s coins
%s cps[/center]" % [coins.toMetricSymbol(), cps.toMetricSymbol()]
# Playtime
	playtime_seconds += delta
	$Canvas/time.text = playtime(playtime_seconds)
# Cursor upgrade
	$Canvas/ScrollContainer/Control/cursor.text = "2x click power
%s coins" % [cursor_price.toMetricSymbol()]
	if coins.isGreaterThanOrEqualTo(cursor_price):
		$Canvas/ScrollContainer/Control/cursor.disabled = false
	else:
		$Canvas/ScrollContainer/Control/cursor.disabled = true

# Hand button
	if coins.isGreaterThanOrEqualTo(hand_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/hand.visible = true
	if coins.isGreaterThanOrEqualTo(hand_price):
		$Canvas/ScrollContainer/Control/hand.disabled = false
	else:
		$Canvas/ScrollContainer/Control/hand.disabled = true
	if hand_count > 0: 
		$Canvas/ScrollContainer/Control/hand.text = "Hand | %sx
%s coins" % [hand_count, hand_price.toMetricSymbol()]
	else:
		$Canvas/ScrollContainer/Control/hand.text = "Hand
%s coins" % [hand_price.toMetricSymbol()]
	$Canvas/ScrollContainer/Control/hand.tooltip_text = "Each hand provides %s cps" % [hand_power.toMetricSymbol()]

# Pickaxe button
	if coins.isGreaterThanOrEqualTo(pickaxe_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/pickaxe.visible = true
	if coins.isGreaterThanOrEqualTo(pickaxe_price):
		$Canvas/ScrollContainer/Control/pickaxe.disabled = false
	if pickaxe_count > 0: 
		$Canvas/ScrollContainer/Control/pickaxe.text = "Pickaxe | %sx
%s coins" % [pickaxe_count, pickaxe_price.toMetricSymbol()]
	else:
		$Canvas/ScrollContainer/Control/pickaxe.text = "Pickaxe
%s coins" % [pickaxe_price.toMetricSymbol()]
	$Canvas/ScrollContainer/Control/pickaxe.tooltip_text = "Each pickaxe provides %s cps" % [pickaxe_power.toMetricSymbol()]
	
# Miner button
	if coins.isGreaterThanOrEqualTo(miner_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/miner.visible = true
	if coins.isGreaterThanOrEqualTo(miner_price):
		$Canvas/ScrollContainer/Control/miner.disabled = false
	else:
		$Canvas/ScrollContainer/Control/miner.disabled = true
	if miner_count > 0: 
		$Canvas/ScrollContainer/Control/miner.text = "Miner | %sx
%s coins" % [miner_count, miner_price.toMetricSymbol()]
	else:
		$Canvas/ScrollContainer/Control/miner.text = "Miner
%s coins" % [miner_price.toMetricSymbol()]
	$Canvas/ScrollContainer/Control/miner.tooltip_text = "Each miner provides %s cps" % [miner_power.toMetricSymbol()]

# Drill button
	if coins.isGreaterThanOrEqualTo(drill_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/drill.visible = true
	if coins.isGreaterThanOrEqualTo(drill_price):
		$Canvas/ScrollContainer/Control/drill.disabled = false
	else:
		$Canvas/ScrollContainer/Control/drill.disabled = true
	if drill_count > 0: 
		$Canvas/ScrollContainer/Control/drill.text = "Drill | %sx
%s coins" % [drill_count, drill_price.toMetricSymbol()]
	else:
		$Canvas/ScrollContainer/Control/drill.text = "Drill
%s coins" % [drill_price.toMetricSymbol()]
	$Canvas/ScrollContainer/Control/drill.tooltip_text = "Each drill provides %s cps" % [drill_power.toMetricSymbol()]
	
# stone_mine button
	if coins.isGreaterThanOrEqualTo(stone_mine_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/stone_mine.visible = true
	if coins.isGreaterThanOrEqualTo(stone_mine_price):
		$Canvas/ScrollContainer/Control/stone_mine.disabled = false
	else:
		$Canvas/ScrollContainer/Control/stone_mine.disabled = true
	if stone_mine_count > 0: 
		$Canvas/ScrollContainer/Control/stone_mine.text = "Stone mine | %sx
%s coins" % [stone_mine_count, stone_mine_price.toMetricSymbol()]
	else:
		$Canvas/ScrollContainer/Control/stone_mine.text = "Stone mine
%s coins" % [stone_mine_price.toMetricSymbol()]
	$Canvas/ScrollContainer/Control/stone_mine.tooltip_text = "Each stone_mine provides %s cps" % [stone_mine_power.toMetricSymbol()]

# coal_mine button
	if coins.isGreaterThanOrEqualTo(coal_mine_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/coal_mine.visible = true
	if coins.isGreaterThanOrEqualTo(coal_mine_price):
		$Canvas/ScrollContainer/Control/coal_mine.disabled = false
	else:
		$Canvas/ScrollContainer/Control/coal_mine.disabled = true
	if coal_mine_count > 0: 
		$Canvas/ScrollContainer/Control/coal_mine.text = "Coal mine | %sx
%s coins" % [coal_mine_count, coal_mine_price.toMetricSymbol()]
	else:
		$Canvas/ScrollContainer/Control/coal_mine.text = "Coal mine
%s coins" % [coal_mine_price.toMetricSymbol()]
	$Canvas/ScrollContainer/Control/coal_mine.tooltip_text = "Each coal_mine provides %s cps" % [coal_mine_power.toMetricSymbol()]

# iron_mine button
	if coins.isGreaterThanOrEqualTo(iron_mine_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/iron_mine.visible = true
	if coins.isGreaterThanOrEqualTo(iron_mine_price):
		$Canvas/ScrollContainer/Control/iron_mine.disabled = false
	else:
		$Canvas/ScrollContainer/Control/iron_mine.disabled = true
	if iron_mine_count > 0: 
		$Canvas/ScrollContainer/Control/iron_mine.text = "Iron mine | %sx
%s coins" % [iron_mine_count, iron_mine_price.toMetricSymbol()]
	else:
		$Canvas/ScrollContainer/Control/iron_mine.text = "Iron mine
%s coins" % [iron_mine_price.toMetricSymbol()]
	$Canvas/ScrollContainer/Control/iron_mine.tooltip_text = "Each iron_mine provides %s cps" % [iron_mine_power.toMetricSymbol()]

# gold_mine button
	if coins.isGreaterThanOrEqualTo(gold_mine_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/gold_mine.visible = true
	if coins.isGreaterThanOrEqualTo(gold_mine_price):
		$Canvas/ScrollContainer/Control/gold_mine.disabled = false
	else:
		$Canvas/ScrollContainer/Control/gold_mine.disabled = true
	if gold_mine_count > 0: 
		$Canvas/ScrollContainer/Control/gold_mine.text = "Gold mine | %sx
%s coins" % [gold_mine_count, gold_mine_price.toMetricSymbol()]
	else:
		$Canvas/ScrollContainer/Control/gold_mine.text = "Gold mine
%s coins" % [gold_mine_price.toMetricSymbol()]
	$Canvas/ScrollContainer/Control/gold_mine.tooltip_text = "Each gold_mine provides %s cps" % [gold_mine_power.toMetricSymbol()]

# diamond_mine button
	if coins.isGreaterThanOrEqualTo(diamond_mine_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/diamond_mine.visible = true
	if coins.isGreaterThanOrEqualTo(diamond_mine_price):
		$Canvas/ScrollContainer/Control/diamond_mine.disabled = false
	else:
		$Canvas/ScrollContainer/Control/diamond_mine.disabled = true
	if diamond_mine_count > 0: 
		$Canvas/ScrollContainer/Control/diamond_mine.text = "Diamond mine | %sx
%s coins" % [diamond_mine_count, diamond_mine_price.toMetricSymbol()]
	else:
		$Canvas/ScrollContainer/Control/diamond_mine.text = "Diamond mine
%s coins" % [diamond_mine_price.toMetricSymbol()]
	$Canvas/ScrollContainer/Control/diamond_mine.tooltip_text = "Each diamond_mine provides %s cps" % [diamond_mine_power.toMetricSymbol()]
	
# delivery_serice button
	if coins.isGreaterThanOrEqualTo(delivery_service_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/delivery_service.visible = true
	if coins.isGreaterThanOrEqualTo(delivery_service_price):
		$Canvas/ScrollContainer/Control/delivery_service.disabled = false
	else:
		$Canvas/ScrollContainer/Control/delivery_service.disabled = true
	if delivery_service_count > 0: 
		$Canvas/ScrollContainer/Control/delivery_service.text = "Delivery service | %sx
%s coins" % [delivery_service_count, delivery_service_price.toMetricSymbol()]
	else:
		$Canvas/ScrollContainer/Control/delivery_service.text = "Delivery service
%s coins" % [delivery_service_price.toMetricSymbol()]
	$Canvas/ScrollContainer/Control/delivery_service.tooltip_text = "Each delivery_service provides %s cps" % [delivery_service_power.toMetricSymbol()]
	pass


func _on_color_rect_mouse_exited():
	$Canvas/Notification.text = ""
	$Canvas/Notification/ColorRect.visible = false;
	pass

func _on_button_3_pressed():
	coins.plusEquals(click_power)
	pass
	
func _on_cursor_pressed():
	if coins.minus(cursor_price).isPositive() and coins.isGreaterThanOrEqualTo(cursor_price):
		coins.minusEquals(cursor_price)
		click_power.timesEquals(Big.new(2))
		cursor_price.timesEquals(5)
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%s needed.[/center]" % [cursor_price.minus(coins).toMetricSymbol()]
		$Canvas/Notification/ColorRect.visible = true;
	pass

func _on_hand_btn_pressed():
	if coins.minus(hand_price).isPositive() and coins.isGreaterThanOrEqualTo(hand_price):
		coins = Big.subtract(coins,hand_price)
		cps.plusEquals(hand_power)
		hand_price.timesEquals(1.2)
		hand_count += 1
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%s needed.[/center]" % [hand_price.minus(coins).toMetricSymbol()]
		$Canvas/Notification/ColorRect.visible = true;
	pass

func _on_pickaxe_btn_pressed():
	if coins.minus(pickaxe_price).isPositive() and coins.isGreaterThanOrEqualTo(pickaxe_price):
		coins = Big.subtract(coins,pickaxe_price)
		cps.plusEquals(pickaxe_power)
		pickaxe_price.timesEquals(1.2)
		pickaxe_count += 1
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%s needed.[/center]" % [pickaxe_price.minus(coins).toMetricSymbol()]
		$Canvas/Notification/ColorRect.visible = true;
	pass

func _on_miner_btn_pressed():
	if coins.minus(miner_price).isPositive() and coins.isGreaterThanOrEqualTo(miner_price):
		coins = Big.subtract(coins,miner_price)
		cps.plusEquals(miner_power)
		miner_price.timesEquals(1.2)
		miner_count += 1
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%s needed.[/center]" % [miner_price.minus(coins).toMetricSymbol()]
		$Canvas/Notification/ColorRect.visible = true;
	pass

func _on_drill_btn_pressed():
	if coins.minus(drill_price).isPositive() and coins.isGreaterThanOrEqualTo(drill_price):
		coins = Big.subtract(coins,drill_price)
		cps.plusEquals(drill_power)
		drill_price.timesEquals(1.2)
		drill_count += 1
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%s needed.[/center]" % [drill_price.minus(coins).toMetricSymbol()]
		$Canvas/Notification/ColorRect.visible = true;
	pass

func _on_stone_mine_pressed():
	if coins.minus(stone_mine_price).isPositive() and coins.isGreaterThanOrEqualTo(stone_mine_price):
		coins = Big.subtract(coins,stone_mine_price)
		cps.plusEquals(stone_mine_power)
		stone_mine_price.timesEquals(1.2)
		stone_mine_count += 1
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%s needed.[/center]" % [stone_mine_price.minus(coins).toMetricSymbol()]
		$Canvas/Notification/ColorRect.visible = true;
	pass

func _on_coal_mine_pressed():
	if coins.minus(coal_mine_price).isPositive() and coins.isGreaterThanOrEqualTo(coal_mine_price):
		coins = Big.subtract(coins,coal_mine_price)
		cps.plusEquals(coal_mine_power)
		coal_mine_price.timesEquals(1.2)
		coal_mine_count += 1
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%s needed.[/center]" % [coal_mine_price.minus(coins).toMetricSymbol()]
		$Canvas/Notification/ColorRect.visible = true;
	pass


func _on_iron_mine_pressed():
	if coins.minus(iron_mine_price).isPositive() and coins.isGreaterThanOrEqualTo(iron_mine_price):
		coins = Big.subtract(coins,iron_mine_price)
		cps.plusEquals(iron_mine_power)
		iron_mine_price.timesEquals(1.2)
		iron_mine_count += 1
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%s needed.[/center]" % [iron_mine_price.minus(coins).toMetricSymbol()]
		$Canvas/Notification/ColorRect.visible = true;
	pass

func _on_gold_mine_pressed():
	if coins.minus(gold_mine_price).isPositive() and coins.isGreaterThanOrEqualTo(gold_mine_price):
		coins = Big.subtract(coins,gold_mine_price)
		cps.plusEquals(gold_mine_power)
		gold_mine_price.timesEquals(1.2)
		gold_mine_count += 1
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%s needed.[/center]" % [gold_mine_price.minus(coins).toMetricSymbol()]
		$Canvas/Notification/ColorRect.visible = true;
	pass

func _on_diamond_mine_pressed():
	if coins.minus(diamond_mine_price).isPositive() and coins.isGreaterThanOrEqualTo(diamond_mine_price):
		coins = Big.subtract(coins,diamond_mine_price)
		cps.plusEquals(diamond_mine_power)
		diamond_mine_price.timesEquals(1.2)
		diamond_mine_count += 1
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%s needed.[/center]" % [diamond_mine_price.minus(coins).toMetricSymbol()]
		$Canvas/Notification/ColorRect.visible = true;
	pass

func _on_delivery_service_pressed():
	if coins.minus(delivery_service_price).isPositive() and coins.isGreaterThanOrEqualTo(delivery_service_price):
		coins = Big.subtract(coins,delivery_service_price)
		cps.plusEquals(delivery_service_power)
		delivery_service_price.timesEquals(1.2)
		delivery_service_count += 1
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%s needed.[/center]" % [delivery_service_price.minus(coins).toMetricSymbol()]
		$Canvas/Notification/ColorRect.visible = true;
	pass
