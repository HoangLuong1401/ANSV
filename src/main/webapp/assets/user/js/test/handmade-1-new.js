;(function(win,doc,callback){'use strict';callback=callback||function(){};function detach(){if(doc.addEventListener){doc.removeEventListener('DOMContentLoaded',completed);}else{doc.detachEvent('onreadystatechange',completed);}}function completed(){if(doc.addEventListener||event.type==='load'||doc.readyState==='complete'){detach();callback(window,window.jQuery);}}function init(){if (doc.addEventListener){doc.addEventListener('DOMContentLoaded',completed);}else{doc.attachEvent('onreadystatechange',completed);}}init();})(window,document,function(win,$){

	!function(factory){"function"==typeof define&&define.amd&&define.amd.jQuery?define(["jquery"],factory):factory("undefined"!=typeof module&&module.exports?require("jquery"):jQuery)}(function($){"use strict";function init(options){return!options||void 0!==options.allowPageScroll||void 0===options.swipe&&void 0===options.swipeStatus||(options.allowPageScroll=NONE),void 0!==options.click&&void 0===options.tap&&(options.tap=options.click),options||(options={}),options=$.extend({},$.fn.swipe.defaults,options),this.each(function(){var $this=$(this),plugin=$this.data(PLUGIN_NS);plugin||(plugin=new TouchSwipe(this,options),$this.data(PLUGIN_NS,plugin))})}function TouchSwipe(element,options){function touchStart(jqEvent){if(!(getTouchInProgress()||$(jqEvent.target).closest(options.excludedElements,$element).length>0)){var event=jqEvent.originalEvent?jqEvent.originalEvent:jqEvent;if(!event.pointerType||"mouse"!=event.pointerType||0!=options.fallbackToMouseEvents){var ret,touches=event.touches,evt=touches?touches[0]:event;return phase=PHASE_START,touches?fingerCount=touches.length:options.preventDefaultEvents!==!1&&jqEvent.preventDefault(),distance=0,direction=null,currentDirection=null,pinchDirection=null,duration=0,startTouchesDistance=0,endTouchesDistance=0,pinchZoom=1,pinchDistance=0,maximumsMap=createMaximumsData(),cancelMultiFingerRelease(),createFingerData(0,evt),!touches||fingerCount===options.fingers||options.fingers===ALL_FINGERS||hasPinches()?(startTime=getTimeStamp(),2==fingerCount&&(createFingerData(1,touches[1]),startTouchesDistance=endTouchesDistance=calculateTouchesDistance(fingerData[0].start,fingerData[1].start)),(options.swipeStatus||options.pinchStatus)&&(ret=triggerHandler(event,phase))):ret=!1,ret===!1?(phase=PHASE_CANCEL,triggerHandler(event,phase),ret):(options.hold&&(holdTimeout=setTimeout($.proxy(function(){$element.trigger("hold",[event.target]),options.hold&&(ret=options.hold.call($element,event,event.target))},this),options.longTapThreshold)),setTouchInProgress(!0),null)}}}function touchMove(jqEvent){var event=jqEvent.originalEvent?jqEvent.originalEvent:jqEvent;if(phase!==PHASE_END&&phase!==PHASE_CANCEL&&!inMultiFingerRelease()){var ret,touches=event.touches,evt=touches?touches[0]:event,currentFinger=updateFingerData(evt);if(endTime=getTimeStamp(),touches&&(fingerCount=touches.length),options.hold&&clearTimeout(holdTimeout),phase=PHASE_MOVE,2==fingerCount&&(0==startTouchesDistance?(createFingerData(1,touches[1]),startTouchesDistance=endTouchesDistance=calculateTouchesDistance(fingerData[0].start,fingerData[1].start)):(updateFingerData(touches[1]),endTouchesDistance=calculateTouchesDistance(fingerData[0].end,fingerData[1].end),pinchDirection=calculatePinchDirection(fingerData[0].end,fingerData[1].end)),pinchZoom=calculatePinchZoom(startTouchesDistance,endTouchesDistance),pinchDistance=Math.abs(startTouchesDistance-endTouchesDistance)),fingerCount===options.fingers||options.fingers===ALL_FINGERS||!touches||hasPinches()){if(direction=calculateDirection(currentFinger.start,currentFinger.end),currentDirection=calculateDirection(currentFinger.last,currentFinger.end),validateDefaultEvent(jqEvent,currentDirection),distance=calculateDistance(currentFinger.start,currentFinger.end),duration=calculateDuration(),setMaxDistance(direction,distance),ret=triggerHandler(event,phase),!options.triggerOnTouchEnd||options.triggerOnTouchLeave){var inBounds=!0;if(options.triggerOnTouchLeave){var bounds=getbounds(this);inBounds=isInBounds(currentFinger.end,bounds)}!options.triggerOnTouchEnd&&inBounds?phase=getNextPhase(PHASE_MOVE):options.triggerOnTouchLeave&&!inBounds&&(phase=getNextPhase(PHASE_END)),phase!=PHASE_CANCEL&&phase!=PHASE_END||triggerHandler(event,phase)}}else phase=PHASE_CANCEL,triggerHandler(event,phase);ret===!1&&(phase=PHASE_CANCEL,triggerHandler(event,phase))}}function touchEnd(jqEvent){var event=jqEvent.originalEvent?jqEvent.originalEvent:jqEvent,touches=event.touches;if(touches){if(touches.length&&!inMultiFingerRelease())return startMultiFingerRelease(event),!0;if(touches.length&&inMultiFingerRelease())return!0}return inMultiFingerRelease()&&(fingerCount=fingerCountAtRelease),endTime=getTimeStamp(),duration=calculateDuration(),didSwipeBackToCancel()||!validateSwipeDistance()?(phase=PHASE_CANCEL,triggerHandler(event,phase)):options.triggerOnTouchEnd||options.triggerOnTouchEnd===!1&&phase===PHASE_MOVE?(options.preventDefaultEvents!==!1&&jqEvent.preventDefault(),phase=PHASE_END,triggerHandler(event,phase)):!options.triggerOnTouchEnd&&hasTap()?(phase=PHASE_END,triggerHandlerForGesture(event,phase,TAP)):phase===PHASE_MOVE&&(phase=PHASE_CANCEL,triggerHandler(event,phase)),setTouchInProgress(!1),null}function touchCancel(){fingerCount=0,endTime=0,startTime=0,startTouchesDistance=0,endTouchesDistance=0,pinchZoom=1,cancelMultiFingerRelease(),setTouchInProgress(!1)}function touchLeave(jqEvent){var event=jqEvent.originalEvent?jqEvent.originalEvent:jqEvent;options.triggerOnTouchLeave&&(phase=getNextPhase(PHASE_END),triggerHandler(event,phase))}function removeListeners(){$element.unbind(START_EV,touchStart),$element.unbind(CANCEL_EV,touchCancel),$element.unbind(MOVE_EV,touchMove),$element.unbind(END_EV,touchEnd),LEAVE_EV&&$element.unbind(LEAVE_EV,touchLeave),setTouchInProgress(!1)}function getNextPhase(currentPhase){var nextPhase=currentPhase,validTime=validateSwipeTime(),validDistance=validateSwipeDistance(),didCancel=didSwipeBackToCancel();return!validTime||didCancel?nextPhase=PHASE_CANCEL:!validDistance||currentPhase!=PHASE_MOVE||options.triggerOnTouchEnd&&!options.triggerOnTouchLeave?!validDistance&&currentPhase==PHASE_END&&options.triggerOnTouchLeave&&(nextPhase=PHASE_CANCEL):nextPhase=PHASE_END,nextPhase}function triggerHandler(event,phase){var ret,touches=event.touches;return(didSwipe()||hasSwipes())&&(ret=triggerHandlerForGesture(event,phase,SWIPE)),(didPinch()||hasPinches())&&ret!==!1&&(ret=triggerHandlerForGesture(event,phase,PINCH)),didDoubleTap()&&ret!==!1?ret=triggerHandlerForGesture(event,phase,DOUBLE_TAP):didLongTap()&&ret!==!1?ret=triggerHandlerForGesture(event,phase,LONG_TAP):didTap()&&ret!==!1&&(ret=triggerHandlerForGesture(event,phase,TAP)),phase===PHASE_CANCEL&&touchCancel(event),phase===PHASE_END&&(touches?touches.length||touchCancel(event):touchCancel(event)),ret}function triggerHandlerForGesture(event,phase,gesture){var ret;if(gesture==SWIPE){if($element.trigger("swipeStatus",[phase,direction||null,distance||0,duration||0,fingerCount,fingerData,currentDirection]),options.swipeStatus&&(ret=options.swipeStatus.call($element,event,phase,direction||null,distance||0,duration||0,fingerCount,fingerData,currentDirection),ret===!1))return!1;if(phase==PHASE_END&&validateSwipe()){if(clearTimeout(singleTapTimeout),clearTimeout(holdTimeout),$element.trigger("swipe",[direction,distance,duration,fingerCount,fingerData,currentDirection]),options.swipe&&(ret=options.swipe.call($element,event,direction,distance,duration,fingerCount,fingerData,currentDirection),ret===!1))return!1;switch(direction){case LEFT:$element.trigger("swipeLeft",[direction,distance,duration,fingerCount,fingerData,currentDirection]),options.swipeLeft&&(ret=options.swipeLeft.call($element,event,direction,distance,duration,fingerCount,fingerData,currentDirection));break;case RIGHT:$element.trigger("swipeRight",[direction,distance,duration,fingerCount,fingerData,currentDirection]),options.swipeRight&&(ret=options.swipeRight.call($element,event,direction,distance,duration,fingerCount,fingerData,currentDirection));break;case UP:$element.trigger("swipeUp",[direction,distance,duration,fingerCount,fingerData,currentDirection]),options.swipeUp&&(ret=options.swipeUp.call($element,event,direction,distance,duration,fingerCount,fingerData,currentDirection));break;case DOWN:$element.trigger("swipeDown",[direction,distance,duration,fingerCount,fingerData,currentDirection]),options.swipeDown&&(ret=options.swipeDown.call($element,event,direction,distance,duration,fingerCount,fingerData,currentDirection))}}}if(gesture==PINCH){if($element.trigger("pinchStatus",[phase,pinchDirection||null,pinchDistance||0,duration||0,fingerCount,pinchZoom,fingerData]),options.pinchStatus&&(ret=options.pinchStatus.call($element,event,phase,pinchDirection||null,pinchDistance||0,duration||0,fingerCount,pinchZoom,fingerData),ret===!1))return!1;if(phase==PHASE_END&&validatePinch())switch(pinchDirection){case IN:$element.trigger("pinchIn",[pinchDirection||null,pinchDistance||0,duration||0,fingerCount,pinchZoom,fingerData]),options.pinchIn&&(ret=options.pinchIn.call($element,event,pinchDirection||null,pinchDistance||0,duration||0,fingerCount,pinchZoom,fingerData));break;case OUT:$element.trigger("pinchOut",[pinchDirection||null,pinchDistance||0,duration||0,fingerCount,pinchZoom,fingerData]),options.pinchOut&&(ret=options.pinchOut.call($element,event,pinchDirection||null,pinchDistance||0,duration||0,fingerCount,pinchZoom,fingerData))}}return gesture==TAP?phase!==PHASE_CANCEL&&phase!==PHASE_END||(clearTimeout(singleTapTimeout),clearTimeout(holdTimeout),hasDoubleTap()&&!inDoubleTap()?(doubleTapStartTime=getTimeStamp(),singleTapTimeout=setTimeout($.proxy(function(){doubleTapStartTime=null,$element.trigger("tap",[event.target]),options.tap&&(ret=options.tap.call($element,event,event.target))},this),options.doubleTapThreshold)):(doubleTapStartTime=null,$element.trigger("tap",[event.target]),options.tap&&(ret=options.tap.call($element,event,event.target)))):gesture==DOUBLE_TAP?phase!==PHASE_CANCEL&&phase!==PHASE_END||(clearTimeout(singleTapTimeout),clearTimeout(holdTimeout),doubleTapStartTime=null,$element.trigger("doubletap",[event.target]),options.doubleTap&&(ret=options.doubleTap.call($element,event,event.target))):gesture==LONG_TAP&&(phase!==PHASE_CANCEL&&phase!==PHASE_END||(clearTimeout(singleTapTimeout),doubleTapStartTime=null,$element.trigger("longtap",[event.target]),options.longTap&&(ret=options.longTap.call($element,event,event.target)))),ret}function validateSwipeDistance(){var valid=!0;return null!==options.threshold&&(valid=distance>=options.threshold),valid}function didSwipeBackToCancel(){var cancelled=!1;return null!==options.cancelThreshold&&null!==direction&&(cancelled=getMaxDistance(direction)-distance>=options.cancelThreshold),cancelled}function validatePinchDistance(){return null===options.pinchThreshold||pinchDistance>=options.pinchThreshold}function validateSwipeTime(){var result;return result=!options.maxTimeThreshold||!(duration>=options.maxTimeThreshold)}function validateDefaultEvent(jqEvent,direction){if(options.preventDefaultEvents!==!1)if(options.allowPageScroll===NONE)jqEvent.preventDefault();else{var auto=options.allowPageScroll===AUTO;switch(direction){case LEFT:(options.swipeLeft&&auto||!auto&&options.allowPageScroll!=HORIZONTAL)&&jqEvent.preventDefault();break;case RIGHT:(options.swipeRight&&auto||!auto&&options.allowPageScroll!=HORIZONTAL)&&jqEvent.preventDefault();break;case UP:(options.swipeUp&&auto||!auto&&options.allowPageScroll!=VERTICAL)&&jqEvent.preventDefault();break;case DOWN:(options.swipeDown&&auto||!auto&&options.allowPageScroll!=VERTICAL)&&jqEvent.preventDefault();break;case NONE:}}}function validatePinch(){var hasCorrectFingerCount=validateFingers(),hasEndPoint=validateEndPoint(),hasCorrectDistance=validatePinchDistance();return hasCorrectFingerCount&&hasEndPoint&&hasCorrectDistance}function hasPinches(){return!!(options.pinchStatus||options.pinchIn||options.pinchOut)}function didPinch(){return!(!validatePinch()||!hasPinches())}function validateSwipe(){var hasValidTime=validateSwipeTime(),hasValidDistance=validateSwipeDistance(),hasCorrectFingerCount=validateFingers(),hasEndPoint=validateEndPoint(),didCancel=didSwipeBackToCancel(),valid=!didCancel&&hasEndPoint&&hasCorrectFingerCount&&hasValidDistance&&hasValidTime;return valid}function hasSwipes(){return!!(options.swipe||options.swipeStatus||options.swipeLeft||options.swipeRight||options.swipeUp||options.swipeDown)}function didSwipe(){return!(!validateSwipe()||!hasSwipes())}function validateFingers(){return fingerCount===options.fingers||options.fingers===ALL_FINGERS||!SUPPORTS_TOUCH}function validateEndPoint(){return 0!==fingerData[0].end.x}function hasTap(){return!!options.tap}function hasDoubleTap(){return!!options.doubleTap}function hasLongTap(){return!!options.longTap}function validateDoubleTap(){if(null==doubleTapStartTime)return!1;var now=getTimeStamp();return hasDoubleTap()&&now-doubleTapStartTime<=options.doubleTapThreshold}function inDoubleTap(){return validateDoubleTap()}function validateTap(){return(1===fingerCount||!SUPPORTS_TOUCH)&&(isNaN(distance)||distance<options.threshold)}function validateLongTap(){return duration>options.longTapThreshold&&distance<DOUBLE_TAP_THRESHOLD}function didTap(){return!(!validateTap()||!hasTap())}function didDoubleTap(){return!(!validateDoubleTap()||!hasDoubleTap())}function didLongTap(){return!(!validateLongTap()||!hasLongTap())}function startMultiFingerRelease(event){previousTouchEndTime=getTimeStamp(),fingerCountAtRelease=event.touches.length+1}function cancelMultiFingerRelease(){previousTouchEndTime=0,fingerCountAtRelease=0}function inMultiFingerRelease(){var withinThreshold=!1;if(previousTouchEndTime){var diff=getTimeStamp()-previousTouchEndTime;diff<=options.fingerReleaseThreshold&&(withinThreshold=!0)}return withinThreshold}function getTouchInProgress(){return!($element.data(PLUGIN_NS+"_intouch")!==!0)}function setTouchInProgress(val){$element&&(val===!0?($element.bind(MOVE_EV,touchMove),$element.bind(END_EV,touchEnd),LEAVE_EV&&$element.bind(LEAVE_EV,touchLeave)):($element.unbind(MOVE_EV,touchMove,!1),$element.unbind(END_EV,touchEnd,!1),LEAVE_EV&&$element.unbind(LEAVE_EV,touchLeave,!1)),$element.data(PLUGIN_NS+"_intouch",val===!0))}function createFingerData(id,evt){var f={start:{x:0,y:0},last:{x:0,y:0},end:{x:0,y:0}};return f.start.x=f.last.x=f.end.x=evt.pageX||evt.clientX,f.start.y=f.last.y=f.end.y=evt.pageY||evt.clientY,fingerData[id]=f,f}function updateFingerData(evt){var id=void 0!==evt.identifier?evt.identifier:0,f=getFingerData(id);return null===f&&(f=createFingerData(id,evt)),f.last.x=f.end.x,f.last.y=f.end.y,f.end.x=evt.pageX||evt.clientX,f.end.y=evt.pageY||evt.clientY,f}function getFingerData(id){return fingerData[id]||null}function setMaxDistance(direction,distance){direction!=NONE&&(distance=Math.max(distance,getMaxDistance(direction)),maximumsMap[direction].distance=distance)}function getMaxDistance(direction){if(maximumsMap[direction])return maximumsMap[direction].distance}function createMaximumsData(){var maxData={};return maxData[LEFT]=createMaximumVO(LEFT),maxData[RIGHT]=createMaximumVO(RIGHT),maxData[UP]=createMaximumVO(UP),maxData[DOWN]=createMaximumVO(DOWN),maxData}function createMaximumVO(dir){return{direction:dir,distance:0}}function calculateDuration(){return endTime-startTime}function calculateTouchesDistance(startPoint,endPoint){var diffX=Math.abs(startPoint.x-endPoint.x),diffY=Math.abs(startPoint.y-endPoint.y);return Math.round(Math.sqrt(diffX*diffX+diffY*diffY))}function calculatePinchZoom(startDistance,endDistance){var percent=endDistance/startDistance*1;return percent.toFixed(2)}function calculatePinchDirection(){return pinchZoom<1?OUT:IN}function calculateDistance(startPoint,endPoint){return Math.round(Math.sqrt(Math.pow(endPoint.x-startPoint.x,2)+Math.pow(endPoint.y-startPoint.y,2)))}function calculateAngle(startPoint,endPoint){var x=startPoint.x-endPoint.x,y=endPoint.y-startPoint.y,r=Math.atan2(y,x),angle=Math.round(180*r/Math.PI);return angle<0&&(angle=360-Math.abs(angle)),angle}function calculateDirection(startPoint,endPoint){if(comparePoints(startPoint,endPoint))return NONE;var angle=calculateAngle(startPoint,endPoint);return angle<=45&&angle>=0?LEFT:angle<=360&&angle>=315?LEFT:angle>=135&&angle<=225?RIGHT:angle>45&&angle<135?DOWN:UP}function getTimeStamp(){var now=new Date;return now.getTime()}function getbounds(el){el=$(el);var offset=el.offset(),bounds={left:offset.left,right:offset.left+el.outerWidth(),top:offset.top,bottom:offset.top+el.outerHeight()};return bounds}function isInBounds(point,bounds){return point.x>bounds.left&&point.x<bounds.right&&point.y>bounds.top&&point.y<bounds.bottom}function comparePoints(pointA,pointB){return pointA.x==pointB.x&&pointA.y==pointB.y}var options=$.extend({},options),useTouchEvents=SUPPORTS_TOUCH||SUPPORTS_POINTER||!options.fallbackToMouseEvents,START_EV=useTouchEvents?SUPPORTS_POINTER?SUPPORTS_POINTER_IE10?"MSPointerDown":"pointerdown":"touchstart":"mousedown",MOVE_EV=useTouchEvents?SUPPORTS_POINTER?SUPPORTS_POINTER_IE10?"MSPointerMove":"pointermove":"touchmove":"mousemove",END_EV=useTouchEvents?SUPPORTS_POINTER?SUPPORTS_POINTER_IE10?"MSPointerUp":"pointerup":"touchend":"mouseup",LEAVE_EV=useTouchEvents?SUPPORTS_POINTER?"mouseleave":null:"mouseleave",CANCEL_EV=SUPPORTS_POINTER?SUPPORTS_POINTER_IE10?"MSPointerCancel":"pointercancel":"touchcancel",distance=0,direction=null,currentDirection=null,duration=0,startTouchesDistance=0,endTouchesDistance=0,pinchZoom=1,pinchDistance=0,pinchDirection=0,maximumsMap=null,$element=$(element),phase="start",fingerCount=0,fingerData={},startTime=0,endTime=0,previousTouchEndTime=0,fingerCountAtRelease=0,doubleTapStartTime=0,singleTapTimeout=null,holdTimeout=null;try{$element.bind(START_EV,touchStart),$element.bind(CANCEL_EV,touchCancel)}catch(e){$.error("events not supported "+START_EV+","+CANCEL_EV+" on jQuery.swipe")}this.enable=function(){return this.disable(),$element.bind(START_EV,touchStart),$element.bind(CANCEL_EV,touchCancel),$element},this.disable=function(){return removeListeners(),$element},this.destroy=function(){removeListeners(),$element.data(PLUGIN_NS,null),$element=null},this.option=function(property,value){if("object"==typeof property)options=$.extend(options,property);else if(void 0!==options[property]){if(void 0===value)return options[property];options[property]=value}else{if(!property)return options;$.error("Option "+property+" does not exist on jQuery.swipe.options")}return null}}var VERSION="1.6.18",LEFT="left",RIGHT="right",UP="up",DOWN="down",IN="in",OUT="out",NONE="none",AUTO="auto",SWIPE="swipe",PINCH="pinch",TAP="tap",DOUBLE_TAP="doubletap",LONG_TAP="longtap",HORIZONTAL="horizontal",VERTICAL="vertical",ALL_FINGERS="all",DOUBLE_TAP_THRESHOLD=10,PHASE_START="start",PHASE_MOVE="move",PHASE_END="end",PHASE_CANCEL="cancel",SUPPORTS_TOUCH="ontouchstart"in window,SUPPORTS_POINTER_IE10=window.navigator.msPointerEnabled&&!window.PointerEvent&&!SUPPORTS_TOUCH,SUPPORTS_POINTER=(window.PointerEvent||window.navigator.msPointerEnabled)&&!SUPPORTS_TOUCH,PLUGIN_NS="TouchSwipe",defaults={fingers:1,threshold:75,cancelThreshold:null,pinchThreshold:20,maxTimeThreshold:null,fingerReleaseThreshold:250,longTapThreshold:500,doubleTapThreshold:200,swipe:null,swipeLeft:null,swipeRight:null,swipeUp:null,swipeDown:null,swipeStatus:null,pinchIn:null,pinchOut:null,pinchStatus:null,click:null,tap:null,doubleTap:null,longTap:null,hold:null,triggerOnTouchEnd:!0,triggerOnTouchLeave:!1,allowPageScroll:"auto",fallbackToMouseEvents:!0,excludedElements:".noSwipe",preventDefaultEvents:!0};$.fn.swipe=function(method){var $this=$(this),plugin=$this.data(PLUGIN_NS);if(plugin&&"string"==typeof method){if(plugin[method])return plugin[method].apply(plugin,Array.prototype.slice.call(arguments,1));$.error("Method "+method+" does not exist on jQuery.swipe")}else if(plugin&&"object"==typeof method)plugin.option.apply(plugin,arguments);else if(!(plugin||"object"!=typeof method&&method))return init.apply(this,arguments);return $this},$.fn.swipe.version=VERSION,$.fn.swipe.defaults=defaults,$.fn.swipe.phases={PHASE_START:PHASE_START,PHASE_MOVE:PHASE_MOVE,PHASE_END:PHASE_END,PHASE_CANCEL:PHASE_CANCEL},$.fn.swipe.directions={LEFT:LEFT,RIGHT:RIGHT,UP:UP,DOWN:DOWN,IN:IN,OUT:OUT},$.fn.swipe.pageScroll={NONE:NONE,HORIZONTAL:HORIZONTAL,VERTICAL:VERTICAL,AUTO:AUTO},$.fn.swipe.fingers={ONE:1,TWO:2,THREE:3,FOUR:4,FIVE:5,ALL:ALL_FINGERS}});

	/*
	 *	jQuery dotdotdot 1.8.3
	 *
	 *	Copyright (c) Fred Heusschen
	 *	www.frebsite.nl
	 *
	 *	Plugin website:
	 *	dotdotdot.frebsite.nl
	 *
	 *	Licensed under the MIT license.
	 *	http://en.wikipedia.org/wiki/MIT_License
	 */
	!function(t,e){function n(t,e,n){var r=t.children(),o=!1;t.empty();for(var i=0,d=r.length;d>i;i++){var l=r.eq(i);if(t.append(l),n&&t.append(n),a(t,e)){l.remove(),o=!0;break}n&&n.detach()}return o}function r(e,n,i,d,l){var s=!1,c="a, table, thead, tbody, tfoot, tr, col, colgroup, object, embed, param, ol, ul, dl, blockquote, select, optgroup, option, textarea, script, style",u="script, .dotdotdot-keep";return e.contents().detach().each(function(){var h=this,f=t(h);if("undefined"==typeof h)return!0;if(f.is(u))e.append(f);else{if(s)return!0;e.append(f),!l||f.is(d.after)||f.find(d.after).length||e[e.is(c)?"after":"append"](l),a(i,d)&&(s=3==h.nodeType?o(f,n,i,d,l):r(f,n,i,d,l)),s||l&&l.detach()}}),n.addClass("is-truncated"),s}function o(e,n,r,o,d){var c=e[0];if(!c)return!1;var h=s(c),f=-1!==h.indexOf(" ")?" ":"　",p="letter"==o.wrap?"":f,g=h.split(p),v=-1,w=-1,b=0,m=g.length-1;for(o.fallbackToLetter&&0==b&&0==m&&(p="",g=h.split(p),m=g.length-1);m>=b&&(0!=b||0!=m);){var y=Math.floor((b+m)/2);if(y==w)break;w=y,l(c,g.slice(0,w+1).join(p)+o.ellipsis),r.children().each(function(){t(this).toggle().toggle()}),a(r,o)?(m=w,o.fallbackToLetter&&0==b&&0==m&&(p="",g=g[0].split(p),v=-1,w=-1,b=0,m=g.length-1)):(v=w,b=w)}if(-1==v||1==g.length&&0==g[0].length){var x=e.parent();e.detach();var C=d&&d.closest(x).length?d.length:0;if(x.contents().length>C?c=u(x.contents().eq(-1-C),n):(c=u(x,n,!0),C||x.detach()),c&&(h=i(s(c),o),l(c,h),C&&d)){var T=d.parent();t(c).parent().append(d),t.trim(T.html())||T.remove()}}else h=i(g.slice(0,v+1).join(p),o),l(c,h);return!0}function a(t,e){return t.innerHeight()>e.maxHeight}function i(e,n){for(;t.inArray(e.slice(-1),n.lastCharacter.remove)>-1;)e=e.slice(0,-1);return t.inArray(e.slice(-1),n.lastCharacter.noEllipsis)<0&&(e+=n.ellipsis),e}function d(t){return{width:t.innerWidth(),height:t.innerHeight()}}function l(t,e){t.innerText?t.innerText=e:t.nodeValue?t.nodeValue=e:t.textContent&&(t.textContent=e)}function s(t){return t.innerText?t.innerText:t.nodeValue?t.nodeValue:t.textContent?t.textContent:""}function c(t){do t=t.previousSibling;while(t&&1!==t.nodeType&&3!==t.nodeType);return t}function u(e,n,r){var o,a=e&&e[0];if(a){if(!r){if(3===a.nodeType)return a;if(t.trim(e.text()))return u(e.contents().last(),n)}for(o=c(a);!o;){if(e=e.parent(),e.is(n)||!e.length)return!1;o=c(e[0])}if(o)return u(t(o),n)}return!1}function h(e,n){return e?"string"==typeof e?(e=t(e,n),e.length?e:!1):e.jquery?e:!1:!1}function f(t){for(var e=t.innerHeight(),n=["paddingTop","paddingBottom"],r=0,o=n.length;o>r;r++){var a=parseInt(t.css(n[r]),10);isNaN(a)&&(a=0),e-=a}return e}if(!t.fn.dotdotdot){t.fn.dotdotdot=function(e){if(0==this.length)return t.fn.dotdotdot.debug('No element found for "'+this.selector+'".'),this;if(this.length>1)return this.each(function(){t(this).dotdotdot(e)});var o=this,i=o.contents();o.data("dotdotdot")&&o.trigger("destroy.dot"),o.data("dotdotdot-style",o.attr("style")||""),o.css("word-wrap","break-word"),"nowrap"===o.css("white-space")&&o.css("white-space","normal"),o.bind_events=function(){return o.bind("update.dot",function(e,d){switch(o.removeClass("is-truncated"),e.preventDefault(),e.stopPropagation(),typeof l.height){case"number":l.maxHeight=l.height;break;case"function":l.maxHeight=l.height.call(o[0]);break;default:l.maxHeight=f(o)}l.maxHeight+=l.tolerance,"undefined"!=typeof d&&(("string"==typeof d||"nodeType"in d&&1===d.nodeType)&&(d=t("<div />").append(d).contents()),d instanceof t&&(i=d)),g=o.wrapInner('<div class="dotdotdot" />').children(),g.contents().detach().end().append(i.clone(!0)).find("br").replaceWith("  <br />  ").end().css({height:"auto",width:"auto",border:"none",padding:0,margin:0});var c=!1,u=!1;return s.afterElement&&(c=s.afterElement.clone(!0),c.show(),s.afterElement.detach()),a(g,l)&&(u="children"==l.wrap?n(g,l,c):r(g,o,g,l,c)),g.replaceWith(g.contents()),g=null,t.isFunction(l.callback)&&l.callback.call(o[0],u,i),s.isTruncated=u,u}).bind("isTruncated.dot",function(t,e){return t.preventDefault(),t.stopPropagation(),"function"==typeof e&&e.call(o[0],s.isTruncated),s.isTruncated}).bind("originalContent.dot",function(t,e){return t.preventDefault(),t.stopPropagation(),"function"==typeof e&&e.call(o[0],i),i}).bind("destroy.dot",function(t){t.preventDefault(),t.stopPropagation(),o.unwatch().unbind_events().contents().detach().end().append(i).attr("style",o.data("dotdotdot-style")||"").removeClass("is-truncated").data("dotdotdot",!1)}),o},o.unbind_events=function(){return o.unbind(".dot"),o},o.watch=function(){if(o.unwatch(),"window"==l.watch){var e=t(window),n=e.width(),r=e.height();e.bind("resize.dot"+s.dotId,function(){n==e.width()&&r==e.height()&&l.windowResizeFix||(n=e.width(),r=e.height(),u&&clearInterval(u),u=setTimeout(function(){o.trigger("update.dot")},100))})}else c=d(o),u=setInterval(function(){if(o.is(":visible")){var t=d(o);c.width==t.width&&c.height==t.height||(o.trigger("update.dot"),c=t)}},500);return o},o.unwatch=function(){return t(window).unbind("resize.dot"+s.dotId),u&&clearInterval(u),o};var l=t.extend(!0,{},t.fn.dotdotdot.defaults,e),s={},c={},u=null,g=null;return l.lastCharacter.remove instanceof Array||(l.lastCharacter.remove=t.fn.dotdotdot.defaultArrays.lastCharacter.remove),l.lastCharacter.noEllipsis instanceof Array||(l.lastCharacter.noEllipsis=t.fn.dotdotdot.defaultArrays.lastCharacter.noEllipsis),s.afterElement=h(l.after,o),s.isTruncated=!1,s.dotId=p++,o.data("dotdotdot",!0).bind_events().trigger("update.dot"),l.watch&&o.watch(),o},t.fn.dotdotdot.defaults={ellipsis:"... ",wrap:"word",fallbackToLetter:!0,lastCharacter:{},tolerance:0,callback:null,after:null,height:null,watch:!1,windowResizeFix:!0},t.fn.dotdotdot.defaultArrays={lastCharacter:{remove:[" ","　",",",";",".","!","?"],noEllipsis:[]}},t.fn.dotdotdot.debug=function(t){};var p=1,g=t.fn.html;t.fn.html=function(n){return n!=e&&!t.isFunction(n)&&this.data("dotdotdot")?this.trigger("update",[n]):g.apply(this,arguments)};var v=t.fn.text;t.fn.text=function(n){return n!=e&&!t.isFunction(n)&&this.data("dotdotdot")?(n=t("<div />").text(n).html(),this.trigger("update",[n])):v.apply(this,arguments)}}}(jQuery),jQuery(document).ready(function(t){t(".dot-ellipsis").each(function(){var e=t(this).hasClass("dot-resize-update"),n=t(this).hasClass("dot-timer-update"),r=0,o=t(this).attr("class").split(/\s+/);t.each(o,function(t,e){var n=e.match(/^dot-height-(\d+)$/);null!==n&&(r=Number(n[1]))});var a=new Object;n&&(a.watch=!0),e&&(a.watch="window"),r>0&&(a.height=r),t(this).dotdotdot(a)})}),jQuery(window).on("load",function(){jQuery(".dot-ellipsis.dot-load-update").trigger("update.dot")});
	 
	$(window).load(onLoad)
			.resize(onResize);

	function onLoad()
	{
		if (viewportWidth() > 768)
		{
			pageMode = "pc";
		}else{
			pageMode = "mobile";
		}

		onResize();
		onSwipe();
		onScroll();

		$(".ellipsis").dotdotdot({
			ellipsis: '...',
			watch	: window});

		autoKV_sliderPlay();
		kvInterval = setInterval(autoKV_sliderPlay,kvDelay + motionDelay);

		youtubeAPI_Load();
	}

	var pageMode = "pc";

	function onResize()
	{
		if (viewportWidth() > 768)
		{
			swipeAble = false;
			$("div.f01 ul.column_ul").css({"width": "","transition":"","transform":""});
			$("div.f01 ul.column_ul > li").css({"width": ""});
			if (pageMode == "mobile")
			{
				pageMode = "pc";
				f02Motion = true;
				f03Motion = true;
				resetMotion("f02");
				resetMotion("f03");
				resetMotion("f04");
				resetMotion("f05");
				
				setTimeout(function(){
					f02Motion = false;
					f03Motion = false;
					f04Motion = false;
					f05Motion = false;
					onScroll();
				},100);
			}
		}else{
			swipeAble = true;
			$("div.f01 ul.column_ul").css({"width": (viewportWidth()*3) + "px"});
			$("div.f01 ul.column_ul > li").css({"width": viewportWidth() + "px"});

			if (pageMode == "pc")
			{
				pageMode = "mobile";
				f02Motion = true;
				f03Motion = true;
				resetMotion("f02");
				resetMotion("f03");
				resetMotion("f04");
				resetMotion("f05");

				setTimeout(function(){
					f02Motion = false;
					f03Motion = false;
					f04Motion = false;
					f05Motion = false;
					onScroll();
				},100);
			}
		}

		if (viewportWidth() > 768)
		{
			swipeAble = false;
			$("div.f04 ul.column_ul").css({"width": "","transition":"","transform":""});
			$("div.f04 ul.column_ul > li").css({"width": ""});
			
		}else{
			swipeAble = true;
			$("div.f04 ul.column_ul").css({"width": (viewportWidth()*3) + "px"});
			$("div.f04 ul.column_ul > li").css({"width": viewportWidth() + "px"});

			if (pageMode == "pc")
			{
				pageMode = "mobile";
				f02Motion = true;
				f03Motion = true;
				f04Motion = true;
				f05Motion = true;
				resetMotion("f02");
				resetMotion("f03");
				resetMotion("f04");
				resetMotion("f05");

				setTimeout(function(){
					f02Motion = false;
					f03Motion = false;
					f04Motion = false;
					f05Motion = false;
					onScroll2();
				},100);
			}
		}

		if (viewportWidth() > 768)
		{
			swipeAble = false;
			$("div.f05 ul.column_ul").css({"width": "","transition":"","transform":""});
			$("div.f05 ul.column_ul > li").css({"width": ""});
			
		}else{
			swipeAble = true;
			$("div.f05 ul.column_ul").css({"width": (viewportWidth()*3) + "px"});
			$("div.f05 ul.column_ul > li").css({"width": viewportWidth() + "px"});

			if (pageMode == "pc")
			{
				pageMode = "mobile";
				f02Motion = true;
				f03Motion = true;
				f04Motion = true;
				f05Motion = true;
				resetMotion("f02");
				resetMotion("f03");
				resetMotion("f04");
				resetMotion("f05");

				setTimeout(function(){
					f02Motion = false;
					f03Motion = false;
					f04Motion = false;
					f05Motion = false;
					onScroll3();
				},100);
			}
		}

		if (viewportWidth() > 768 && pageMode == "mobile")
		{
			$(".video_popup .popup_innder .close").click();
		}else if (viewportWidth() <= 768 && pageMode == "pc"){
			$(".video_popup .popup_innder .close").click();
		}

		onSwipe();
	}

	var swipeAble = false;
	var showPage = 0;
	var swipeOut = false;
	var touchMove = 0;
	var touchAble = false;
	var clickAble = true;
	function onSwipe()
	{
		if (swipeAble)
		{
			$("div.f01 ul.column_ul").hover(function(){
			},function(){
				if (touchAble)
				{
					$(this).off('touchstart', this);
					$(this).off('touchmove', this);
					$(this).off('touchend', this);
					$(this).off('mousedown', this);
					$(this).off('mousemove', this);
					$(this).off('mouseup', this);
					
					if (Math.abs(touchMove) > (viewportWidth() / 4))
					{
						if (touchMove < 0 && showPage > 0)
						{
							showPage--;
						}else if (touchMove > 0 && showPage < 2)
						{
							showPage++;
						}
					}
					$("div.f01 ul.column_ul").css({"transition":"all 0.3s","transform":"translate(" + -(showPage * viewportWidth()) + "px, 0px)"});
					$(".mo_only > li > a").removeClass("active");
					$(".mo_only > li > a").eq(showPage).addClass("active");
					swipeOut = true;
					touchMove = 0;
				}
				
			});		

			$("div.f01 ul.column_ul").swipe({
				swipeStatus:function(event, phase, direction, distance, duration, fingerCount, fingerData) {
					touchAble = true;
					if (phase == "move")
					{
						clickAble = false;
					}
					if (phase == "start")
					{
						clickAble = true;
						swipeOut = false;
					}
					if (swipeOut)
					{
						return false;
					}
					touchMove = distance;
					if (direction == "right")
					{
						touchMove = -distance;
					}
					var slideMove = -(showPage * viewportWidth())-touchMove;

					
					$("div.f01 ul.column_ul").css({"transition":"","transform":"translate(" + slideMove + "px, 0px)"});
					
					if ((viewportWidth() / 4) < slideMove)
					{	
						$("div.f01 ul.column_ul").css({"transition":"all 0.5s","transform":"translate(" + -(showPage * viewportWidth()) + "px, 0px)"});
						$(this).off('touchstart', this);
						$(this).off('touchmove', this);
						$(this).off('touchend', this);
						$(this).off('mousedown', this);
						$(this).off('mousemove', this);
						$(this).off('mouseup', this);
						return false;
					}else if (slideMove < (-(2 * viewportWidth())-(viewportWidth() / 4)))
					{
						$("div.f01 ul.column_ul").css({"transition":"all 0.5s","transform":"translate(" + -(showPage * viewportWidth()) + "px, 0px)"});
						$(this).off('touchstart', this);
						$(this).off('touchmove', this);
						$(this).off('touchend', this);
						$(this).off('mousedown', this);
						$(this).off('mousemove', this);
						$(this).off('mouseup', this);
						return false;
					}

					if (phase == "cancel")
					{
						$("div.f01 ul.column_ul").css({"transition":"all 0.3s","transform":"translate(" + -(showPage * viewportWidth()) + "px, 0px)"});
					}
				},
				swipe:function(event, phase, direction, distance, duration, fingerCount, fingerData) {
					if (!swipeOut)
					{
						touchAble = false;
						if(Math.abs(touchMove) > (viewportWidth() / 4))
						{
							if(direction == "left" || phase == "left" || direction == "right" || phase == "right")
							{
								if (direction == "left" || phase == "left")
								{
									showPage++;
									if (showPage > 2)
									{
										showPage = 2;
									}
								}else{
									showPage--;
									if (showPage < 0)
									{
										showPage = 0;
									}
								}
								
								$("div.f01 ul.column_ul").css({"transition":"all 0.6s","transform":"translate(" + -(showPage * viewportWidth()) + "px, 0px)"});

								$(".mo_only > li > a").removeClass("active");
								$(".mo_only > li > a").eq(showPage).addClass("active");
							}					
						}else{
							$("div.f01 ul.column_ul").css({"transition":"all 0.3s","transform":"translate(" + -(showPage * viewportWidth()) + "px, 0px)"});
						}
					}				
				},
				allowPageScroll:"vertical"
			});

			$(document).on("click","div.f01 ul.column_ul > li > a", function(){
				if (clickAble)
				{
					document.location.href=$(this).attr("href");
				}
				
				return false;
			});

			$(document).on("click", ".mo_only > li > a", function(){
				$(".mo_only > li > a").removeClass("active");
				$(this).addClass("active");		
				
				if ($(this).parent().index() != showPage)
				{
					if ($(this).parent().index() - showPage == 2)
					{
						showPage = $(this).parent().index();
						$("div.f01 ul.column_ul").css({"transition":"all 0.9s","transform":"translate(" + -(showPage * viewportWidth()) + "px, 0px)"});
					}else{
						showPage = $(this).parent().index();
						$("div.f01 ul.column_ul").css({"transition":"all 0.6s","transform":"translate(" + -(showPage * viewportWidth()) + "px, 0px)"});
					}
				}
				return false;
			});


			$("div.f04 ul.column_ul").hover(function(){
			},function(){
				if (touchAble)
				{
					$(this).off('touchstart', this);
					$(this).off('touchmove', this);
					$(this).off('touchend', this);
					$(this).off('mousedown', this);
					$(this).off('mousemove', this);
					$(this).off('mouseup', this);
					
					if (Math.abs(touchMove) > (viewportWidth() / 4))
					{
						if (touchMove < 0 && showPage04 > 0)
						{
							showPage04--;
						}else if (touchMove > 0 && showPage04 < 2)
						{
							showPage04++;
						}
					}
					$("div.f04 ul.column_ul").css({"transition":"all 0.3s","transform":"translate(" + -(showPage04 * viewportWidth()) + "px, 0px)"});
					$(".mo_onlyf > li > a").removeClass("active");
					$(".mo_onlyf > li > a").eq(showPage04).addClass("active");
					swipeOut = true;
					touchMove = 0;
				}
				
			});		

			$("div.f04 ul.column_ul").swipe({
				swipeStatus:function(event, phase, direction, distance, duration, fingerCount, fingerData) {
					touchAble = true;
					if (phase == "move")
					{
						clickAble = false;
					}
					if (phase == "start")
					{
						clickAble = true;
						swipeOut = false;
					}
					if (swipeOut)
					{
						return false;
					}
					touchMove = distance;
					if (direction == "right")
					{
						touchMove = -distance;
					}
					var slideMove = -(showPage04 * viewportWidth())-touchMove;

					
					$("div.f04 ul.column_ul").css({"transition":"","transform":"translate(" + slideMove + "px, 0px)"});
					
					if ((viewportWidth() / 4) < slideMove)
					{	
						$("div.f04 ul.column_ul").css({"transition":"all 0.5s","transform":"translate(" + -(showPage04 * viewportWidth()) + "px, 0px)"});
						$(this).off('touchstart', this);
						$(this).off('touchmove', this);
						$(this).off('touchend', this);
						$(this).off('mousedown', this);
						$(this).off('mousemove', this);
						$(this).off('mouseup', this);
						return false;
					}else if (slideMove < (-(2 * viewportWidth())-(viewportWidth() / 4)))
					{
						$("div.f04 ul.column_ul").css({"transition":"all 0.5s","transform":"translate(" + -(showPage04 * viewportWidth()) + "px, 0px)"});
						$(this).off('touchstart', this);
						$(this).off('touchmove', this);
						$(this).off('touchend', this);
						$(this).off('mousedown', this);
						$(this).off('mousemove', this);
						$(this).off('mouseup', this);
						return false;
					}

					if (phase == "cancel")
					{
						$("div.f04 ul.column_ul").css({"transition":"all 0.3s","transform":"translate(" + -(showPage04 * viewportWidth()) + "px, 0px)"});
					}
				},
				swipe:function(event, phase, direction, distance, duration, fingerCount, fingerData) {
					if (!swipeOut)
					{
						touchAble = false;
						if(Math.abs(touchMove) > (viewportWidth() / 4))
						{
							if(direction == "left" || phase == "left" || direction == "right" || phase == "right")
							{
								if (direction == "left" || phase == "left")
								{
									showPage04++;
									if (showPage04 > 2)
									{
										showPage04 = 2;
									}
								}else{
									showPage04--;
									if (showPage04 < 0)
									{
										showPage04 = 0;
									}
								}
								
								$("div.f04 ul.column_ul").css({"transition":"all 0.6s","transform":"translate(" + -(showPage04 * viewportWidth()) + "px, 0px)"});

								$(".mo_onlyf > li > a").removeClass("active");
								$(".mo_onlyf > li > a").eq(showPage04).addClass("active");
							}					
						}else{
							$("div.f04 ul.column_ul").css({"transition":"all 0.3s","transform":"translate(" + -(showPage04 * viewportWidth()) + "px, 0px)"});
						}
					}				
				},
				allowPageScroll:"vertical"
			});

			$(document).on("click","div.f04 ul.column_ul > li > a", function(){
				if (clickAble)
				{
					document.location.href=$(this).attr("href");
				}
				
				return false;
			});

			$(document).on("click", ".mo_onlyf > li > a", function(){
				$(".mo_onlyf > li > a").removeClass("active");
				$(this).addClass("active");		
				
				if ($(this).parent().index() != showPage04)
				{
					if ($(this).parent().index() - showPage04 == 2)
					{
						showPage04 = $(this).parent().index();
						$("div.f04 ul.column_ul").css({"transition":"all 0.9s","transform":"translate(" + -(showPage04 * viewportWidth()) + "px, 0px)"});
					}else{
						showPage04 = $(this).parent().index();
						$("div.f04 ul.column_ul").css({"transition":"all 0.6s","transform":"translate(" + -(showPage04 * viewportWidth()) + "px, 0px)"});
					}
				}
				return false;
			});

			$(".kv_slide").swipe({
				swipeStatus:function(event, phase, direction, distance, duration, fingerCount, fingerData) {
				},
				swipe:function(event, phase, direction, distance, duration, fingerCount, fingerData) {
					if(direction == "left" || phase == "left" || direction == "right" || phase == "right")
					{
						if (direction == "right" || phase == "right")
						{
							if (!motionIng)
							{
								motionIng = true;
								clearInterval(kvInterval);

								$(".kv_slide > li").eq(mainKV_idx).animate({"opacity":"0"}, motionDelay, function(){
									if ($(this).index() != 0)
									{
										$(this).css({"display":"none"});
									}			
								});

								--mainKV_idx;
								if (mainKV_idx < 0 )
								{
									mainKV_idx = $(".kv .carousel li").length - 1;
								}

								$(".kv_slide > li").eq(mainKV_idx).css({"display":"block", "opacity":"0"}).animate({"opacity":1}, motionDelay);
								$(".kv .carousel li").removeClass("active");
								$(".kv .carousel li a span").css({"transition":"none", "width":"0%"});
								$(".kv .carousel li").eq(mainKV_idx).addClass("active");
								if (kvplayAble)
								{
									$(".kv .carousel li").eq(mainKV_idx).addClass("active").find("a span").css({"transition":"width " + kvDelay + "ms linear 500ms", "width":"100%"});
									kvInterval = setInterval(autoKV_sliderPlay,kvDelay + motionDelay);
								}			

								setTimeout(function(){
									motionIng = false;
								},motionDelay);

							}
						}else{
							if (!motionIng)
							{
								motionIng = true;
								clearInterval(kvInterval);

								$(".kv_slide > li").eq(mainKV_idx).animate({"opacity":"0"}, motionDelay, function(){
									if ($(this).index() != 0)
									{
										$(this).css({"display":"none"});
									}			
								});

								++mainKV_idx;
								if (mainKV_idx >= $(".kv .carousel li").length)
								{
									mainKV_idx = 0;
								}

								
								$(".kv_slide > li").eq(mainKV_idx).css({"display":"block", "opacity":"0"}).animate({"opacity":1}, motionDelay);		

								$(".kv .carousel li").removeClass("active");
								$(".kv .carousel li a span").css({"transition":"none", "width":"0%"});
								$(".kv .carousel li").eq(mainKV_idx).addClass("active");
								
								if (kvplayAble)
								{
									$(".kv .carousel li").eq(mainKV_idx).addClass("active").find("a span").css({"transition":"width " + kvDelay + "ms linear 500ms", "width":"100%"});
									kvInterval = setInterval(autoKV_sliderPlay,kvDelay + motionDelay);
								}

								setTimeout(function(){
									motionIng = false;
								},motionDelay);
							}
						}
					}	
				},
				allowPageScroll:"vertical"
			});

			if (check_device() != '')
			{
				$(".f03 .video_wrap .video_ul > ul li").swipe({
					swipeStatus:function(event, phase, direction, distance, duration, fingerCount, fingerData) {
					},
					swipe:function(event, phase, direction, distance, duration, fingerCount, fingerData) {
						if(direction == "left" || phase == "left" || direction == "right" || phase == "right")
						{
							if (direction == "right" || phase == "right")
							{
								if (!motionIng)
								{
									motionIng = true;
									var reIdx = f03sliderIdx - 1;
									if (reIdx < 0)
									{
										reIdx = sliderSize;
									}
									motionSlide("l",reIdx);
									setTimeout(function(){
										motionIng = false;
									},motionDelay+300);
								}
							}else{
								if (!motionIng)
								{
									motionIng = true;
									var reIdx = f03sliderIdx + 1;
									
									if (reIdx > sliderSize)
									{
										reIdx = 0;
									}
									motionSlide("r",reIdx);
									setTimeout(function(){
										motionIng = false;
									},motionDelay+300);
								}
							}
						}	
					},
					allowPageScroll:"vertical"
				});
			}

			$("div.f05 ul.column_ul").hover(function(){
			},function(){
				if (touchAble)
				{
					$(this).off('touchstart', this);
					$(this).off('touchmove', this);
					$(this).off('touchend', this);
					$(this).off('mousedown', this);
					$(this).off('mousemove', this);
					$(this).off('mouseup', this);
					
					if (Math.abs(touchMove) > (viewportWidth() / 4))
					{
						if (touchMove < 0 && showPage05 > 0)
						{
							showPage05--;
						}else if (touchMove > 0 && showPage05 < 2)
						{
							showPage05++;
						}
					}
					$("div.f05 ul.column_ul").css({"transition":"all 0.3s","transform":"translate(" + -(showPage05 * viewportWidth()) + "px, 0px)"});
					$(".mo_onlyf05 > li > a").removeClass("active");
					$(".mo_onlyf05 > li > a").eq(showPage05).addClass("active");
					swipeOut = true;
					touchMove = 0;
				}
				
			});		

			$("div.f05 ul.column_ul").swipe({
				swipeStatus:function(event, phase, direction, distance, duration, fingerCount, fingerData) {
					touchAble = true;
					if (phase == "move")
					{
						clickAble = false;
					}
					if (phase == "start")
					{
						clickAble = true;
						swipeOut = false;
					}
					if (swipeOut)
					{
						return false;
					}
					touchMove = distance;
					if (direction == "right")
					{
						touchMove = -distance;
					}
					var slideMove = -(showPage05 * viewportWidth())-touchMove;

					
					$("div.f05 ul.column_ul").css({"transition":"","transform":"translate(" + slideMove + "px, 0px)"});
					
					if ((viewportWidth() / 4) < slideMove)
					{	
						$("div.f05 ul.column_ul").css({"transition":"all 0.5s","transform":"translate(" + -(showPage05 * viewportWidth()) + "px, 0px)"});
						$(this).off('touchstart', this);
						$(this).off('touchmove', this);
						$(this).off('touchend', this);
						$(this).off('mousedown', this);
						$(this).off('mousemove', this);
						$(this).off('mouseup', this);
						return false;
					}else if (slideMove < (-(2 * viewportWidth())-(viewportWidth() / 4)))
					{
						$("div.f05 ul.column_ul").css({"transition":"all 0.5s","transform":"translate(" + -(showPage05 * viewportWidth()) + "px, 0px)"});
						$(this).off('touchstart', this);
						$(this).off('touchmove', this);
						$(this).off('touchend', this);
						$(this).off('mousedown', this);
						$(this).off('mousemove', this);
						$(this).off('mouseup', this);
						return false;
					}

					if (phase == "cancel")
					{
						$("div.f05 ul.column_ul").css({"transition":"all 0.3s","transform":"translate(" + -(showPage05 * viewportWidth()) + "px, 0px)"});
					}
				},
				swipe:function(event, phase, direction, distance, duration, fingerCount, fingerData) {
					if (!swipeOut)
					{
						touchAble = false;
						if(Math.abs(touchMove) > (viewportWidth() / 4))
						{
							if(direction == "left" || phase == "left" || direction == "right" || phase == "right")
							{
								if (direction == "left" || phase == "left")
								{
									showPage05++;
									if (showPage05 > 2)
									{
										showPage05 = 2;
									}
								}else{
									showPage05--;
									if (showPage05 < 0)
									{
										showPage05 = 0;
									}
								}
								
								$("div.f05 ul.column_ul").css({"transition":"all 0.6s","transform":"translate(" + -(showPage05 * viewportWidth()) + "px, 0px)"});

								$(".mo_onlyf05 > li > a").removeClass("active");
								$(".mo_onlyf05 > li > a").eq(showPage05).addClass("active");
							}					
						}else{
							$("div.f05 ul.column_ul").css({"transition":"all 0.3s","transform":"translate(" + -(showPage05 * viewportWidth()) + "px, 0px)"});
						}
					}				
				},
				allowPageScroll:"vertical"
			});

			$(document).on("click","div.f05 ul.column_ul > li > a", function(){
				if (clickAble)
				{
					document.location.href=$(this).attr("href");
				}
				
				return false;
			});

			$(document).on("click", ".mo_onlyf05 > li > a", function(){
				$(".mo_onlyf05 > li > a").removeClass("active");
				$(this).addClass("active");		
				
				if ($(this).parent().index() != showPage05)
				{
					if ($(this).parent().index() - showPage05 == 2)
					{
						showPage05 = $(this).parent().index();
						$("div.f05 ul.column_ul").css({"transition":"all 0.9s","transform":"translate(" + -(showPage05 * viewportWidth()) + "px, 0px)"});
					}else{
						showPage05 = $(this).parent().index();
						$("div.f05 ul.column_ul").css({"transition":"all 0.6s","transform":"translate(" + -(showPage05 * viewportWidth()) + "px, 0px)"});
					}
				}
				return false;
			});
		}	
	}

	var mainKV_idx = -1;
	var kvDelay = 3000;
	var kvInterval;
	var kvStop_timeout;
	var oldKV_idx = 0;
	var motionDelay = 600;
	var stopKV = true;
	var firstKV = true;
	var kvplayAble = true;
	function autoKV_sliderPlay()
	{	
		$(".kv_slide > li").eq(mainKV_idx).animate({"opacity":"0"}, motionDelay, function(){
			if ($(this).index() != 0)
			{
				$(this).css({"display":"none"});
			}
		});

		++mainKV_idx;
		if (mainKV_idx >= $(".kv .carousel li").length)
		{
			mainKV_idx = 0;
		}
		
		if (!firstKV)
		{
			$(".kv_slide > li").eq(mainKV_idx).css({"display":"block", "opacity":"0"}).animate({"opacity":1}, motionDelay);
		}

		if ($(".kv_slide > li").eq(mainKV_idx).hasClass("txt-white") == true)
		{
			$(".kv").addClass("white");
		}
		else
		{
			$(".kv").removeClass("white");
		}
		

		$(".kv .carousel li").removeClass("active");
		$(".kv .carousel li a span").css({"transition":"none", "width":"0%"});
		
		$(".kv .carousel li").eq(mainKV_idx).addClass("active").find("a span").css({"transition":"width " + kvDelay + "ms linear 500ms", "width":"100%"});
		stopKV = false;
		firstKV = false;
	}
	var motionIng = false;
	var kvHover = false;
	$(function(){
		$(".kv .rolling_button").click(function(){
			if (!motionIng)
			{
				motionIng = true;
				
				if ($(this).hasClass("active"))
				{
					kvplayAble = false;
					stopKV = true;
					$(this).removeClass("active");
					var fullWidth = $(".kv .carousel li").eq(0).find("a").outerWidth();
					var nowWidth = parseInt($(".kv .carousel li").eq(mainKV_idx).addClass("active").find("a span").css("width"));
					var newWidth = nowWidth / fullWidth * 100;
					$(".kv .carousel li.active a span").css({"transition":"none", "width":newWidth + "%"});
					clearInterval(kvInterval);
					clearTimeout(kvStop_timeout);
		$('.kv .rolling_button').attr('data-omni','index_play');
				}else{
					kvplayAble = true;
					$(this).addClass("active");

					var fullWidth = $(".kv .carousel li").eq(0).find("a").outerWidth();
					var nowWidth = parseInt($(".kv .carousel li").eq(mainKV_idx).addClass("active").find("a span").css("width"));
					var newWidth = nowWidth / fullWidth * 100;
					var reDelay = 3000 * (1-(newWidth/100));
					$(".kv .carousel li").eq(mainKV_idx).find("a span").css({"transition":"width " + reDelay + "ms linear", "width":"100%"});

					kvStop_timeout = setTimeout(function(){
						autoKV_sliderPlay();
						
						kvInterval = setInterval(autoKV_sliderPlay,kvDelay + motionDelay);
					},reDelay);
		$('.kv .rolling_button').attr('data-omni','index_stop');
				}

				setTimeout(function(){
					motionIng = false;
				},motionDelay);
			}
			
			return false;
		});

		$(".kv .prev_btn").click(function(){
			if (!motionIng)
			{
				motionIng = true;
				clearInterval(kvInterval);
				clearTimeout(kvStop_timeout);

				$(".kv_slide > li").eq(mainKV_idx).animate({"opacity":"0"}, motionDelay, function(){
					if ($(this).index() != 0)
					{
						$(this).css({"display":"none"});
					}			
				});

				--mainKV_idx;
				if (mainKV_idx < 0 )
				{
					mainKV_idx = $(".kv .carousel li").length - 1;
				}
				if ($(".kv_slide > li").eq(mainKV_idx).hasClass("txt-white") == true)
				{
					$(".kv").addClass("white");
				}
				else
				{
					$(".kv").removeClass("white");
				}

				$(".kv_slide > li").eq(mainKV_idx).css({"display":"block", "opacity":"0"}).animate({"opacity":1}, motionDelay);
				$(".kv .carousel li").removeClass("active");
				$(".kv .carousel li a span").css({"transition":"none", "width":"0%"});
				$(".kv .carousel li").eq(mainKV_idx).addClass("active");

				if (kvplayAble)
				{
					$(".kv .carousel li").eq(mainKV_idx).addClass("active").find("a span").css({"transition":"width " + kvDelay + "ms linear 500ms", "width":"100%"});
					kvInterval = setInterval(autoKV_sliderPlay,kvDelay + motionDelay);
				}			

				setTimeout(function(){
					motionIng = false;
				},motionDelay);

			}
			return false;
		});

		$(".kv .next_btn").click(function(){
			if (!motionIng)
			{
				motionIng = true;
				clearInterval(kvInterval);
				clearTimeout(kvStop_timeout);

				$(".kv_slide > li").eq(mainKV_idx).animate({"opacity":"0"}, motionDelay, function(){
					if ($(this).index() != 0)
					{
						$(this).css({"display":"none"});
					}			
				});

				++mainKV_idx;
				if (mainKV_idx >= $(".kv .carousel li").length)
				{
					mainKV_idx = 0;
				}

				if ($(".kv_slide > li").eq(mainKV_idx).hasClass("txt-white") == true)
				{
					$(".kv").addClass("white");
				}
				else
				{
					$(".kv").removeClass("white");
				}
				
				$(".kv_slide > li").eq(mainKV_idx).css({"display":"block", "opacity":"0"}).animate({"opacity":1}, motionDelay);		

				$(".kv .carousel li").removeClass("active");
				$(".kv .carousel li a span").css({"transition":"none", "width":"0%"});
				$(".kv .carousel li").eq(mainKV_idx).addClass("active");

				if (kvplayAble)
				{
					$(".kv .carousel li").eq(mainKV_idx).addClass("active").find("a span").css({"transition":"width " + kvDelay + "ms linear 500ms", "width":"100%"});
					kvInterval = setInterval(autoKV_sliderPlay,kvDelay + motionDelay);
				}

				setTimeout(function(){
					motionIng = false;
				},motionDelay);
			}

			return false;
		});

		var tabIdx = 0;
		$(".f02 .tab_ul li a").click(function(){
			if (!$(this).parent().hasClass("active"))
			{
				if (!motionIng)
				{
					motionIng = true;

					tabIdx = $(this).parent().index();
					$(".f02 .tab_ul li").removeClass("active");
					$(this).parent().addClass("active");
					if (tabIdx == 0)
					{
						$(".f02 .contents_ul > li").eq(0).css({"display":"block"}).animate({"margin-left":"0%"},motionDelay);
						$(".f02 .contents_ul > li").eq(1).animate({"margin-left":"75%"},motionDelay);
							
					}else{
						$(".f02 .contents_ul > li").eq(0).animate({"margin-left":"-75%"},motionDelay);
						$(".f02 .contents_ul > li").eq(1).css({"display":"block"}).animate({"margin-left":"0%"},motionDelay);
						
					}
					setTimeout(function(){
						motionIng = false;
					},motionDelay);
				}

			}
			return false;
		});
		
		$(".f03 .video_wrap .next_btn").click(function(){
			if (!motionIng)
			{
				motionIng = true;
				var reIdx = f03sliderIdx + 1;
				
				if (reIdx > sliderSize)
				{
					reIdx = 0;
				}
				motionSlide("r",reIdx);
				setTimeout(function(){
					motionIng = false;
				},motionDelay+300);
			}
			return false;
		});

		$(".f03 .video_wrap .prev_btn").click(function(){
			if (!motionIng)
			{
				motionIng = true;
				var reIdx = f03sliderIdx - 1;
				if (reIdx < 0)
				{
					reIdx = sliderSize;
				}
				motionSlide("l",reIdx);
				setTimeout(function(){
					motionIng = false;
				},motionDelay+300);
			}

			return false;
		});

		$(".f03 .video_wrap .carousel li a").click(function(){
			if ($(this).parent().index() != f03sliderIdx)
			{
				if (!motionIng)
				{
					motionIng = true;
					if ($(this).parent().index() > f03sliderIdx)
					{
						motionSlide("r",$(this).parent().index());
					}else{
						motionSlide("l",$(this).parent().index());
					}
					setTimeout(function(){
						motionIng = false;
					},motionDelay+300);
				}
			}
			return false;
		});
		
		f03Slider = $(".f03 .video_wrap .video_ul > ul li");
		sliderFull = $(".f03 .video_wrap .video_ul > ul li").length - 1;
		sliderSize = $(".f03 .video_wrap .carousel li").length - 1;

		$(".kv .carousel li a div").hover(function(){
			if (viewportWidth() > 768)
			{
				if (kvplayAble)
				{
					$(".kv .rolling_button").removeClass("active");
					var fullWidth = $(".kv .carousel li").eq(0).find("a").outerWidth();
					var nowWidth = parseInt($(".kv .carousel li").eq(mainKV_idx).addClass("active").find("a span").css("width"));
					var newWidth = nowWidth / fullWidth * 100;
					$(".kv .carousel li.active a span").css({"transition":"none", "width":newWidth + "%"});
					clearInterval(kvInterval);
					clearTimeout(kvStop_timeout);
				}
			}
			
		},function(){
			if (viewportWidth() > 768)
			{
				if (kvplayAble){
					$(".kv .rolling_button").addClass("active");
					var fullWidth = $(".kv .carousel li").eq(0).find("a").outerWidth();
					var nowWidth = parseInt($(".kv .carousel li").eq(mainKV_idx).addClass("active").find("a span").css("width"));
					var newWidth = nowWidth / fullWidth * 100;
					var reDelay = 3000 * (1-(newWidth/100));
					$(".kv .carousel li").eq(mainKV_idx).find("a span").css({"transition":"width " + reDelay + "ms linear", "width":"100%"});
					kvStop_timeout = setTimeout(function(){
						autoKV_sliderPlay();
						kvInterval = setInterval(autoKV_sliderPlay,kvDelay + motionDelay);
					},reDelay);
				}
			}		
		});

		$(window).keydown(function(e){
			console.log(document.activeElement);

			if((e.keyCode === 9 && !e.shiftKey) || (e.keyCode === 9 && e.shiftKey)) {
				if (viewportWidth() > 768 && !$(this).parents(".feature").hasClass("kv"))
				{
					if (kvplayAble && kvStop_timeout == ""){
						$(".kv .rolling_button").addClass("active");
						var fullWidth = $(".kv .carousel li").eq(0).find("a").outerWidth();
						var nowWidth = parseInt($(".kv .carousel li").eq(mainKV_idx).addClass("active").find("a span").css("width"));
						var newWidth = nowWidth / fullWidth * 100;
						var reDelay = 3000 * (1-(newWidth/100));
						$(".kv .carousel li").eq(mainKV_idx).find("a span").css({"transition":"width " + reDelay + "ms linear", "width":"100%"});
						kvStop_timeout = setTimeout(function(){
							autoKV_sliderPlay();
							kvInterval = setInterval(autoKV_sliderPlay,kvDelay + motionDelay);
						},reDelay);
					}
				}	
			}
			return true;
		});

		$(".kv").keydown(function(e) {
	        if(e.keyCode === 13) { // enter
				//e.preventDefault();			
	        };

	        if((e.keyCode === 9 && !e.shiftKey)){ // tab
				//e.preventDefault();
				if (viewportWidth() > 768)
				{
					if (kvplayAble)
					{
						$(".kv .rolling_button").removeClass("active");
						var fullWidth = $(".kv .carousel li").eq(0).find("a").outerWidth();
						var nowWidth = parseInt($(".kv .carousel li").eq(mainKV_idx).addClass("active").find("a span").css("width"));
						var newWidth = nowWidth / fullWidth * 100;
						$(".kv .carousel li.active a span").css({"transition":"none", "width":newWidth + "%"});
						clearInterval(kvInterval);
						clearTimeout(kvStop_timeout);
						kvStop_timeout = "";
					}
					e.stopPropagation();
				}
				
	        }; 

	        if((e.keyCode === 9 && e.shiftKey)){ // shift+tab
				//e.preventDefault();
				if (viewportWidth() > 768)
				{
					if (kvplayAble)
					{
						$(".kv .rolling_button").removeClass("active");
						var fullWidth = $(".kv .carousel li").eq(0).find("a").outerWidth();
						var nowWidth = parseInt($(".kv .carousel li").eq(mainKV_idx).addClass("active").find("a span").css("width"));
						var newWidth = nowWidth / fullWidth * 100;
						$(".kv .carousel li.active a span").css({"transition":"none", "width":newWidth + "%"});
						clearInterval(kvInterval);
						clearTimeout(kvStop_timeout);
						kvStop_timeout = "";
					}
					e.stopPropagation();
				}
	        };
	    });

		$(".kv .carousel li a").click(function()
		{
			if (!motionIng)
			{
				motionIng = true;
				if ($(this).parent().index() != mainKV_idx)
				{
					clearInterval(kvInterval);

					$(".kv_slide > li").eq(mainKV_idx).animate({"opacity":"0"}, motionDelay, function(){
						if ($(this).index() != 0)
						{
							$(this).css({"display":"none"});
						}			
					});
					
					mainKV_idx = $(this).parent().index();
					if (mainKV_idx >= $(".kv .carousel li").length)
					{
						mainKV_idx = 0;
					}

					
					$(".kv_slide > li").eq(mainKV_idx).css({"display":"block", "opacity":"0"}).animate({"opacity":1}, motionDelay);		

					$(".kv .carousel li").removeClass("active");
					$(".kv .carousel li a span").css({"transition":"none", "width":"0%"});
					$(this).parent().addClass("active");
					if (viewportWidth() < 769)
					{
						if (kvplayAble){
							kvInterval = setInterval(autoKV_sliderPlay,kvDelay + motionDelay);
						}
						
					}
					if ($(".kv_slide > li").eq(mainKV_idx).hasClass("txt-white") == true)
					{
						$(".kv").addClass("white");
					}
					else
					{
						$(".kv").removeClass("white");
					}
				}
				
				
				setTimeout(function(){
					motionIng = false;
				},motionDelay);
			}

			return false;
		});	

		$(".feature").animate({"opacity":1},300);

		$(".kv_slide > li .kv_video .s-btn-encased").click(function(){

			$(".video_popup").css({"display":"block"}).animate({"opacity": 1}, motionDelay);
			
			var dataSrc = $(this).attr("data-src");
			if (dataSrc !== false && dataSrc != "" && popVideo && popVideo !== false)
			{
				if (popVideo.getPlayerState()>0)
				{
					popVideo.pauseVideo();
					popVideo.stopVideo();
				}

				popVideo.loadVideoById(dataSrc);
				popVideo.playVideo();

				$(".video_popup").css({"display" : "block", "opacity" : 0}).stop().animate({"opacity" : 1},motionDelay);
				$(".video_popup .popup_innder li").css({"display" : "block"});
			}
			
			
			return false;
		});

		$(".f03 .video_wrap .video_ul > ul li a").click(function(){
			
			if(!$(this).parent().hasClass("active")){
				if (parseInt($(this).parent().css("margin-left")) < 0)
				{
					if (!motionIng)
					{
						motionIng = true;
						var reIdx = f03sliderIdx - 1;
						if (reIdx < 0)
						{
							reIdx = sliderSize;
						}
						motionSlide("l",reIdx);
						setTimeout(function(){
							motionIng = false;
						},motionDelay+300);
					}
				}else{
					if (!motionIng)
					{
						motionIng = true;
						var reIdx = f03sliderIdx + 1;
						
						if (reIdx > sliderSize)
						{
							reIdx = 0;
						}
						motionSlide("r",reIdx);
						setTimeout(function(){
							motionIng = false;
						},motionDelay+300);
					}
				}
				return false;
			}
			showf03 = $(this).parent().index()-2;
			if(showf03 < 0) {showf03 = 5;}
			else if (showf03 > 5) {showf03 = 0;}


			$(".f03 .video_popup").css({"display":"block"}).animate({"opacity": 1}, motionDelay);
			
			var dataSrc = $(this).attr("data-src");
			if (dataSrc !== false && dataSrc != "" && popVideo && popVideo !== false)
			{
				if (popVideo.getPlayerState()>0)
				{
					popVideo.pauseVideo();
					popVideo.stopVideo();
				}

				popVideo.loadVideoById(dataSrc);
				popVideo.playVideo();

				$(".video_popup").css({"display" : "block", "opacity" : 0}).stop().animate({"opacity" : 1},motionDelay);
				$(".video_popup .popup_innder li").css({"display" : "block"});
			}

			$("video_popup .popup_innder li").eq(showf03).find(".vjs-play-control").focus();			
			
			return false;
		});

		$(".video_popup .popup_innder .close").click(function(){
			$(".video_popup .popup_innder ul > li").css({"display":"none"});
			$(".video_popup").animate({"opacity":0},motionDelay,function(){
				$(this).css({"display":"none"});
			});

			if (popVideo && popVideo !== false)
			{
				if (popVideo.getPlayerState()>0)
				{
					popVideo.pauseVideo();
					popVideo.stopVideo();
				}
			}
			return false;
		});

		$(".f03").keydown(function(e) {
	        if(e.keyCode === 13) { // enter
				//e.preventDefault();			
	        };

	        if((e.keyCode === 9 && !e.shiftKey)){ // tab
				if ($(".f03").is(":focus"))
				{
					e.preventDefault();
					$(".f03 .video_wrap .video_ul > ul > li.active").eq(0).find("> a").focus();			
				}
	        }; 

	        if((e.keyCode === 9 && e.shiftKey)){ // shift+tab
				//e.preventDefault();
				if ($(".f03").is(":focus"))
				{
					e.preventDefault();
					$(".feature.f05 a.detailButton").focus();
				}
	        };
	    });

		$(".f03 .video_wrap .prev_btn").keydown(function(e) {
	        if(e.keyCode === 13) { // enter
				//e.preventDefault();			
	        };

	        if((e.keyCode === 9 && !e.shiftKey)){ // tab
				e.preventDefault();
				$(".f03 .video_wrap .next_btn").focus();
	        }; 

	        if((e.keyCode === 9 && e.shiftKey)){ // shift+tab
				e.preventDefault();
				$(".f03 .video_wrap .video_ul > ul > li.active").find("> a").focus();
				e.stopPropagation();
	        };
	    });

		$(".f03 .video_wrap .video_ul > ul > li > a").keydown(function(e) {
	        if(e.keyCode === 13) { // enter
				e.preventDefault();	
				$(this).click();
				$(".video_popup .popup_innder .close").focus();
	        };

	        if((e.keyCode === 9 && !e.shiftKey)){ // tab
				e.preventDefault();
				if (viewportWidth() > 768)
				{
					$(".f03 .video_wrap .prev_btn").focus();
				}else{
					$(".f03 .video_wrap .carousel li").eq(0).find("a").focus();
				}
				
	        }; 

	        if((e.keyCode === 9 && e.shiftKey)){ // shift+tab
				e.preventDefault();
				$(".f03").focus();
				e.stopPropagation();
	        };
	    });

		$(".f03 .video_wrap .next_btn").keydown(function(e) {
	        if(e.keyCode === 13) { // enter
				//e.preventDefault();			
	        };

	        if((e.keyCode === 9 && !e.shiftKey)){ // tab
				e.preventDefault();
				$(".f03 .video_wrap .carousel li").eq(0).find("a").focus();
	        }; 

	        if((e.keyCode === 9 && e.shiftKey)){ // shift+tab
				e.preventDefault();
				$(".f03 .video_wrap .prev_btn").focus();
	        };
	    });

		$(".f03 .video_wrap .carousel li a").keydown(function(e) {
	        if(e.keyCode === 13) { // enter
				//e.preventDefault();			
	        };

	        if((e.keyCode === 9 && !e.shiftKey)){ // tab
				//e.preventDefault();
	        }; 

	        if((e.keyCode === 9 && e.shiftKey)){ // shift+tab
			if ($(this).parent().index() == 0)
			{
				e.preventDefault();
				if (viewportWidth() > 768)
				{
					$(".f03 .video_wrap .next_btn").focus();
				}else{
					$(".f03 .video_wrap .video_ul > ul li.active").find("> a").focus();
				}
				
			}
	        };
	    });

		$(".kv_slide > li .kv_video .s-btn-encased").keydown(function(e) {
	        if(e.keyCode === 13) { // enter
			e.preventDefault();	
			$(this).click();
			$(".video_popup .popup_innder .close").focus();
	        };

	        if((e.keyCode === 9 && !e.shiftKey)){ // tab
				
	        }; 

	        if((e.keyCode === 9 && e.shiftKey)){ // shift+tab

	        };
	    });
		
	});

	var f03sliderIdx = 0;
	var f03Slider = $(".f03 .video_wrap .video_ul > ul li");
	var sliderFull = $(".f03 .video_wrap .video_ul > ul li").length - 1;
	var sliderSize = $(".f03 .video_wrap .carousel li").length - 1;
	var sliderArray = [3,4,0,1,2,3,4,0,1];
	var omniarray = ["networks home_video:samsung's long and innovative journey turns 5g into reality", "networks home_video:snapshot of korea 5g", "networks home_video:experience the promise of 5g with samsung's 5g mmwave solutions", "networks home_video:how samsung networks helps our partners advance 5g networks in the us - system structure design team", "networks home_video:delivering the promises of 5g today with samsung's radio network solutions"];
	var slide_t;
	var slide_idx;
	function motionSlide(t, idx)
	{
		slide_t = t;
		slide_idx = idx;
		$(".f03 .video_wrap .video_ul > ul li").removeClass("active");
		$(".f03 .video_wrap .video_ul > ul li").removeClass("select");
		$(".f03 .video_wrap .video_ul > ul li").eq(idx+2).addClass("active");
		$(".f03 .video_wrap .carousel li").removeClass("active");
		$(".f03 .video_wrap .carousel li").eq(idx).addClass("active");
			if (slide_t == "r")
			{
				if (f03sliderIdx == sliderSize)
				{
					$(".f03 .video_wrap .video_ul > ul li").eq(sliderFull-1).addClass("active");

					f03Slider.eq(sliderFull).stop().animate({"margin-left": "92%"},motionDelay, function(){
						f03Slider.eq(1).css({"margin-left":"-92%"});
						$(this).css({"margin-left":((sliderSize + 1) * 100) + "%"});
					});
					f03Slider.eq(sliderFull-1).stop().animate({"margin-left": "9%"},motionDelay, function(){
						f03Slider.eq(2).css({"margin-left":"9%"});
						$(this).css({"margin-left": ((sliderSize) * 100) + "%"});
					});
					f03Slider.eq(sliderFull-2).stop().animate({"margin-left": "-75%"},motionDelay, function(){
						f03Slider.eq(3).css({"margin-left":"75%"});
						$(this).css({"margin-left": ((sliderSize-1) * 100) + "%"});
					});
					f03Slider.eq(sliderFull-3).stop().animate({"margin-left": "-150%"},motionDelay, function(){
						f03Slider.eq(4).css({"margin-left":"150%"});
						$(this).css({"margin-left": ((sliderSize-2) * 100) + "%"});
					});
					
					setTimeout(function(){
						console.log('two');
						$(".f03 .video_wrap .video_ul > ul li").eq(sliderFull-1).removeClass("active");
						for (var i = 0;i <= sliderFull ; i++ )
						{
							if (i < slide_idx + 2)
							{
								var movePosition = slide_idx + 2 - i;
								f03Slider.eq(i).stop().css({"margin-left":-(movePosition * 100) + "%"});
							}else if (i > slide_idx + 2)
							{
								var movePosition = i - slide_idx - 2;
								f03Slider.eq(i).stop().css({"margin-left": (movePosition * 100) + "%"});
							}else{
								f03Slider.eq(i).stop().css({"margin-left":"0%"});
							}
						}
					},motionDelay);
				}else{
					for (var i = 0;i <= sliderFull ; i++ )
					{
						if (i < slide_idx + 2)
						{
							var movePosition = slide_idx + 2 - i;
							f03Slider.eq(i).stop().animate({"margin-left":-(movePosition * 100) + "%"},motionDelay);
						}else if (i > slide_idx + 2)
						{
							var movePosition = i - slide_idx - 2;
							f03Slider.eq(i).stop().animate({"margin-left": (movePosition * 100) + "%"},motionDelay);
						}else{
							f03Slider.eq(i).stop().animate({"margin-left":"9%"},motionDelay);
						}
					}
				}
			}else{
				if (f03sliderIdx == 0)
				{
					$(".f03 .video_wrap .video_ul > ul li").eq(1).addClass("active");

					f03Slider.eq(0).stop().animate({"margin-left": "-75%"},motionDelay, function(){
						f03Slider.eq(sliderFull-3).css({"margin-left":"-75%"});
						$(this).css({"margin-left":((sliderSize + 1) * 100) + "%"});
					});
					f03Slider.eq(1).stop().animate({"margin-left": "9%"},motionDelay, function(){
						f03Slider.eq(sliderFull-2).css({"margin-left":"9%"});
						$(this).css({"margin-left": ((sliderSize) * 100) + "%"});
					});
					f03Slider.eq(2).stop().animate({"margin-left": "75%"},motionDelay, function(){
						f03Slider.eq(sliderFull-1).css({"margin-left":"75%"});
						$(this).css({"margin-left": ((sliderSize-1) * 100) + "%"});
					});
					f03Slider.eq(3).stop().animate({"margin-left": "150%"},motionDelay, function(){
						f03Slider.eq(sliderFull).css({"margin-left":"150%"});
						$(this).css({"margin-left": ((sliderSize-2) * 100) + "%"});
					});
					
					setTimeout(function(){
						for (var i = 0;i <= sliderFull ; i++ )
						{
							if (i < slide_idx + 2)
							{
								var movePosition = slide_idx + 2 - i;
								f03Slider.eq(i).stop().css({"margin-left":-(movePosition * 100) + "%"});
							}else if (i > slide_idx + 2)
							{
								var movePosition = i - slide_idx - 2;
								f03Slider.eq(i).stop().css({"margin-left": (movePosition * 100) + "%"});
							}else{
								f03Slider.eq(i).stop().css({"margin-left":"9%"});
							}
						}
					},motionDelay);
				}else{
					for (var i = 0;i <= sliderFull ; i++ )
					{
						if (i < slide_idx + 2)
						{
							var movePosition = slide_idx + 2 - i;
							f03Slider.eq(i).stop().animate({"margin-left":-(movePosition * 100) + "%"},motionDelay);
						}else if (i > slide_idx + 2)
						{
							var movePosition = i - slide_idx -2;
							f03Slider.eq(i).stop().animate({"margin-left": (movePosition * 100) + "%"},motionDelay);
						}else{
							f03Slider.eq(i).stop().animate({"margin-left":"9%"},motionDelay);
						}
					}
				}
				
			}
			f03sliderIdx = slide_idx;
			setTimeout(function() {
				$(".f03 .video_wrap .video_ul > ul li").removeClass("select");
				console.log("console", (idx+2));
				$(".f03 .video_wrap .video_ul > ul li").eq(idx+2).addClass("select");
			}, 1300);
			$('.f03 .video_wrap .video_ul li a').eq(idx+1).attr('data-omni-type','microsite_pcontentinte');
			$('.f03 .video_wrap .video_ul li a').eq(idx+1).attr('data-omni','rolling:left_click');
			$('.f03 .video_wrap .video_ul li a').eq(idx+2).attr('data-omni-type','microsite_b2bcontent');
			$('.f03 .video_wrap .video_ul li a').eq(idx+2).attr('data-omni',omniarray[idx])
			$('.f03 .video_wrap .video_ul li a').eq(idx+3).attr('data-omni-type','microsite_pcontentinte');
			$('.f03 .video_wrap .video_ul li a').eq(idx+3).attr('data-omni','rolling:right_click');
			console.log("console", (idx));
	}


	var scrollTop = 0;
	var f02Motion = false;
	var f03Motion = false;
	var f04Motion = false;
	var f05Motion = false;
	var f02Start;
	var f03Start;
	var f04Start;
	var f05Start;
	setTimeout(function() {
		$(window).scroll(onScroll);
	}, 1000);
	function onScroll()
	{
		scrollTop = $(window).scrollTop();
		//console.log("scrollTop : " + scrollTop);
		f02Start = $(".f02").offset().top - $(window).outerHeight();
		f03Start = $(".f03").offset().top - $(window).outerHeight();
		f04Start = $(".f04 .column_ul").offset().top - $(window).outerHeight();
		f05Start = $(".f05 .column_ul").offset().top - $(window).outerHeight();

		if (scrollTop > f02Start)
		{
			if (!f02Motion)
			{
				f02Motion = true;
				showMotion("f02");
			}
		}else{
			if (f02Motion)
			{
				f02Motion = false;
				resetMotion("f02");
			}
		}

		if (scrollTop > f03Start)
		{
			if (!f03Motion)
			{
				f03Motion = true;
				showMotion("f03");
			}
		}else{
			if (f03Motion)
			{
				f03Motion = false;
				resetMotion("f03");
			}
		}

		if (scrollTop > f04Start)
		{
			if (!f04Motion)
			{
				f04Motion = true;
				showMotion("f04");
			}
		}else{
			if (f04Motion)
			{
				f04Motion = false;
				resetMotion("f04");
			}
		}

		if (scrollTop > f05Start)
		{
			if (!f05Motion)
			{
				f05Motion = true;
				showMotion("f05");
			}
		}else{
			if (f05Motion)
			{
				f05Motion = false;
				resetMotion("f05");
			}
		}

		f03ScrollTop = $(window).scrollTop();
		var f03Out = $(".f03").offset().top + $(".f03").outerHeight();
		if (f03ScrollTop > f03Out)
		{
		
		}
	}


	var showf03 = 0;
	var motionDelay = 600;
	function showMotion(f)
	{
		switch (f)
		{
			case "f02":
			{
				$(".f02 .tab_ul li").eq(0).css({"transition":"all 0.6s", "transform":"translate(0px, 0px)", "opacity":1});
				$(".f02 .tab_ul li").eq(1).css({"transition":"all 0.6s", "transform":"translate(0px, 0px)", "opacity":1});
				$(".f02 .contents_ul > li").eq(0).find(".contents li").eq(0).css({"transition":"all 0.6s 0.1s", "transform":"translate(0px, 0px)", "opacity":1});
				$(".f02 .contents_ul > li").eq(0).find(".contents li").eq(1).css({"transition":"all 0.6s 0.2s", "transform":"translate(0px, 0px)", "opacity":1});
				$(".f02 .contents_ul > li").eq(0).find(".contents li").eq(2).css({"transition":"all 0.6s 0.3s", "transform":"translate(0px, 0px)", "opacity":1});
				$(".f02 .contents_ul > li").eq(0).find(".contents li").eq(3).css({"transition":"all 0.6s 0.4s", "transform":"translate(0px, 0px)", "opacity":1});
				$(".f02 .contents_ul > li").eq(0).find(".contents li").eq(4).css({"transition":"all 0.6s 0.5s", "transform":"translate(0px, 0px)", "opacity":1});
				$(".f02 .contents_ul > li").eq(0).find(".contents li").eq(5).css({"transition":"all 0.6s 0.6s", "transform":"translate(0px, 0px)", "opacity":1});
				break;
			}
			case "f03":
			{
				$(".f03 .video_wrap .video_ul > ul li").css({"transition":"all 1.0s cubic-bezier(0.215, 0.610, 0.355, 1.000)", "transform":"translate(0px, 0px)", "opacity":1});
				$(".f03 .video_wrap .video_ul > ul li").css({"transition":"all 1.0s cubic-bezier(0.215, 0.610, 0.355, 1.000)", "transform":"translate(0px, 0px)", "opacity":1});
				$(".f03 .video_wrap .video_ul > ul li .video_txt").css({"transition":"all 0.5s cubic-bezier(0.215, 0.610, 0.355, 1.000) 0.3s", "transform":"translate(0px, 0px)", "opacity":1});
				$(".f03 .video_wrap .carousel").css({"transition":"all 0.5s cubic-bezier(0.215, 0.610, 0.355, 1.000) 0.6s", "transform":"translate(0px, 0px)", "opacity":1});
				$(".f03 .video_wrap .video_bg").css({"transition":"all 1.2s cubic-bezier(0.215, 0.610, 0.355, 1.000) 0.2s", "transform":"translate(0px, 0px)", "opacity":1});

				setTimeout(function(){
					$(".f03 .video_wrap .video_ul > ul li").css({"transition":"none"});
				},1000);
				break;
			}	
			case "f04":
			{
				if (viewportWidth() > 768)
				{
					$(".f04 .column_ul > li").eq(0).css({"transition":"all 1.0s cubic-bezier(0.215, 0.610, 0.355, 1.000)", "transform":"translate(0px, 0px)", "opacity":1});
					$(".f04 .column_ul > li").eq(1).css({"transition":"all 1.0s cubic-bezier(0.215, 0.610, 0.355, 1.000) 0.3s", "transform":"translate(0px, 0px)", "opacity":1});
					$(".f04 .column_ul > li").eq(2).css({"transition":"all 1.0s cubic-bezier(0.215, 0.610, 0.355, 1.000) 0.6s", "transform":"translate(0px, 0px)", "opacity":1});
				}else{
					$(".f04 .column_ul > li").eq(showPage04).css({"transition":"all 1.0s cubic-bezier(0.215, 0.610, 0.355, 1.000)", "transform":"translate(0px, 0px)", "opacity":1});
					setTimeout(function(){
						$(".f04 .column_ul > li").css({"transition":"none", "transform":"translate(0px, 0px)", "opacity":1});
					},1000);
					
				}
				
				break;
			}
			case "f05":
			{
				if (viewportWidth() > 768)
				{
					$(".f05 .column_ul > li").eq(0).css({"transition":"all 1.0s cubic-bezier(0.215, 0.610, 0.355, 1.000)", "transform":"translate(0px, 0px)", "opacity":1});
					$(".f05 .column_ul > li").eq(1).css({"transition":"all 1.0s cubic-bezier(0.215, 0.610, 0.355, 1.000) 0.3s", "transform":"translate(0px, 0px)", "opacity":1});
					$(".f05 .column_ul > li").eq(2).css({"transition":"all 1.0s cubic-bezier(0.215, 0.610, 0.355, 1.000) 0.6s", "transform":"translate(0px, 0px)", "opacity":1});
				}else{
					$(".f05 .column_ul > li").eq(showPage04).css({"transition":"all 1.0s cubic-bezier(0.215, 0.610, 0.355, 1.000)", "transform":"translate(0px, 0px)", "opacity":1});
					setTimeout(function(){
						$(".f05 .column_ul > li").css({"transition":"none", "transform":"translate(0px, 0px)", "opacity":1});
					},1000);
					
				}
				
				break;
			}
		}
	}


	function resetMotion(f)
	{
		switch (f)
		{
			case "f02":
			{
				$(".f02 .tab_ul li").eq(0).css({"transition":"none", "transform":"", "opacity":0});
				$(".f02 .tab_ul li").eq(1).css({"transition":"none", "transform":"", "opacity":0});
				$(".f02 .contents_ul > li").eq(0).find(".contents li").eq(0).css({"transition":"none", "transform":"", "opacity":0});
				$(".f02 .contents_ul > li").eq(0).find(".contents li").eq(2).css({"transition":"none", "transform":"", "opacity":0});
				$(".f02 .contents_ul > li").eq(0).find(".contents li").eq(1).css({"transition":"none", "transform":"", "opacity":0});
				$(".f02 .contents_ul > li").eq(0).find(".contents li").eq(3).css({"transition":"none", "transform":"", "opacity":0});
				$(".f02 .contents_ul > li").eq(0).find(".contents li").eq(4).css({"transition":"none", "transform":"", "opacity":0});
				$(".f02 .contents_ul > li").eq(0).find(".contents li").eq(5).css({"transition":"none", "transform":"", "opacity":0});


				break;
			}
			case "f03":
			{
				$(".f03 .video_wrap .video_ul > ul li").css({"transition":"none", "transform":"", "opacity":0});
				$(".f03 .video_wrap .video_ul > ul li").css({"transition":"none", "transform":"", "opacity":0});
				$(".f03 .video_wrap .video_ul > ul li .video_txt").css({"transition":"none", "transform":"", "opacity":0});
				$(".f03 .video_wrap .carousel").css({"transition":"none", "transform":"", "opacity":0});
				$(".f03 .video_wrap .video_bg").css({"transition":"none", "transform":"", "opacity":0});
				
				break;
			}
			case "f04":
			{
				$(".f04 .column_ul > li").css({"transition":"none", "transform":"", "opacity":0});
				break;
			}	
			case "f05":
			{
				$(".f05 .column_ul > li").css({"transition":"none", "transform":"", "opacity":0});
				break;
			}	
		}
	}

	var youtubeAPI_Able = false;
	function youtubeAPI_Load()
	{
		youtubeAPI_Able = true;
		var tag = document.createElement('script');
		tag.src = "https://www.youtube.com/iframe_api";
		var firstScriptTag = document.getElementsByTagName('script')[0];
		firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
	}

	var popVideo;
	window.onYouTubeIframeAPIReady = function()
	{
		console.log("onYouTubeIframeAPIReady");
		popVideo = document.getElementById("videoArea");

		var vID = "";
		popVideo = new YT.Player('videoArea', {
			height: '608',
			width: '1080',
			videoId: vID,
			playerVars: { 'autoplay': 0, 'controls': 1,'autohide':1,'wmode':'opaque','rel':0 },
			events: {
				'onReady': onPlayerReady,
				'onStateChange': onPlayerStateChange
			}
		});
	}

	function onPlayerReady(event)
	{
		console.log("onPlayerReady");
	}

	function onPlayerStateChange(event)
	{
		if (event.data == YT.PlayerState.PLAYING) {
		}
	}



	function viewportWidth() 
	{  
		if (typeof document.documentElement.clientWidth != 'undefined' && typeof window.innerWidth != 'undefined')  
		{
			if(document.documentElement.clientWidth > window.innerWidth)
				return document.documentElement.clientWidth;
			else
				return window.innerWidth;  
		}else if (typeof document.documentElement != 'undefined' && typeof document.documentElement.clientWidth != 'undefined' && document.documentElement.clientWidth != 0)
		{
			return document.documentElement.clientWidth;  
		}else{
			return viewportwidth = document.getElementsByTagName('body')[0].clientWidth;
		} 
	}

	function check_device(){
		var mobileKeyWords = new Array('iPhone', 'iPad', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson'); //160625 device 목록에 ipad 추가
		var device_name = '';
		for (var word in mobileKeyWords){
			if (navigator.userAgent.match(mobileKeyWords[word]) != null){
				device_name = mobileKeyWords[word];
				break;
			}
		}
		
		return device_name;
	}


	var showPage04 = 0;
	var showPage05 = 0;
	var f05touchMoves = 0;


	// responsiveImg
	$(function(){
		var options = {
			size: [
				{device:'web',size:null},
				{device:'mobile',size:768}
				
			]
		}
			,list = []
			,win = $(window)
			,before_model = null
			,inited = false
			,chkWidth = 1440;

		function cal(width){
			var model = '';
			chkWidth = 1440;
			model = 'web';
			
			for(var i = 0;i < options.size.length; i++)
			{
				if(options.size[i].size>=width && options.size[i].size <= chkWidth)
				{
					model = options.size[i].device;
					if(options.size[i].size != null)
						chkWidth = options.size[i].size;
				}
			}
			return model;
		}
		function sort_func(a,b){
			return a.size == null ? false : b.size == null ? true : (a.size > b.size);
		}
		function resize(){
			var w = viewportWidth();

			var model = cal(w);
			if(model == before_model) return;
			before_model = model;
			$.each(list,function(i,elem){
				var src = null;
				
				(src = elem.getAttribute('data-media-'+model)) && (elem.src != src) && (elem.src = src);
			});
		}
		function init(args,THIS){
			if(args){
				$.extend(options,args);
			}
			list = $(THIS);
			options.size.sort(sort_func);
			inited || win.on('resize',resize) && (inited = true)
			resize();

			function getInternetExplorerVersion()
			{
			  var rv = -1; // Return value assumes failure.
			  if (navigator.appName == 'Microsoft Internet Explorer')
			  {
				var ua = navigator.userAgent;
				var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
				if (re.exec(ua) != null)
				  rv = parseFloat( RegExp.$1 );
			  }
			  return rv;
			}
			var ieVersion = getInternetExplorerVersion();
			if (ieVersion == 8) {
				document.body.onresize = function () {
					resize();
				};
			}
			else {
				window.addEventListener("resize", resize);		
			}
		}
		function refresh(elem){
			list = $(elem);
		}
		var method = {
			init: init,
			refresh: refresh
		}
		$.fn.responsive = function(args){
			if(typeof args == 'undefined'){
				method['init'](null,this);
			}else if(typeof args == 'object'){
				method['init'](args,this);
			}else if(typeof args == 'string' && method[args]){
				method[args](this);
			}
			return this;
		}


		$('img.responsiveImg').responsive({
			size:[
				{device:'web',size:null},
				{device:'mobile',size:768}
			]
		});
	});

	// 210414 Mobile Tab Focus
	var pageMode;
	$(function() {
		$(window).on('load resize', function() {
			pageMode = (window.innerWidth > 768 ? 'pc' : 'm');
		});

		$('.column_ul').on('focus', 'li a', function() {
			if (pageMode === 'm') {
				var f = $(this).parents('.feature');

				var act = f.find('> ul:not(.column_ul)').find('li a.active').parent().index();
				var idx = $(this).parent().index();

				if (act !== idx) {
					$(this).parents('.column_ul').find('li').eq(act).find('a').focus();
					return false;
				}
			}
		});

		$('.column_ul').on('keydown', 'li a', function(e) {
			if (pageMode === 'm' && e.keyCode === 9) {
				var f = $(this).parents('.feature');

				if (e.shiftKey) {
					f.focus();
					return false;
				} else {
					f.find('> ul:not(.column_ul)').find('li').first().find('a').focus();
					return false;
				}
			}
		});

		$('.feature').on('keydown', '> ul:not(.column_ul) li a', function(e) {
			if (pageMode === 'm' && e.keyCode === 9) {
				var f = $(this).parents('.feature');

				var act = f.find('> ul:not(.column_ul)').find('li a.active').parent().index();
				var idx = $(this).parent().index();

				if (idx === 0 && e.shiftKey) {
					f.find('.column_ul').find('li').eq(act).find('a').focus();
					return false;
				}
			}
		});
	});
});