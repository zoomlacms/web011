function dk_slideplayer(object,config){
	this.obj = object;
	this.config = config ? config : {width:"300px",height:"200px",fontsize:"12px",right:"10px",bottom:"10px",time:"5000"};
	this.pause = false;
	var _this = this;
	if(!this.config.right){
		this.config.right = "0px"
	}
	if(!this.config.bottom){
		this.config.bottom = "3px"
	}
	if(this.config.fontsize == "12px" || !this.config.fontsize){
		this.size = "12px";
		this.height = "30px";
		this.right = "6px";
		this.bottom = "10px";
	}else if(this.config.fontsize == "14px"){
		this.size = "14px";
		this.height = "30px";
		this.right = "6px";
		this.bottom = "15px";
	}
	this.count = jQuery(this.obj + " li").size();
	this.n =0;
	this.j =0;
	var t;
	this.factory = function(){
		jQuery(this.obj).css({position:"relative",zIndex:"0",margin:"0",padding:"0",width:this.config.width,height:this.config.height,overflow:"hidden"})
		jQuery(this.obj).prepend("<div style='position:absolute;z-index:20;right:"+this.config.right+";bottom:"+this.config.bottom+"'></div>");
		jQuery(this.obj + " li").css({width:"100%",height:"100%",overflow:"hidden"}).each(function(i){jQuery(_this.obj + " div").append("<a>"+(i+1)+"</a>")});
		jQuery(this.obj + " img").css({border:"none",width:"100%",height:"100%"})
		this.resetclass(this.obj + " div a",0);
		jQuery(this.obj + " p").each(function(i){			
			jQuery(this).parent().append(jQuery(this).clone(true));
			jQuery(this).html("");
			jQuery(this).css({position:"absolute",margin:"0",padding:"0",zIndex:"1",bottom:"0",left:"0",height:_this.height,width:"100%",background:"#000",opacity:"0.4",overflow:"hidden"})
			jQuery(this).next().css({position:"absolute",margin:"0",padding:"0",zIndex:"2",bottom:"0",left:"0",height:_this.height,lineHeight:_this.height,textIndent:"5px",width:"100%",textDecoration:"none",fontSize:_this.size,color:"#FFFFFF",background:"none",zIndex:"1",opacity:"1",overflow:"hidden"})
			if(i!= 0){jQuery(this).hide().next().hide()}
		});
		this.slide();
		this.addhover();
		t = setInterval(this.autoplay,this.config.time);
	}
	
	this.slide = function(){
		jQuery(this.obj + " div a").mouseover(function(){
			_this.j = jQuery(this).text() - 1;
			_this.n = _this.j;
			if (_this.j >= _this.count){return;}
			jQuery(_this.obj + " li").hide();
			jQuery(_this.obj + " p").hide();
			jQuery(_this.obj + " li").eq(_this.j).fadeIn("slow");
			jQuery(_this.obj + " li").eq(_this.j).find("p").show();
			_this.resetclass(_this.obj + " div a",_this.j);
		});
	}
	this.addhover = function(){
		jQuery(this.obj).hover(function(){clearInterval(t);}, function(){t = setInterval(_this.autoplay,_this.config.time)});
	}
	
	this.autoplay = function(){
		_this.n = _this.n >= (_this.count - 1) ? 0 : ++_this.n;
		jQuery(_this.obj + " div a").eq(_this.n).triggerHandler('mouseover');
	}
	
	this.resetclass =function(obj,i){
		jQuery(obj).css({float:"left",marginRight:"5px",width:"20px",height:"20px",lineHeight:"20px",textAlign:"center",fontWeight:"800",fontSize:"14px",color:"#000",borderRadius:"14px",background:"#FFFFFF",cursor:"pointer"});
		jQuery(obj).eq(i).css({color:"#FFFFFF",background:"#f00",textDecoration:"none"});
	}
	this.factory();
}