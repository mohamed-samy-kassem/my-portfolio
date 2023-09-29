.global reset


reset: 
	  ldr sp, =stak_top 
	  bl main 
stop: b stop