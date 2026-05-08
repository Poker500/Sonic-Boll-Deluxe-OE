///sonic.exe


//sprmanager
if state="pursuit" {
	frspd=1
	if speed>=3.5 {sprite="chasefast"}
	else if speed<3.5 && speed>2 {sprite="chase"}
	else if speed>=1 {sprite="chaseslow"}
	else if speed>0 && speed<1 {sprite="chaseveryslow"}
	else if speed=0 {sprite="flyidle"}
}

//if global.frame8 frame+=1
//frame=wrap_val(0,frames[sid]-1)

//sheet configuration. i should really use what players do instead...
switch (sprite) {
	case "stand": {sid=0 break;}
	case "flyidle": {sid=1 break;}
	case "chaseveryslow": {sid=2 break;}
	case "chaseslow": {sid=3 break;}
	case "chase": {sid=4 break;}
	case "chasefast": {sid=5 break;}
	
	
	case "caught": {sid=8 break;}
	case "caughtkill": {sid=9 break;}
}

switch (sid) {
	case 0: case 1: case 2: case 3: {frames[sid]=1}
	case 4: case 5: {frames[sid]=2}
}