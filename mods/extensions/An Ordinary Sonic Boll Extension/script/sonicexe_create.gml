//sonic.exe

alpha=1
extdir=global.workdir+"mods\extensions\"
global.ordinary_x_sheet=sprite_add(extdir+"An Ordinary Sonic Boll Extension\x-basic.png",0,1,0,0,0)
global.ordinary_spr_selectStatic=sprite_add(extdir+"An Ordinary Sonic Boll Extension\graphics\spr_selectStatic.png",0,0,0,0,0)
replacesound("ordinary_sfx_scream",extdir+"An Ordinary Sonic Boll Extension\sfx\sfx_scream.wav")
replacesound("ordinary_sfx_kefka",extdir+"An Ordinary Sonic Boll Extension\sfx\sfx_kefka.wav")
replacesound("ordinary_sfx_exeAppear",extdir+"An Ordinary Sonic Boll Extension\sfx\sfx_exeAppear.wav")

//sound("ordinary_sfx_kefka")

sheet=global.ordinary_x_sheet
sprw=48
sprh=48

state="ringspawn"

if !settings("ordinary_firstring") {

	replacesound("ordinary_sfx_sillyalarm",extdir+"An Ordinary Sonic Boll Extension\sfx\sfx_sillyalarm.wav")
	replacesound("ordinary_sfx_sillychase",extdir+"An Ordinary Sonic Boll Extension\sfx\sfx_sillychase.wav")
	replacesound("ordinary_sfx_sillyexplosion.wav",extdir+"An Ordinary Sonic Boll Extension\sfx\sfx_sillyexplosion.wav")
	
	var strmhandle;
	strmhandle=FMODSoundAdd(extdir+"An Ordinary Sonic Boll Extension\sillychase.ogg",2) ds_map_add(globalmanager.mushandles,"ordinary_sillychase" ,strmhandle) FMODSoundSetGroup(strmhandle,1) 

	ins=instance_create(0,0,code) 
	with (ins) { 
		text="depth=-1 tick+=1 v=abs(sin(tick/20)/5)+0.1 color=merge_color(merge_color(0,$ffff00,min(1,(1-v)*2)),$000000,max(0,((1-v)-0.5)*2)) draw_set_blend_mode(bm_subtract) rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,color,0.5) draw_set_blend_mode(bm_add) rect(view_xview[view_current]-1,view_yview[view_current]-1,view_wview[view_current]+2,view_hview[view_current]+2,0,1) draw_set_blend_mode(0)"
		visible=1
		run="draw"
		event_user(0)
	} 
	
	sound("ordinary_sfx_sillyalarm")
	mus_play("ordinary_sillychase")
}