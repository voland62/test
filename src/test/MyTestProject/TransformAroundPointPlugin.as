/**
 * VERSION: 2.12
 * DATE: 2011-02-22
 * AS3
 * UPDATES AND DOCS AT: http://www.greensock.com
 **/
package test.MyTestProject
{
	import com.greensock.plugins.ShortRotationPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.*;
	import com.greensock.core.*;
	
	import flash.display.*;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;

	public class TransformAroundPointPlugin extends TweenPlugin {
		/** @private **/
		public static const API:Number = 1.0; //If the API/Framework for plugins changes in the future, this number helps determine compatibility
		/** @private **/
		private static var _classInitted:Boolean;
		/** @private **/
		private static var _isFlex:Boolean;
		
		/** @private **/
		protected var _target:DisplayObject;
		/** @private **/
		protected var _local:Point;
		/** @private **/
		protected var _point:Point;
		/** @private **/
		protected var _shortRotation:ShortRotationPlugin;
		
		/** @private **/
		protected var _proxy:DisplayObject;
		/** @private **/
		protected var _proxySizeData:Object;
		/** @private **/
		protected var _useAddElement:Boolean;
		
		/** @private **/
		public function TransformAroundPointPlugin() {
			super();
			this.propName = "transformAroundPoint";
			this.overwriteProps = ["x","y"];
			this.priority = -1; //so that the x/y tweens occur BEFORE the transformAroundPoint is applied
		}
		
		/** @private **/
		override public function onInitTween(target:Object, value:*, tween:TweenLite):Boolean {
			if (!(value.point is Point)) {
				return false;
			}
			_target = target as DisplayObject;
			if (value.pointIsLocal == true) {
				_local = value.point.clone();
				_point = _target.parent.globalToLocal(_target.localToGlobal(_local));
			} else {
				_point = value.point.clone();
				_local = _target.globalToLocal(_target.parent.localToGlobal(_point));
			}
			
			if (!_classInitted) {
				try {
					_isFlex = Boolean(getDefinitionByName("mx.managers.SystemManager")); // SystemManager is the first display class created within a Flex application
				} catch (e:Error) {
					_isFlex = false;
				}
				_classInitted = true;
			}
			
			if ((!isNaN(value.width) || !isNaN(value.height)) && _target.parent != null) {
				var m:Matrix = _target.transform.matrix;
				var point:Point = _target.parent.globalToLocal(_target.localToGlobal(new Point(100, 100)));
				_target.width *= 2;
				if (point.x == _target.parent.globalToLocal(_target.localToGlobal(new Point(100, 100))).x) { //checks to see if the width change also alters where the 100,100 point is in the parent, essentially telling us whether or not the width change also effectively changed the scale, but we can't just check the scaleX because rotation would affect it and there are some inconsistencies in the way Adobe's classes/components work.
					_proxy = _target;
					_target.rotation = 0;
					_proxySizeData = {};
					if (!isNaN(value.width)) {
						addTween(_proxySizeData, "width", _target.width / 2, value.width, "width"); //Components that alter their width without scaling will treat their width/height setters as though they were applied without any rotation, so we must handle these separately. If we just allow the width/height tweens to affect the Sprite and copy those values over to the _proxy, it won't behave properly.
					}
					if (!isNaN(value.height)) {
						addTween(_proxySizeData, "height", _target.height, value.height, "height");
					}
					var b:Rectangle = _target.getBounds(_target);
					var s:Sprite = new Sprite();
					var container:Sprite = _isFlex ? new (getDefinitionByName("mx.core.UIComponent"))() : new Sprite(); //in Flex, any thing we addChild() must be a UIComponent so we wrap our Sprite in one.
					container.addChild(s);
					container.visible = false;
					_useAddElement = Boolean(_isFlex && _proxy.parent.hasOwnProperty("addElement"));
					if (_useAddElement) {
						Object(_proxy.parent).addElement(container);
					} else {
						_proxy.parent.addChild(container);
					}
					_target = s;
					s.graphics.beginFill(0x0000FF, 0.4);
					s.graphics.drawRect(b.x, b.y, b.width, b.height);
					s.graphics.endFill();
					_proxy.width /= 2; //we must reset the width even though we're applying the transform.matrix after this because some components don't flow the transform.matrix values through to the width value (bug/inconsistency in Adobe's stuff)
					s.transform.matrix = _target.transform.matrix = m;
				} else {
					_target.width /= 2; //we must reset the width even though we're applying the transform.matrix after this because some components don't flow the transform.matrix values through to the width value (bug/inconsistency in Adobe's stuff)
					_target.transform.matrix = m;
				}
			}
			
			var p:String, short:ShortRotationPlugin, sp:String;
			for (p in value) {
				if (p == "point" || p == "pointIsLocal") {
					//ignore - we already set it above
				} else if (p == "shortRotation") {
					_shortRotation = new ShortRotationPlugin();
					_shortRotation.onInitTween(_target, value[p], tween);
					addTween(_shortRotation, "changeFactor", 0, 1, "shortRotation");
					for (sp in value[p]) {
						this.overwriteProps[this.overwriteProps.length] = sp;
					}
				} else if (p == "x" || p == "y") {
					addTween(_point, p, _point[p], value[p], p);
				} else if (p == "scale") {
					addTween(_target, "scaleX", _target.scaleX, value.scale, "scaleX");
					addTween(_target, "scaleY", _target.scaleY, value.scale, "scaleY");
					this.overwriteProps[this.overwriteProps.length] = "scaleX";
					this.overwriteProps[this.overwriteProps.length] = "scaleY";
				} else if ((p == "width" || p == "height") && _proxy != null) {
					//let the proxy handle width/height
				} else {
					addTween(_target, p, _target[p], value[p], p);
					this.overwriteProps[this.overwriteProps.length] = p;
				}
			}
			
			if (tween != null) {
				var enumerables:Object = tween.vars; 
				if ("x" in enumerables || "y" in enumerables) { //if the tween is supposed to affect x and y based on the original registration point, we need to make special adjustments here...
					var endX:Number, endY:Number;
					if ("x" in enumerables) {
						endX = (typeof(enumerables.x) == "number") ? enumerables.x : _target.x + Number(enumerables.x);
					}
					if ("y" in enumerables) {
						endY = (typeof(enumerables.y) == "number") ? enumerables.y : _target.y + Number(enumerables.y);
					}
					tween.killVars({x:true, y:true}, false); //we're taking over.
					this.changeFactor = 1;
					if (!isNaN(endX)) {
						addTween(_point, "x", _point.x, _point.x + (endX - _target.x), "x");
					}
					if (!isNaN(endY)) {
						addTween(_point, "y", _point.y, _point.y + (endY - _target.y), "y");
					}
					this.changeFactor = 0;
				}
			}
			
			return true;
		}
		
		/** @private **/
		override public function killProps(lookup:Object):void {
			if (_shortRotation != null) {
				_shortRotation.killProps(lookup);
				if (_shortRotation.overwriteProps.length == 0) {
					lookup.shortRotation = true;
				}
			}
			super.killProps(lookup);
		}
		
		/** @private **/
		override public function set changeFactor(n:Number):void {
			if (_proxy != null && _proxy.parent != null) {
				if (_useAddElement) {
					Object(_proxy.parent).addElement(_target.parent);
				} else {
					_proxy.parent.addChild(_target.parent);
				}
			}
			var val:Number, x:Number, y:Number;
			if (_target.parent) {
				var p:Point, pt:PropTween, i:int = _tweens.length;
				if (this.round) {
					while (--i > -1) {
						pt = _tweens[i];
						val = pt.start + (pt.change * n);
						pt.target[pt.property] = (val > 0) ? int(val + 0.5) : int(val - 0.5); //4 times as fast as Math.round()
					}
					p = _target.parent.globalToLocal(_target.localToGlobal(_local));
					x = _target.x + _point.x - p.x;
					y = _target.y + _point.y - p.y;
					_target.x = (x > 0) ? int(x + 0.5) : int(x - 0.5); //4 times as fast as Math.round()
					_target.y = (y > 0) ? int(y + 0.5) : int(y - 0.5); //4 times as fast as Math.round()
				} else {
					while (--i > -1) {
						pt = _tweens[i];
						pt.target[pt.property] = pt.start + (pt.change * n);
					}
					p = _target.parent.globalToLocal(_target.localToGlobal(_local));
					_target.x += _point.x - p.x;
					_target.y += _point.y - p.y;
				}
			}
			_changeFactor = n;
			if (_proxy != null && _proxy.parent != null) {
				var r:Number = _target.rotation;
				_proxy.rotation = _target.rotation = 0;
				if (_proxySizeData.width != undefined) {
					_proxy.width = _target.width = _proxySizeData.width;
				}
				if (_proxySizeData.height != undefined) {
					_proxy.height = _target.height = _proxySizeData.height;
				}
				_proxy.rotation = _target.rotation = r;
				
				p = _target.parent.globalToLocal(_target.localToGlobal(_local));
				x = _target.x + _point.x - p.x;
				y = _target.y + _point.y - p.y;
				if (this.round) {
					_proxy.x = (x > 0) ? int(x + 0.5) : int(x - 0.5); //4 times as fast as Math.round()
					_proxy.y = (y > 0) ? int(y + 0.5) : int(y - 0.5); //4 times as fast as Math.round()
				} else {
					_proxy.x = x;
					_proxy.y = y;
				}
				if (_useAddElement) {
					Object(_proxy.parent).removeElement(_target.parent);
				} else {
					_proxy.parent.removeChild(_target.parent);
				}
			}
		}

	}
}