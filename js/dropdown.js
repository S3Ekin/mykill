/**
 * Created by Administrator on 2017/6/17.
 */
var cssdropdown={
    disappeardelay: 250,
    disablemenuclick: false,
    enableswipe: 1,
    enableiframeshim: 1,
    dropmenuobj: null, ie: document.all, firefox: document.getElementById&&!document.all, swipetimer: undefined, bottomclip:0,

    getposOffset:function(what, offsettype){
        var totaloffset=(offsettype=="left")? what.offsetLeft : what.offsetTop;
        var parentEl=what.offsetParent;
        while (parentEl!=null){
            totaloffset=(offsettype=="left")? totaloffset+parentEl.offsetLeft : totaloffset+parentEl.offsetTop;
            parentEl=parentEl.offsetParent;
        }
        return totaloffset;
    },

    swipeeffect:function(){
        if (this.bottomclip<parseInt(this.dropmenuobj.offsetHeight)){
            this.bottomclip+=10+(this.bottomclip/10)
            this.dropmenuobj.style.clip="rect(0 auto "+this.bottomclip+"px 0)"
        }
        else
            return
        this.swipetimer=setTimeout("cssdropdown.swipeeffect()", 10)
    },

    showhide:function(obj, e){
        if (this.ie || this.firefox)
            this.dropmenuobj.style.left=this.dropmenuobj.style.top="-500px"
        if (e.type=="click" && obj.visibility==hidden || e.type=="mouseover"){
            if (this.enableswipe==1){
                if (typeof this.swipetimer!="undefined")
                    clearTimeout(this.swipetimer)
                obj.clip="rect(0 auto 0 0)"
                this.bottomclip=0
                this.swipeeffect()
            }
            obj.visibility="visible"
        }
        else if (e.type=="click")
            obj.visibility="hidden"
    },

    iecompattest:function(){
        return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
    },

    clearbrowseredge:function(obj, whichedge){
        var edgeoffset=0
        if (whichedge=="rightedge"){
            var windowedge=this.ie && !window.opera? this.iecompattest().scrollLeft+this.iecompattest().clientWidth-15 : window.pageXOffset+window.innerWidth-15
            this.dropmenuobj.contentmeasure=this.dropmenuobj.offsetWidth
            if (windowedge-this.dropmenuobj.x < this.dropmenuobj.contentmeasure)
                edgeoffset=this.dropmenuobj.contentmeasure-obj.offsetWidth
        }
        else{
            var topedge=this.ie && !window.opera? this.iecompattest().scrollTop : window.pageYOffset
            var windowedge=this.ie && !window.opera? this.iecompattest().scrollTop+this.iecompattest().clientHeight-15 : window.pageYOffset+window.innerHeight-18
            this.dropmenuobj.contentmeasure=this.dropmenuobj.offsetHeight
            if (windowedge-this.dropmenuobj.y < this.dropmenuobj.contentmeasure){
                edgeoffset=this.dropmenuobj.contentmeasure+obj.offsetHeight
                if ((this.dropmenuobj.y-topedge)<this.dropmenuobj.contentmeasure)
                    edgeoffset=this.dropmenuobj.y+obj.offsetHeight-topedge
            }
        }
        return edgeoffset
    },

    dropit:function(obj, e, dropmenuID){
        if (this.dropmenuobj!=null)
            this.dropmenuobj.style.visibility="hidden"
        this.clearhidemenu()
        if (this.ie||this.firefox){
            obj.onmouseout=function(){cssdropdown.delayhidemenu()}
            obj.onclick=function(){return !cssdropdown.disablemenuclick}
            this.dropmenuobj=document.getElementById(dropmenuID)
            if(!this.dropmenuobj) return;
            this.dropmenuobj.onmouseover=function(){cssdropdown.clearhidemenu()}
            this.dropmenuobj.onmouseout=function(e){cssdropdown.dynamichide(e)}
            this.dropmenuobj.onclick=function(){cssdropdown.delayhidemenu()}
            this.showhide(this.dropmenuobj.style, e)
            this.dropmenuobj.x=this.getposOffset(obj, "left")
            this.dropmenuobj.y=this.getposOffset(obj, "top")
            this.dropmenuobj.style.left=this.dropmenuobj.x-this.clearbrowseredge(obj, "rightedge")+"px"
            this.dropmenuobj.style.top=this.dropmenuobj.y-this.clearbrowseredge(obj, "bottomedge")+obj.offsetHeight+1+"px"
            this.positionshim()
        }
    },

    positionshim:function(){
        if (this.enableiframeshim && typeof this.shimobject!="undefined"){
            if (this.dropmenuobj.style.visibility=="visible"){
                this.shimobject.style.width=this.dropmenuobj.offsetWidth+"px"
                this.shimobject.style.height=this.dropmenuobj.offsetHeight+"px"
                this.shimobject.style.left=this.dropmenuobj.style.left
                this.shimobject.style.top=this.dropmenuobj.style.top
            }
            this.shimobject.style.display=(this.dropmenuobj.style.visibility=="visible")? "block" : "none"
        }
    },

    hideshim:function(){
        if (this.enableiframeshim && typeof this.shimobject!="undefined")
            this.shimobject.style.display='none'
    },

    contains_firefox:function(a, b) {
        while (b.parentNode)
            if ((b = b.parentNode) == a)
                return true;
        return false;
    },

    dynamichide:function(e){
        var evtobj=window.event? window.event : e
        if (this.ie&&!this.dropmenuobj.contains(evtobj.toElement))
            this.delayhidemenu()
        else if (this.firefox&&e.currentTarget!= evtobj.relatedTarget&& !this.contains_firefox(evtobj.currentTarget, evtobj.relatedTarget))
            this.delayhidemenu()
    },

    delayhidemenu:function(){
        this.delayhide=setTimeout("cssdropdown.dropmenuobj.style.visibility='hidden'; cssdropdown.hideshim()",this.disappeardelay)
    },

    clearhidemenu:function(){
        if (this.delayhide!="undefined")
            clearTimeout(this.delayhide)
    },

    startchrome:function(){
        for (var ids=0; ids<arguments.length; ids++){
            var menuitems=document.getElementById(arguments[ids]).getElementsByTagName("a")
            for (var i=0; i<menuitems.length; i++){
                if (menuitems[i].getAttribute("rel")){
                    var relvalue=menuitems[i].getAttribute("rel")
                    menuitems[i].onmouseover=function(e){
                        var event=typeof e!="undefined"? e : window.event
                        cssdropdown.dropit(this,event,this.getAttribute("rel"))
                    }
                }
            }
        }
        if (window.createPopup && !window.XmlHttpRequest){

        }
    }

};
$(function(){
    var box = document.getElementById('carousel-n1');
    if (box){
        var text = box.innerHTML;
        var s = 0;
        setInterval(function(){
            var str =' ';
            str += text.substr(0,s);
            str += "<span style='font-size:36px;color:#FF0A1D;'>"+text[s]+"</span>";
            str += text.substr(s+1);
            box.innerHTML = str;
            s++;
            if(s == text.length){
                s = 0;
            }
        },1000);
    }
})
// 喇叭
setInterval("fun()",2000);
function fun(){
    $(".info>img").addClass('animated wobble');
    setTimeout(function(){
        $(".info>img").removeClass('animated wobble');
    },1000);
}
// now
setInterval("fun()",2000);
function fun(){
    $(".footerli_04>a>b").addClass('animated wobble');
    setTimeout(function(){
        $(".footerli_04>a>b").removeClass('animated wobble');
    },1000);
}

/*
* index.js
* */
$(window).scroll(function(){
    var s = $(window).scrollTop();
    if(s>=1796){
        $('.train  .t-i5').addClass("animated zoomInDown");
        $('.train  .t-i2').addClass("animated zoomInUp");
        $('.train  .t-i7').addClass("animated zoomInDown");
        $('.train  .t-i4').addClass("animated zoomInUp");
    };
    if(s>=3666){
        $('.join-bottom ').addClass("animated lightSpeedIn");
        // $('.join-bottom .jb-2').addClass("animated bounchInRight");
        // $('.join-bottom  .jb-3').addClass("animated lightSpeedIn");
        // $('.join-bottom  .jb-4').addClass("animated lightSpeedIn");
        // $('.join-bottom  .jb-5').addClass("animated lightSpeedIn");
        // $('.join-bottom  .jb-6').addClass("animated lightSpeedIn");
        // $('.join-bottom  .jb-7').addClass("animated lightSpeedIn");
        // $('.join-bottom  .jb-8').addClass("animated lightSpeedIn");

    }


    //
    $(".comment ul li:nth-child(6n)").css({
        "margin-right": "0px"
    });
    $(".comment ul li:eq(0)").addClass("on").animate({
        width: "266px"
    }, 300);
    $(".comment ul li dl dd span em").hover(function() {
        $(this).addClass("on");
    },function(){
        $(this).removeClass("on");
    });
    $(".comment ul li.commentli").mouseover(function() {
        $(this).siblings().removeClass("on").stop().animate({
            width: "120px"
        }, 200);
        $(this).addClass("on").stop().animate({
            width: "266px"
        }, 200);
    });

});




























