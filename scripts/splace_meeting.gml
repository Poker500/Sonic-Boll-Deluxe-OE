///splace_meeting(x, y, obj, xscale, yscale)
//place_meeting with a scale modifier
if (argument_count < 3) return place_meeting(argument[0], argument[1], argument[2])

var _x, _y, _place;
_x = image_xscale; image_xscale *= argument[3];
_y = image_yscale; image_yscale *= argument[4];

_place = place_meeting(argument[0], argument[1], argument[2])

image_xscale = _x;
image_yscale = _y;

return _place
