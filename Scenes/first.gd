extends Node2D

var coins = 0
var cps = 0
var clickPower = 10000000


var handPower = 5
var handPrice = 100

var pickaxePower = 50
var pickaxePrice = 1000

var minerPower = 500
var minerPrice = 1000000

#var big = Big.new(12345,12)

func _ready():
	$Canvas/ClickingRect/RichTextLabel.text =  "[center]%d coins
%d cps[/center]" % [coins, cps]
	pass
 
func _process(delta):
	# Coin system
	coins += cps * delta
	$Canvas/ClickingRect/RichTextLabel.text = "[center]%d coins
%s cps[/center]" % [coins, cps]

# Hand button
	if coins >= handPrice * 0.8:
		$Canvas/ScrollContainer/Control/HandBtn.visible = true

	if handPrice < 1000:
		$Canvas/ScrollContainer/Control/HandBtn.text = "Hand | %.1f coins
%d cps" % [handPrice, handPower]
	elif handPrice >=1000 and handPrice < 1000000:
		$Canvas/ScrollContainer/Control/HandBtn.text = "Hand | %.1fk coins
%d cps" % [handPrice / 1000, handPower]
	elif handPrice >=1000000 and handPrice < 1000000000:
			$Canvas/ScrollContainer/Control/HandBtn.text = "Hand | %.1fM coins
	%d cps" % [handPrice / 1000000, handPower]
	elif handPrice >=1000000000 and handPrice < 1000000000000:
		$Canvas/ScrollContainer/Control/HandBtn.text = "Hand | %.1fB coins
%d cps" % [handPrice / 1000000000, handPower]
	elif handPrice >=1000000000000 and handPrice < 1000000000000000:
		$Canvas/ScrollContainer/Control/HandBtn.text = "Hand | %.1fT coins
%d cps" % [handPrice / 1000000000000, handPower]
	elif handPrice >=1000000000000000 and handPrice < 1000000000000000000:
		$Canvas/ScrollContainer/Control/HandBtn.text = "Hand | %.1fQd coins
%d cps" % [handPrice / 1000000000000000, handPower]

# Pickaxe button
	if coins >= pickaxePrice * 0.8:
		$Canvas/ScrollContainer/Control/PickaxeBtn.visible = true

	if pickaxePrice < 1000:
		$Canvas/ScrollContainer/Control/PickaxeBtn.text = "Pickaxe | %.1f coins
%d cps" % [pickaxePrice, pickaxePower]
	elif pickaxePrice >=1000 and pickaxePrice < 1000000:
		$Canvas/ScrollContainer/Control/PickaxeBtn.text = "Pickaxe | %.1fk coins
%d cps" % [pickaxePrice / 1000, pickaxePower]
	elif pickaxePrice >=1000000 and pickaxePrice < 1000000000:
			$Canvas/ScrollContainer/Control/PickaxeBtn.text = "Pickaxe | %.1fM coins
%d cps" % [pickaxePrice / 1000000, pickaxePower]
	elif pickaxePrice >=1000000000 and pickaxePrice < 1000000000000:
			$Canvas/ScrollContainer/Control/PickaxeBtn.text = "Pickaxe | %.1fB coins
%d cps" % [pickaxePrice / 1000000000, pickaxePower]
	elif pickaxePrice >=1000000000000 and pickaxePrice < 1000000000000000:
			$Canvas/ScrollContainer/Control/PickaxeBtn.text = "Pickaxe | %.1fT coins
%d cps" % [pickaxePrice / 1000000000000, pickaxePower]
	elif pickaxePrice >=1000000000000000 and pickaxePrice < 1000000000000000000:
			$Canvas/ScrollContainer/Control/PickaxeBtn.text = "Pickaxe | %.1fQd coins
%d cps" % [pickaxePrice / 1000000000000000, pickaxePower]
	pass
	
# Miner button
	if coins >= pickaxePrice * 0.8:
		$Canvas/ScrollContainer/Control/MinerBtn.visible = true
		
	if minerPrice < 1000:
			$Canvas/ScrollContainer/Control/MinerBtn.text = "Miner | %.1f coins
	%d cps" % [minerPrice, minerPower]

func _on_button_3_pressed():
	coins += clickPower
	$Canvas/ClickingRect/RichTextLabel.text = "[center]%d coins
%d cps[/center]" % [coins, cps]
	pass

func _on_color_rect_mouse_exited():
	$Canvas/Notification.text = ""
	$Canvas/Notification/ColorRect.visible = false;
	pass

func _on_hand_btn_pressed():
	if coins >= handPrice:
		coins-= handPrice
		cps += handPower 
		handPrice *= 1.1
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%d needed.[/center]" % [handPrice]
		$Canvas/Notification/ColorRect.visible = true;
	pass

func _on_pickaxe_btn_pressed():
	if coins >= pickaxePrice:
		coins-= pickaxePrice
		cps += pickaxePower 
		pickaxePrice *= 1.1
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%d needed.[/center]" % [pickaxePrice]
		$Canvas/Notification/ColorRect.visible = true;
	pass


func _on_miner_btn_pressed():
	if coins >= minerPrice:
		coins-= minerPrice
		cps += minerPower 
		minerPrice *= 1.1
	else:
		$Canvas/Notification.text = "[center]Not enough money!
%d needed.[/center]" % [minerPrice]
		$Canvas/Notification/ColorRect.visible = true;
	pass
