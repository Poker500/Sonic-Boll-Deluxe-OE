switch(global.cobjectentrypoint){

	case "create":
		timer=1
	break;
	case "step":
		timer-=1
		if timer<0 {
			timer=5
			with customobject{
				if mytype="topping"|| mytype="bigsamba" || mytype="bigtopping" || mytype="toppinfollower" || mytype="entrancedoor"
				if !inview() instance_deactivate_object(self.id)
			
			}
		}

	break;
	case "lemon_display":
		draw_omitext(x*16,y*16,"BTOptimizer is Online.")
	break;
	case "editobjdataname":
		{global.cobjectlemonreturnvalue= "[NO DATA]"}
	break;

}