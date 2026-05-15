///rect(x,y,w,h,col,a,outline)
//draws a rectangle using a sprite

if !argument[6] {draw_sprite_stretched_ext(tex_1x1,0,argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]) exit}

draw_sprite_stretched_ext(tex_1x1,0,argument[0],argument[1],argument[2],1,argument[4],argument[5])
draw_sprite_stretched_ext(tex_1x1,0,argument[0],argument[1],1,argument[3],argument[4],argument[5])
draw_sprite_stretched_ext(tex_1x1,0,argument[0],argument[1]+argument[3],argument[2],1,argument[4],argument[5])
draw_sprite_stretched_ext(tex_1x1,0,argument[0]+argument[2],argument[1],1,argument[3],argument[4],argument[5])
