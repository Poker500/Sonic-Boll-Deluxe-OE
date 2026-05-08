









𝗗ʘ𝞰❜ʈ 𝚰𝓲𝗄𝘦 ⍴𝚰Ƌ𝘆𝓲𝞰𝗴 ᴯ𝘆 ʈ𝐡𝘦 𝝘𝙪𝚰𝘦ᣵ?























































#define data
name="An Ordinary Sonic Boll Extension"
desc=""

#define create
extdir=global.workdir+"mods\extensions\"

global.ordinary_moddesc=sprite_add(extdir+"An Ordinary Sonic Boll Extension\graphics\spr_moddesc.png",0,0,0,0,0)
global.ordinary_spr_selectStatic=sprite_add(extdir+"An Ordinary Sonic Boll Extension\graphics\spr_selectStatic.png",0,0,0,0,0)
global.ordinary_spr_intromsg=sprite_add(extdir+"An Ordinary Sonic Boll Extension\graphics\spr_intromsg.png",0,0,0,0,0)
global.ordinary_spr_intromsg2=sprite_add(extdir+"An Ordinary Sonic Boll Extension\graphics\spr_intromsg2.png",0,0,0,0,0)
global.ordinary_spr_redportalring=sprite_add(extdir+"An Ordinary Sonic Boll Extension\graphics\spr_redportalring.png",0,1,0,24,24)
global.ordinary_spr_crimsonsheetlite=sprite_add(extdir+"An Ordinary Sonic Boll Extension\spr_crimsonsheetlite.png",0,1,0,16,16)

global.ordinary_x_sheet=sprite_add(extdir+"An Ordinary Sonic Boll Extension\x-basic.png",0,1,0,0,0)

replacesound("ordinary_sfx_kefka",extdir+"An Ordinary Sonic Boll Extension\sfx\sfx_kefka.wav")
replacesound("ordinary_sfx_static",extdir+"An Ordinary Sonic Boll Extension\sfx\sfx_static.wav")
replacesound("ordinary_sfx_scream",extdir+"An Ordinary Sonic Boll Extension\sfx\sfx_scream.wav")
replacesound("ordinary_sfx_msgAppear",extdir+"An Ordinary Sonic Boll Extension\sfx\sfx_msgAppear.wav")
replacesound("ordinary_sfx_sillyalarm",extdir+"An Ordinary Sonic Boll Extension\sfx\sfx_sillyalarm.wav")
replacesound("ordinary_sfx_sillyexplosion.wav",extdir+"An Ordinary Sonic Boll Extension\sfx\sfx_sillyexplosion.wav")
replacesound("ordinary_sfx_exeAppear",extdir+"An Ordinary Sonic Boll Extension\sfx\sfx_exeAppear.wav")

var strmhandle;
strmhandle=FMODSoundAdd(extdir+"An Ordinary Sonic Boll Extension\sillychase.ogg",2) ds_map_add(globalmanager.mushandles,"ordinary_sillychase" ,strmhandle) FMODSoundSetGroup(strmhandle,1) 

//sound("ordinary_sfx_kefka")

//instance_create(view_xview[0],view_yview[0],ordinary_sonicexe) //for copy-pasting

if ordinary_redportalring=0 {
	globalvar ordinary_redportalring;
	ordinary_redportalring=object_add() 
}

object_set_visible(ordinary_redportalring, 1)
object_set_sprite(ordinary_redportalring,spr_bobradius)


object_setevent(ordinary_redportalring, ev_step, ev_step_normal, "
mask_index=spr_bobradius
if instance_place(x,y,player) {instance_destroy() instance_create(x,y,ordinary_sonicexe) settings('ordinary_firstring',1)}
")

object_setevent(ordinary_redportalring, ev_draw, 0, "

redring_counter+=1
if redring_counter mod 8 = 1 redring_anim+=1
redring_anim=wrap_val(redring_anim, 0,  3)



draw_sprite_part(global.ordinary_spr_redportalring,0,0+(48*redring_anim),0,48,48,x,y)

")

if ordinary_sonicexe=0 {
	globalvar ordinary_sonicexe;
	ordinary_sonicexe=object_add() 
}
object_set_visible(ordinary_sonicexe, 1)

{ ///sonicexe_create.gml

ordinary_compilestring=""
file = string(extdir + "An Ordinary Sonic Boll Extension\script\sonicexe_create.gml");  
	
for (f=file_text_open_read(file);!file_text_eof(f);file_text_readln(f))  { 
	ordinary_compilestring+=read_text(f)+lf 
}  
close_text(f)		
object_setevent(ordinary_sonicexe, ev_create, 0, ordinary_compilestring)
ordinary_compilestring=""
} ///

{ ///sonicexe_step.gml

ordinary_compilestring=""
file = string(extdir + "An Ordinary Sonic Boll Extension\script\sonicexe_step.gml");  
	
for (f=file_text_open_read(file);!file_text_eof(f);file_text_readln(f))  { 
	ordinary_compilestring+=read_text(f)+lf 
}  
close_text(f)		
object_setevent(ordinary_sonicexe, ev_step, ev_step_normal, ordinary_compilestring)
ordinary_compilestring=""
} ///

{ ///sonicexe_step_end.gml

ordinary_compilestring=""
file = string(extdir + "An Ordinary Sonic Boll Extension\script\sonicexe_step_end.gml");  
	
for (f=file_text_open_read(file);!file_text_eof(f);file_text_readln(f))  { 
	ordinary_compilestring+=read_text(f)+lf 
}  
close_text(f)		
object_setevent(ordinary_sonicexe, ev_step, ev_step_end, ordinary_compilestring)
ordinary_compilestring=""
} ///

{ ///sonicexe_draw.gml

ordinary_compilestring=""
file = string(extdir + "An Ordinary Sonic Boll Extension\script\sonicexe_draw.gml");  
	
for (f=file_text_open_read(file);!file_text_eof(f);file_text_readln(f))  { 
	ordinary_compilestring+=read_text(f)+lf 
}  
close_text(f)		
object_setevent(ordinary_sonicexe, ev_draw, 0, ordinary_compilestring)
ordinary_compilestring=""
} ///

if ordinary_sonicexe_afterimage=0 {
	globalvar ordinary_sonicexe_afterimage;
	ordinary_sonicexe_afterimage=object_add() 
}
object_set_visible(ordinary_sonicexe_afterimage, 1)

object_setevent(ordinary_sonicexe_afterimage, ev_create, 0, '
	t=0
	alpha=0.5
')

object_setevent(ordinary_sonicexe_afterimage, ev_alarm, 0, 'instance_destroy()')

//object_setevent(ordinary_sonicexe, ev_step, ev_step_normal, '')
object_setevent(ordinary_sonicexe_afterimage, ev_draw, 0, 'draw_sprite_part_ext(global.ordinary_x_sheet,0,8,8+48*sid,47,47,floor(x-24*xsc),floor(y-28),xsc,1,blend,alpha)')


object_clearevent(languagepicker, ev_other, ev_user1)
object_setevent(languagepicker, ev_other, ev_user1,'
	if settings("ordinary_seenintroduction") {
		instance_destroy()
		visible=0
		instance_create(0,0,introctrl) 
		exit
	}
	
	//now this parts funny. temporarily, ill pull dev names based on their time attack icon.
	switch (settings("Hi_im_dev")) {
		case 0: {funnyname="FRIEND" break;} 
		case 1: {funnyname="-S-" break;}
		case 2: {funnyname="Nekonesse" break;}
		case 3: {funnyname="DaJumpJump" break;}
		case 4: {funnyname="GoldenB4" break;}
		case 5: {funnyname="MosterSMTH" break;}
		case 6: {funnyname="Flareguy" break;}
		case 7: {funnyname="CowboyJoseph64" break;}
		case 8: {funnyname="ArcanePool" break;}
		case 9: {funnyname="Christian32307" break;}
		case 10: {funnyname="Emília" break;}
		case 11: {funnyname="Sylve" break;}
		case 12: {funnyname="SuperSani24" break;}
		case 13: {funnyname="CyanideJam" break;}
		case 14: {funnyname="BonesM" break;}
		case 15: {funnyname="Myllie" break;}
		case 16: {funnyname="Sunny" break;}
		case 17: {funnyname="WildCard78" break;}
		case 18: {funnyname="Azumadeline" break;}
	}
	
	
	ordinary_goevil=1
	FMODAllStop()
')


object_clearevent(languagepicker, ev_step, ev_step_end)
object_setevent(languagepicker, ev_step, ev_step_end,'

if ordinary_goevil {
	input_get(-1)
	input_keystates()
	if !stopevil eviltimer+=1
	
	if eviltimer=2 {extdir=global.workdir+"mods\extensions\" replacesound("ordinary_sfx_static",extdir+"An Ordinary Sonic Boll Extension\sfx_static.wav") sound("ordinary_sfx_static")}
	if eviltimer=62 {soundstop("ordinary_sfx_static")}

	if eviltimer=77 {sound("ordinary_sfx_static")}
	if eviltimer=107 {soundstop("ordinary_sfx_static")}
	
	if eviltimer=115 {sound("ordinary_sfx_static")}
	if eviltimer=123 {soundstop("ordinary_sfx_static")}
	
	if eviltimer=276 {
		extdir=global.workdir+"mods\extensions\" replacesound("ordinary_sfx_msgAppear",extdir+"An Ordinary Sonic Boll Extension\sfx_msgAppear.wav") sound("ordinary_sfx_msgAppear")
		eviltimer+=1 //cant have this sound keep playing
		stopevil=1
		alphago=1
		set_caption("SONIC")
	}
	
	if eviltimer=336 {
		sound("ordinary_sfx_msgAppear")
		eviltimer+=1
		stopevil=1
		alphago=1
	}
	
	if eviltimer=396 {
		sound("ordinary_sfx_msgAppear")
		eviltimer+=1
		stopevil=1
		alphago=1
	}
	
	if eviltimer=398 {
		replacesound("ordinary_sfx_kefka",extdir+"An Ordinary Sonic Boll Extension\sfx_kefka.wav") sound("ordinary_sfx_kefka")
	}
	
	if eviltimer=558 {
		settings("ordinary_seenintroduction",1)
		set_caption(gametitle)
		instance_destroy()
		visible=0
		instance_create(0,0,introctrl) 
	}
	
	if alphago {a=approach_val(a,1,0.05)}
	
	if a=1 && stopevil && (abut || sbut) {alphago=0 a=0 stopevil=0}
	
}


')

global.gamemode="" //omg bruh

#define step

if instance_exists(languagepicker) {
	with (languagepicker) if ordinary_goevil {
		if (eviltimer>2 && eviltimer<276) {
			ordinary_glitch_text=string(gametitle) 
			if (irandom(3) == 0) {  
				repeat (irandom(3) + 1)  {   
					ordinary_glitch_text = string_delete(ordinary_glitch_text, irandom(string_length(ordinary_glitch_text)), 1);   
					ordinary_glitch_text = string_insert(choose ("!", "@", "&", "$", "%"), ordinary_glitch_text, irandom(string_length(ordinary_glitch_text)));  
				}	 
			} 
			set_caption(string(ordinary_glitch_text))
			
		}
	}
}

if room!=game || room=change || instance_exists(changectrl) spawned_ring=0
if room=game && instance_exists(gamemanager) && !spawned_ring && !instance_exists(ordinary_redportalring) {
	 if global.levelskin=0 && string(gamemanager.roomname)=="World 1-1" && !settings("ordinary_firstring"){
		instance_create(256,348,ordinary_redportalring)
		spawned_ring=1
	 } else {
		instance_create(spawner.x-64,spawner.y-64,ordinary_redportalring)
		spawned_ring=1
	 }


}

//console commands
if instance_exists(message) && (string(message.str)=="Unknown command") {
	if (global.lastcmd="exereload" || global.lastcmd="exerel") {
		var f;
		with (message) instance_destroy()
		soundstop("systemreturn")
		sound("systemgo")
		
		object_clearevent(ordinary_sonicexe, ev_create, 0)
		object_clearevent(ordinary_sonicexe, ev_step, ev_step_normal)
		object_clearevent(ordinary_sonicexe, ev_step, ev_step_end)
		object_clearevent(ordinary_sonicexe, ev_draw, 0)
		
		{ ///sonicexe_create.gml

		ordinary_compilestring=""
		file = string(extdir + "An Ordinary Sonic Boll Extension\script\sonicexe_create.gml");  
			
		for (f=file_text_open_read(file);!file_text_eof(f);file_text_readln(f))  { 
			ordinary_compilestring+=file_text_read_string(f)+lf 
		}  
		close_text(f)		
		object_setevent(ordinary_sonicexe, ev_create, 0, ordinary_compilestring)
		ordinary_compilestring=""
		} ///

		{ ///sonicexe_step.gml

		ordinary_compilestring=""
		file = string(extdir + "An Ordinary Sonic Boll Extension\script\sonicexe_step.gml");  
			
		for (f=file_text_open_read(file);!file_text_eof(f);file_text_readln(f))  { 
			ordinary_compilestring+=file_text_read_string(f)+lf 
		}  
		close_text(f)		
		object_setevent(ordinary_sonicexe, ev_step, ev_step_normal, ordinary_compilestring)
		ordinary_compilestring=""
		} ///

		{ ///sonicexe_step_end.gml

		ordinary_compilestring=""
		file = string(extdir + "An Ordinary Sonic Boll Extension\script\sonicexe_step_end.gml");  
			
		for (f=file_text_open_read(file);!file_text_eof(f);file_text_readln(f))  { 
			ordinary_compilestring+=file_text_read_string(f)+lf 
		}  
		close_text(f)		
		object_setevent(ordinary_sonicexe, ev_step, ev_step_end, ordinary_compilestring)
		ordinary_compilestring=""
		} ///

		{ ///sonicexe_draw.gml

		ordinary_compilestring=""
		file = string(extdir + "An Ordinary Sonic Boll Extension\script\sonicexe_draw.gml");  
			
		for (f=file_text_open_read(file);!file_text_eof(f);file_text_readln(f))  { 
			ordinary_compilestring+=file_text_read_string(f)+lf 
		}  
		close_text(f)		
		object_setevent(ordinary_sonicexe, ev_draw, 0, ordinary_compilestring)
		ordinary_compilestring=""
		} ///
	
	}


}

#define draw

if instance_exists(languagepicker) {
	with (languagepicker) if ordinary_goevil {
		if ((eviltimer>2 && eviltimer<62) || (eviltimer>77 && eviltimer<107) || (eviltimer>115 && eviltimer<123) ) {
			draw_sprite_part_ext(global.ordinary_spr_selectStatic,0,160*(eviltimer mod 3),0,160,72,0,0,2.5,3.2,$ffffff,1)
		}
		if eviltimer=277 {
			draw_sprite_ext(global.ordinary_spr_intromsg,0,0,0,1,1,0,$ffffff,a)
		}
		if eviltimer=337 {
			draw_sprite_ext(global.ordinary_spr_intromsg2,0,0,0,1,1,0,$ffffff,a)
		}
		
		if eviltimer=397 {
			global.halign=1
			draw_systext(x,y-16,"MEET ME AT WHICH BLOOD DRAWS. ##I'LL BE WAITING, ##"+string_upper(funnyname)+".",$ffffff,a) 
			global.halign=0
		}
	}
}

if (room=modloader && modtyper.visible) {
		if (string(modtyper.name)=="An Ordinary Sonic Boll Extension" && instance_exists(moddesc)) {
			draw_set_alpha(moddesc.alpha)
			draw_sprite(global.ordinary_moddesc,0,moddesc.x,moddesc.y)
			draw_set_alpha(1)
		}
	}
	
	
