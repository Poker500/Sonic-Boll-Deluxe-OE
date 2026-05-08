///sonic.exe


global.check="" //checkpoint shaped sonic.exe: 

if state="ringspawn" {
	spawntick+=1
	if spawntick==1 {hspeed=2}
	if spawntick=90 {sound("ordinary_sfx_kefka")}
	
	if spawntick=240 {
		state="pursuit"
		spawntick=0 
	}
	
	hspeed=approach_val(hspeed,0,0.05)
}

if state="pursuit" {
	mytarget=nearestplayer()
	if abs(x-mytarget.x)<2 && abs(y-mytarget.y)<2 && !explode {
		with mytarget if !dead && !invincible() {
		hurtplayer("sonic.exe")
		//sound("ordinary_sfx_sillyexplosion")
		if dead {other.state="caughtplayer" other.caughtplayer=id if global.mplay<2 mus_stop()}
		//other.explode=dead
		hspeed=0
		vspeed=0
		}
		if mytarget.super mytarget.energy-=0.2
	}

	if !mytarget.dead {
		speed+=0.0125 
		//hmm
		playerrunstore=player.run player.run=1 
		speed=min(speed,mytarget.maxspd+(mytarget.maxspd*0.1)) 
		player.run=playerrunstore
		direction_previous=direction
		direction=point_direction(x,y,mytarget.x,mytarget.y)
																							//brooo
		if direction!=direction_previous && speed>0.1 && abs(direction-direction_previous)>14 && abs(direction-direction_previous)<180 {speed-=min(abs(direction-direction_previous)/18,2)}
	}

	if (speed>=3.5 && global.bgscroll mod 8 = 1) {
		with instance_create(x,y,ordinary_sonicexe_afterimage) {
			sheet=other.sheet
			xsc=other.xsc
			sid=other.sid
			blend=$0000ff
			depth=other.depth+1
			owner=other.id
			alarm[0]=16
		}
	}

	if explode {
		with instance_create(x+irandom_range(-32,32),y+irandom_range(-32,32),fballexplosion) {hspeed=irandom_range(-2,2) vspeed=irandom_range(-2,2)}
	}
}

if state="caughtplayer" {
	caughttick+=1
	if !preppedmyfood {
		speed=0 
		hspeed=0 vspeed=0
		visible=0
		with ordinary_sonicexe_afterimage instance_destroy()
		gamemanager.deathtimer=0
		gamemanager.hud_alpha[caughtplayer.p2]=0
		with caughtplayer {
			reset=0 //dumb kid
			soundstop(name+"die")
			x=xprevious
			y=yprevious
			visible=1
		}
		
		with charmdeath if owner=other.caughtplayer instance_destroy()
		preppedmyfood=1
	}
	if caughttick=120 {
		x=player.bbox_left-16 
		y=player.y
		visible=1
		sprite="caught"
		sound("ordinary_sfx_exeAppear")
	}
	
	if caughttick=240 {
		sprite="caughtkill"
		if global.mplay<2 gamemanager.deathtimer=1
		with caughtplayer {
			kek=instance_create(x,y,charmdeath)
			kek.shortsmallform=owner.shortsmallform
			playsfx(name+"die")
			if global.wanna reset=1 //dumb kid
	
			y=-verybignumber
			diedbysonicdotexe=1


			with (kek) {
				owner=other.id
				p2=owner.p2
				size=owner.size
				orig=owner
				xsc=esign(owner.hspeed,owner.xsc)
				sheets[size]=owner.sheets[owner.size]
				event="create"
				event_user(p2)
				charm_init()
				spriteswitch(1)
				if (playerskindat(slot,"3ddeath"+string(p2))) rotate=1
			}
		
		}
		sound("ordinary_sfx_scream")
	}
	
	if caughttick=300 && global.mplay>1 {
		state="pursuit"
		preppedmyfood=0
		caughttick=0
	}
	
}

if state="wait" {
	if !beganwait {
		speed=0
		sprite="flyidle"
		beganwait=1

	}
	waittargetx=view_xview[0]+32
	waittargety=view_yview[0]+32
	speed=0
	if (x!=waittargetx || y!=waittargety) move_towards_point(waittargetx,waittargety,1) xsc=1

}

with player if dead && diedbysonicdotexe && other.caughttick=0 {
	//dude what if i ran the camera on the exe
	
	var l,r,panl,panr,t,b,w,h,hw,bgl,bgr,i,memx,noy,cs;

	//if (settings("frameskip") && !fallbacky) {view_yview[p2]=viewy} 

	//if ((gamemanager.debugcamlock || overwritecam || alarm[0]!=-1 || dead) || (piped && !argument[0] && !finish) || (finish && posed && !c)) {
	//	gamemanager.shake[p2]=0
	//	exit
	//}                                                 
	getregion(other.x)

	i=id   
	w=400
	h=240
	hw=w/2
	noy=0
	l=0
	r=verybignumber
	t=0
	b=region.ky
	shim=0

	if (shim!=0) camspd=1
	camspd=(camspd*24+(1.5+abs(other.hspeed)+abs(hyperspeed)+abs(gm8exspd)+abs(other.x-(viewx+200))/16))/25
	//if (camspd<2) cs=0 else
	cs=camspd

	camwallr=0
	camwalll=0
	camwallt=0

	if (shim!=0) {
		panl=16*(sign(shim)=1)
		panr=-16*(sign(shim)=-1)
	}

	//perform camera collision
	with (camblock) if (!within(other.camcx,other.camcy,x,y,sprite_width,sprite_height)) {
		with (other) if (collision_rectangle(viewx+hw-204,viewy-4,viewx+hw+204,viewy+h+4,other.id,0,0)) {    
			if (camcy>=other.bbox_top && camcy<=other.bbox_bottom+1 && camcx<=other.x && other.left) {r=max(viewx+w-2,other.bbox_left)-panl  camwallr=(other.object_index=camblock)}
			if (camcy>=other.bbox_top && camcy<=other.bbox_bottom+1 && camcx>=other.x && other.right) {l=min(viewx+2,other.bbox_right+1)-panr camwalll=(other.object_index=camblock)}
			if (camcx>=other.bbox_left && camcx<=other.bbox_right+1 && camcy<=other.y && other.top) b=max(viewy+h-2,other.bbox_top)               
			if (camcx>=other.bbox_left && camcx<=other.bbox_right+1 && camcy>=other.y && other.bottom) {t=min(viewy+2,other.bbox_bottom+1) camwallt=(other.object_index=camblock)}
			if (x>=other.bbox_left && x<=other.bbox_right+1 && y>=other.bbox_top && y<=other.bbox_bottom+1) noy=1
		}
	}

	l=max(l,min(viewx-cs+panl,x-(160-128*max(shim=0,abs(shim)))))
	r=min(r,max(viewx+w+cs+panr,x+(160-128*max(shim=0,abs(shim)))))

	if (diggity) {
		with (flag) if (passed[other.p2]) {l=max(other.viewx,min(endstagex,other.viewx)) r=min(r,flag.x+240)}
		viewx=max(l,median(gamemanager.origin[p2],round(mean(x,xdig))-hw,gamemanager.righthand[p2]-w))
		exit
	}

	
		l=0 r=verybignumber memx=0
		t=0
		getregion(other.x)
		b=region.ky
		ygoto=other.y
		viewx=other.x-200
		viewy=ygoto-128
		camcx=round(other.x)
		camcy=viewy+h/2
		
		with (camsecret) event_user(1)
		
		with (camblock) with (other) if (collision_rectangle(viewx+hw-204,viewy-4,viewx+hw+204,viewy+h+4,other.id,0,0)) {
			if (camcy>=other.bbox_top && camcy<=other.bbox_bottom+1 && camcx<=other.x && other.left) r=other.bbox_left
			if (camcy>=other.bbox_top && camcy<=other.bbox_bottom+1 && camcx>=other.x && other.right) l=other.bbox_right+1
			if (camcx>=other.bbox_left && camcx<=other.bbox_right+1 && camcy<=other.y && other.top) b=other.bbox_top
			if (camcx>=other.bbox_left && camcx<=other.bbox_right+1 && camcy>=other.y && other.bottom) t=other.bbox_bottom+1
		}
		
	

	/*if (finish && !dead && ending="retainer") {
		viewx=inch(viewx,myretainer.x-hw,2)
	} else viewx=round(round(x)-hw)*/

	if (!jump || climb) ygoto=other.y+looky
	else ygoto=min(other.y+looky+48,max(ygoto,other.y+looky))+min(8,8*(other.vspeed/4)*(other.vspeed>2 || other.vspeed<0)*settings("camshimmie"))

	viewy=(viewy*4+round(ygoto)-128)/5

	//background shenanigans
	bgl=0 bgr=verybignumber
	with (regionmarker) {
		if (lefthand<other.x) {l=max(lefthand,l) if (l=lefthand && abs(panr)) r=l+w bgl=max(bgl,lefthand)}
		if (x>other.x) {r=min(x,r) if (r=x && panl) l=r-w bgr=min(bgr,x)}
	}
	gamemanager.origin[p2]=bgl
	gamemanager.righthand[p2]=bgr

	with (flag) if (passed[other.p2]) {endstagex=x l=min(endstagex,memx) r=max(bgl+400,min(r,x+240))}
	if (gamemanager.ratchet) l=max(l,memx)

	camcx=viewx+hw
	camcy=viewy+h/2

	viewx=median(l,viewx,r-w) if (r-l<w) viewx=round((r+l-w)/2)     
	viewy=median(t,viewy,b-h) if (b-t<h) viewy=round((b+t-h)/2)

	with (flag) if (passed[other.p2] && issign) {other.viewx=view_xview[other.p2]}

	//i cant believe youve done this
	view_xview[p2]=viewx
	if (!noy || argument[0]) view_yview[p2]=viewy
}