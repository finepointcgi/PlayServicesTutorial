extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var play_service

# Called when the node enters the scene tree for the first time.
func _ready():
	if Engine.has_singleton("GodotPlayGamesServices"):
		play_service = Engine.get_singleton("GodotPlayGamesServices")
		
		play_service.initWithSavedGames(true, "test", true, true, "174112276431-b3g16o1qlvp527hknd215uf6qc3r4blt.apps.googleusercontent.com")
		
		play_service.connect("_on_sign_in_success",self,"_on_sign_in_success")
		play_service.connect("_on_sign_in_failed",self,"_on_sign_in_failed")
		play_service.connect("_on_achievement_unlocked",self,"_on_achievement_unlocked")
		play_service.connect("_on_achievement_unlocking_failed",self,"_on_achievement_unlocking_failed")
		play_service.connect("_on_achievement_incremented",self,"_on_achievement_incremented")
		play_service.connect("_on_achievement_incrementing_failed",self,"_on_achievement_incrementing_failed")
		play_service.connect("_on_achievement_revealed",self,"_on_achievement_revealed")
		play_service.connect("_on_achievement_revealing_failed",self,"_on_achievement_revealing_failed")
		play_service.connect("_on_achievement_info_loaded",self,"_on_achievement_info_loaded")
		play_service.connect("_on_achievement_info_load_failed",self,"_on_achievement_info_load_failed")
		play_service.connect("_on_leaderboard_score_submitted",self,"_on_leaderboard_score_submitted")
		play_service.connect("_on_leaderboard_score_submitting_failed",self,"_on_leaderboard_score_submitting_failed")
		play_service.connect("_on_event_submitted",self,"_on_event_submitted")
		play_service.connect("_on_event_submitted_failed",self,"_on_event_submitted_failed")
		play_service.connect("_on_events_loaded",self,"_on_events_loaded")
		play_service.connect("_on_events_empty",self,"_on_events_empty")
		play_service.connect("_on_events_loading_failed",self,"_on_events_loading_failed")
		play_service.connect("_on_player_stats_loaded",self,"_on_player_stats_loaded")
		play_service.connect("_on_player_stats_loading_failed",self,"_on_player_stats_loading_failed")
		play_service.connect("_on_player_info_loaded",self,"_on_player_info_loaded")
		play_service.connect("_on_player_info_loading_failed",self,"_on_player_info_loading_failed")
		play_service.connect("_on_game_saved_success",self,"_on_game_saved_success")
		play_service.connect("_on_game_saved_fail",self,"_on_game_saved_fail")
		play_service.connect("_on_game_load_fail",self,"_on_game_load_fail")
		play_service.connect("_on_game_load_success",self,"_on_game_load_success")
		play_service.connect("_on_create_new_snapshot",self,"_on_create_new_snapshot")
		
	pass # Replace with function body.

func _on_sign_in_success(userprofile):
	print(userprofile)
	
func _on_sign_in_failed(error):
	print("Error: " + str(error))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Login_button_down():
	play_service.signIn()
	pass # Replace with function body.


func _on_TestAchevement_button_down():
	play_service.unlockAchievement("CgkIz_-Zz4gFEAIQAg")
	pass # Replace with function body.

func _on_achievement_unlocked(id):
	print(id)

func _on_achievement_unlocking_failed(id):
	print(id)


func _on_IncAchevement_button_down():
	play_service.incrementAchievement("CgkIz_-Zz4gFEAIQAw", 1)
	pass # Replace with function body.

func _on_achievement_incremented(id):
	print("achievement " + id + " incremented")
	
func _on_achievement_incrementing_failed(id):
	print("achievement " + id + " incrementing failed")

func _on_RevealTestAchevement_button_down():
	play_service.revealAchievement("CgkIz_-Zz4gFEAIQBA")
	pass # Replace with function body.
	
func _on_achievement_revealed(id):
	print("Achevement Revealed " + id)
	
func _on_achievement_revealing_failed(id):
	print("Achevement Revealing failed" + id)


func _on_ShowAchevements_button_down():
	play_service.showAchievements()
	pass # Replace with function body.


func _on_LoadAchievementInfo_button_down():
	play_service.loadAchievementInfo(false)
	pass # Replace with function body.
	
func _on_achievement_info_loaded(achievements):
	print(achievements)

func _on_achievement_info_load_failed(id):
	print("achievement load failed: " + id)


func _on_ShowLeaderboard_button_down():
	play_service.showLeaderBoard("CgkIz_-Zz4gFEAIQBQ")
	pass # Replace with function body.


func _on_Submit_To_Leaderboard_button_down():
	play_service.submitLeaderBoardScore("CgkIz_-Zz4gFEAIQBQ", 55)
	pass # Replace with function body.
	
func _on_leaderboard_score_submitted(id):
	print("leaderboard submit success: " + id)
	
func _on_leaderboard_score_submitting_failed(id):
	print("leaderboard submit falied: " + id)


func _on_SubmitEvent_button_down():
	play_service.submitEvent("CgkIz_-Zz4gFEAIQBg", 11)
	pass # Replace with function body.

func _on_event_submitted(id):
	print("event submitted successfully: " + id)

func _on_event_submitted_failed(id):
	print("event submitted failed: " + id)

func _on_LoadEvent_button_down():
	play_service.loadEvents()
	#play_service.loadEventsByID(["CgkIz_-Zz4gFEAIQBg",""]) #multiple specific events
	pass # Replace with function body.
	
func _on_events_loaded(arraylist):
	print(arraylist)
	var events = parse_json(arraylist)
	
	for event in events:
		print(event)

func _on_events_empty():
	print("There are no events!")
	
func _on_events_loading_failed():
	print("Failed to load events!")


func _on_GetPlayerData_button_down():
	play_service.loadPlayerInfo()
	pass # Replace with function body.

func _on_player_info_loaded(info):
	var player = parse_json(info)
	print(player)
	var formatString = "Display Name: %s \n Name: %s \n Title: %s \n PlayerID: %s \n"
	var outputString = formatString % [player.display_name, player.name,player.title, player.player_id]
	$PlayerData.text = outputString
	
	var http_request= HTTPRequest.new()
	add_child(http_request)
	http_request.connect("request_completed",self,"_on_request_complete")
	var error = http_request.request(player.hi_res_image_url)
	if error != OK:
		print("Request Failed")
	pass

func _on_request_complete(result, responsecode,heads, body):
	var image = Image.new()
	var error = image.load_png_from_buffer(body)
	if error != OK:
		print("could not process data")
	var texture = ImageTexture.new()
	texture.create_from_image(image)
	$TextureRect.texture = texture
	
func _on_player_info_loading_failed():
	print("player info load failed")

func _on_player_stats_loaded(stats):
	var player = parse_json(stats)
	print(player)
	var formatString = "avg sessions length: %s \n Days Since Last Played: %s \n Number of Purchases %s \n Number of Sessions: %s "
	var outputString = formatString % [player.avg_session_length, player.days_last_played,player.purchases, player.sessions]
	$PlayerStats.text = outputString

func _on_player_stats_loading_failed():
	print("Player stats failed to load")

func _on_GetPlayerStats_button_down():
	play_service.loadPlayerStats(true)
	pass # Replace with function body.


func _on_ShowSnapshot_button_down():
	play_service.showSavedGames("Custom Title",true, true, 7)
	pass # Replace with function body.

func _on_create_new_snapshot(name):
	var data = {"name":"fp","health":"10"}
	play_service.saveSnapshot(name, to_json(data), "this is a test")

func _on_GetSnapshot_button_down():
	play_service.loadSnapshot("test")
	pass # Replace with function body.

func _on_game_load_success(data):
	var savedData = parse_json(data)
	print(data)
	var formatString = "Name: %s \n Health: %s "
	var outputString = formatString % [data.name, data.health]
	$"Saved Data".text = outputString

func _on_game_load_fail():
	print("Load Game Failed")

func _on_SaveSnapshot_button_down():
	var data = {"name":"fp","health":"10"}
	play_service.saveSnapshot("test",to_json(data), "this is a test")
	pass # Replace with function body.

func _on_game_saved_success():
	print("Successfully Saved Game")

func _on_game_saved_fail():
	print("Failed To Save Game")
