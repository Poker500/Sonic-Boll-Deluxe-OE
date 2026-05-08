xsc=1
if sign(hspeed)!=0 xsc=sign(hspeed)

ghostdraw=!(x=median(view_xview[view_current]-16,x,view_xview[view_current]+view_wview[view_current]+16) && y=median(view_yview[view_current]-16,y,view_yview[view_current]+view_hview[view_current]+16))

if global.debug draw_sprite(spr_dotkid,0,x,y)
//draw_sprite_part_ext(global.ordinary_spr_crimsonsheetlite,0,32,0,28,32,x-16*xsc,y-16,xsc,1,$ffffff,alpha)
draw_sprite_part_ext(global.ordinary_x_sheet,0,8,8+48*sid,47,47,floor(x-24*xsc),floor(y-28),xsc,1,$ffffff,alpha)


//draw_systext(x,y-16,v,$ffffff,1) 

if ghostdraw {
	savedx=x
	savedy=y
	savedxsc=xsc
	savedysc=ysc
	savedalpha=alpha

	if x<view_xview x=view_xview+16
	if x>(view_xview+view_wview) x=(view_xview+view_wview-16)
	if y<view_yview y=view_yview+16
	if y>(view_yview+view_hview) y=(view_yview+view_hview-16)
	
	//draw_sprite_part_ext(global.ordinary_spr_crimsonsheetlite,0,32,0,28,32,x-16*xsc,y-16,xsc*0.5,0.5,$ffffff,alpha*0.5)
	draw_sprite_part_ext(global.ordinary_x_sheet,0,8+48*frame,8+48*sid,47,47,floor(x-24*xsc*0.5),floor(y-28),xsc*0.5,0.5,$ffffff,alpha*0.5)
	
	x=savedx
	y=savedy
	xsc=savedxsc
	ysc=savedysc
	alpha=savedalpha
}
if state="pursuit" && view_current=mytarget.p2{
	depth=-1.5
	tick+=1/global.mplay 
	v=(abs(x-mytarget.x)+abs(y-mytarget.y))/250
	//gamemaker.shake[0]=v/25
	color=merge_color(merge_color(0,$000000,min(1,(1-v)*2)),$ffff00,max(0,((1-v)-0.5)*2))
	draw_set_blend_mode(bm_subtract) 
	rect(view_xview[mytarget.p2]-1,view_yview[mytarget.p2]-1,view_wview[mytarget.p2]+2,view_hview[mytarget.p2]+2,color,0.5) 
	draw_set_blend_mode(bm_add) rect(view_xview[mytarget.p2]-1,view_yview[mytarget.p2]-1,view_wview[mytarget.p2]+2,view_hview[mytarget.p2]+2,0,1) 
	draw_set_blend_mode(0)
	draw_set_blend_mode(bm_add)
	draw_sprite_part_ext(global.ordinary_spr_selectStatic,0,160*(tick mod 3),0,160,72,view_xview[mytarget.p2],view_yview[mytarget.p2],2.5,3.2,$ffffff,0.5-v)
	draw_set_blend_mode(0)
}