extends Node2D

var coins = Big.new(0.001)
var cps = Big.new(0)
var click_power = Big.new(1,0)
var cursor_price = Big.new(1,2)

var hand_price = Big.new(15)
var hand_power = Big.new(0.1)

var pickaxe_price = Big.new(1,2)
var pickaxe_power = Big.new(1)

var miner_price = Big.new(11,2)
var miner_power = Big.new(8)

var drill_price = Big.new(12,3)
var drill_power = Big.new(47)

var stone_mine_price = Big.new(13,3)
var stone_mine_power = Big.new(260)

var coal_mine_price = Big.new(14,5)
var coal_mine_power = Big.new(14,2)

var iron_mine_price = Big.new(20,6)
var iron_mine_power = Big.new(78,2)

var gold_mine_price = Big.new(33,7)
var gold_mine_power = Big.new(44,3)

var diamond_mine_price = Big.new(51,8)
var diamond_mine_power = Big.new(26,4)

var delivery_service_price = Big.new(75,9)
var delivery_service_power = Big.new(16,5)

var wizard_price = Big.new(1,12)
var wizard_power = Big.new(1,7)

var portal_price = Big.new(14,12)
var portal_power = Big.new(65,6)

var wishing_well_price = Big.new(17,13)
var wishing_well_power = Big.new(43,7)

var particle_accelerator_price = Big.new(21,14)
var particle_accelerator_power = Big.new(29,8)

var terminal_price = Big.new(31,16)
var terminal_power = Big.new(15,10)

func _ready():
	Big.setSmallDecimals(1)
	Big.setThousandDecimals(2)
	Big.setBigDecimals(3)
	$Canvas/ClickingRect/RichTextLabel.text =  "[center]%s coins
%s cps[/center]" % [coins.toMetricSymbol(), cps.toMetricSymbol()]
	pass
 
func _process(delta):
# Coin system
	coins.plusEquals(cps.times(delta))
	$Canvas/ClickingRect/RichTextLabel.text = "[center]%s coins
%s cps[/center]" % [coins.toMetricSymbol(), cps.toMetricSymbol()]

# Cursor upgrade
	$Canvas/ScrollContainer/Control/cursor.text = "2x click power
%s coins" % [cursor_price.toMetricSymbol()]

# Hand button
	if coins.isGreaterThanOrEqualTo(hand_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/hand.visible = true
	if coins.isGreaterThanOrEqualTo(hand_price):
		$Canvas/ScrollContainer/Control/hand.disabled = false
	else:
		$Canvas/ScrollContainer/Control/hand.disabled = true
	$Canvas/ScrollContainer/Control/hand.text = "Hand | %s cps
%s coins" % [hand_power.toMetricSymbol(), hand_price.toMetricSymbol()]

# Pickaxe button
	if coins.isGreaterThanOrEqualTo(pickaxe_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/pickaxe.visible = true
	if coins.isGreaterThanOrEqualTo(pickaxe_price):
		$Canvas/ScrollContainer/Control/pickaxe.disabled = false
	else:
		$Canvas/ScrollContainer/Control/pickaxe.disabled = true
	$Canvas/ScrollContainer/Control/pickaxe.text = "Pickaxe | %s cps
%s coins" % [pickaxe_power.toMetricSymbol(), pickaxe_price.toMetricSymbol()]
	
# Miner button
	if coins.isGreaterThanOrEqualTo(miner_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/miner.visible = true
	if coins.isGreaterThanOrEqualTo(miner_price):
		$Canvas/ScrollContainer/Control/miner.disabled = false
	else:
		$Canvas/ScrollContainer/Control/miner.disabled = true
	$Canvas/ScrollContainer/Control/miner.text = "Miner | %s cps
%s coins" % [miner_power.toMetricSymbol(), miner_price.toMetricSymbol()]

# Drill button
	if coins.isGreaterThanOrEqualTo(drill_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/drill.visible = true
	if coins.isGreaterThanOrEqualTo(drill_price):
		$Canvas/ScrollContainer/Control/drill.disabled = false
	else:
		$Canvas/ScrollContainer/Control/drill.disabled = true
	$Canvas/ScrollContainer/Control/drill.text = "Drill | %s cps
%s coins" % [drill_power.toMetricSymbol(), drill_price.toMetricSymbol()]
# stone_mine button
	if coins.isGreaterThanOrEqualTo(stone_mine_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/stone_mine.visible = true
	if coins.isGreaterThanOrEqualTo(stone_mine_price):
		$Canvas/ScrollContainer/Control/stone_mine.disabled = false
	else:
		$Canvas/ScrollContainer/Control/stone_mine.disabled = true
	$Canvas/ScrollContainer/Control/stone_mine.text = "Stone mine | %s cps
%s coins" % [stone_mine_power.toMetricSymbol(), stone_mine_price.toMetricSymbol()]
# coal_mine button
	if coins.isGreaterThanOrEqualTo(coal_mine_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/coal_mine.visible = true
	if coins.isGreaterThanOrEqualTo(coal_mine_price):
		$Canvas/ScrollContainer/Control/coal_mine.disabled = false
	else:
		$Canvas/ScrollContainer/Control/coal_mine.disabled = true
	$Canvas/ScrollContainer/Control/coal_mine.text = "Coal mine | %s cps
%s coins" % [coal_mine_power.toMetricSymbol(), coal_mine_price.toMetricSymbol()]

# iron_mine button
	if coins.isGreaterThanOrEqualTo(iron_mine_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/iron_mine.visible = true
	if coins.isGreaterThanOrEqualTo(iron_mine_price):
		$Canvas/ScrollContainer/Control/iron_mine.disabled = false
	else:
		$Canvas/ScrollContainer/Control/iron_mine.disabled = true
	$Canvas/ScrollContainer/Control/iron_mine.text = "Iron mine | %s cps
%s coins" % [iron_mine_power.toMetricSymbol(), iron_mine_price.toMetricSymbol()]
# gold_mine button
	if coins.isGreaterThanOrEqualTo(gold_mine_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/gold_mine.visible = true
	if coins.isGreaterThanOrEqualTo(gold_mine_price):
		$Canvas/ScrollContainer/Control/gold_mine.disabled = false
	else:
		$Canvas/ScrollContainer/Control/gold_mine.disabled = true
	$Canvas/ScrollContainer/Control/gold_mine.text = "Gold mine | %s cps
%s coins" % [gold_mine_power.toMetricSymbol(), gold_mine_price.toMetricSymbol()]
# diamond_mine button
	if coins.isGreaterThanOrEqualTo(diamond_mine_price.dividedBy(100).times(80)):
		$Canvas/ScrollContainer/Control/diamond_mine.visible = true
	if coins.isGreaterThanOrEqualTo(diamond_mine_price):
		$Canvas/ScrollContainer/Control/diamond_mine.disabled = false
	else:
		$Canvas/ScrollContainer/Control/diamond_mine.disabled = true
	$Canvas/ScrollContainer/Control/diamond_mine.text = "Diamond mine | %s cps
%s coins" % [diamond_mine_power.toMetricSymbol(), diamond_mine_price.toMetricSymbol()]
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
		cursor_price.timesEquals(10)
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
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%s needed.[/center]" % [diamond_mine_price.minus(coins).toMetricSymbol()]
		$Canvas/Notification/ColorRect.visible = true;
	pass
