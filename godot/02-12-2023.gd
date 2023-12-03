extends Control

@onready var Menu = $Menu
@onready var GamePlay = $GamePlay
@onready var Options = $Options
@onready var Video = $Video
@onready var Audio = $Audio
@onready var Credits = $Credits
@onready var Gui = $Gui
@onready var FpsCheck = %FpsCheck
@onready var LanguageOptions = %LanguageOptions
@onready var BrightnessSlider = %BrightnessSlider
@onready var ShadowCheck = %ShadowCheck
@onready var ReflectionCheck = %ReflectionCheck
@onready var MasterSlider = %MasterSlider
@onready var MusicSlider = %MusicSlider
@onready var SfxSlider = %SfxSlider

var UserPref : UserPreferences
var BrightnessPercent : Label
var MasterPercent : Label
var MusicPercent : Label
var SfxPercent : Label

func _ready():
	UserPref = UserPreferences.load_or_create()
	if BrightnessSlider:
		BrightnessSlider.value = UserPref.BrightnessVideoSlider
	if ShadowCheck:
		ShadowCheck.button_pressed = UserPref.ShadowVideoCheck
	if ReflectionCheck:
		ReflectionCheck.button_pressed = UserPref.ReflectionVideoCheck	
	if MasterSlider:
		MasterSlider.value = UserPref.MasterAudioSlider
	if MusicSlider:
		MusicSlider.value = UserPref.MusicAudioSlider
	if SfxSlider:
		SfxSlider.value = UserPref.SfxAudioSlider
	if FpsCheck:
		FpsCheck.button_pressed = UserPref.FpsGameplayCheck
	if LanguageOptions:
		var i = UserPref.LanguageGameplayOptions
		LanguageOptions.selected = i
		language(i)
	
	BrightnessPercent = %BrightnessPercen
	MasterPercent = %MasterPercen
	MusicPercent = %MusicPercen
	SfxPercent = %SfxPercen

func _process(_delta):
	BrightnessPercent.text = str(int(BrightnessSlider.value)) + "%"
	MasterPercent.text = str(int(MasterSlider.value)) + "%"
	MusicPercent.text = str(int(MusicSlider.value)) + "%"
	SfxPercent.text = str(int(SfxSlider.value)) + "%"

func show_hide(a, b):
	a.show()
	b.hide()

func language(i):
	var v = ""
	if i == 0:
		v = "en"
	elif i == 1:
		v = "id"
	TranslationServer.set_locale(v)	

#region MainMenu
func _on_start_pressed():
	pass

func _on_options_pressed():
	show_hide(Options, Menu)

func _on_credits_pressed():
	show_hide(Credits, Menu)

func _on_exit_pressed():
	get_tree().quit()
#endregion
#region Options
func _on_game_play_pressed():
	show_hide(GamePlay, Options)

func _on_video_pressed():
	show_hide(Video, Options)

func _on_audio_pressed():
	show_hide(Audio, Options)

func _on_gui_pressed():
	show_hide(Gui, Options)

func _on_options_back_pressed():
	show_hide(Menu, Options)
#endregion
#region Gameplay
func _on_fps_check_toggled(boolean):
	UserPref.FpsGameplayCheck = boolean
	UserPref.save()
		
func _on_language_options_item_selected(i):
	language(i)
	UserPref.LanguageGameplayOptions = i
	UserPref.save()
	
func _on_game_play_back_pressed():
	show_hide(Options, GamePlay)
#endregion
#region Video
func _on_brightness_slider_value_changed(v):
	if UserPref:
		UserPref.BrightnessVideoSlider = v
		UserPref.save()

func _on_shadow_check_toggled(boolean):
	if UserPref:
		UserPref.ShadowVideoCheck = boolean
		UserPref.save()
	
func _on_reflection_check_toggled(boolean):
	if UserPref:
		UserPref.ReflectionVideoCheck = boolean
		UserPref.save()
	
func _on_video_back_pressed():
	show_hide(Options, Video)
#endregion
#region Audio
func _on_master_slider_value_changed(v):
	if UserPref:
		UserPref.MasterAudioSlider = v
		UserPref.save()
		
func _on_music_slider_value_changed(v):
	if UserPref:
		UserPref.MusicAudioSlider = v
		UserPref.save()

func _on_sfx_slider_value_changed(v):
	if UserPref:
		UserPref.SfxAudioSlider = v
		UserPref.save()

func _on_audio_back_pressed():
	show_hide(Options, Audio)
#endregion
#region Ui
func _on_gui_back_pressed():
	show_hide(Options, Gui)
#endregion
#region Credits
func _on_credits_back_pressed():
	show_hide(Menu, Credits)
#endregion
