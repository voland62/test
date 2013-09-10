package com
{
	import flash.display.Sprite;

	public class to_dell2 extends Sprite
	{
		public function to_dell2()
		{
			var obj:A = new B();
			obj;
		}
	}
}
import flash.geom.Point;

class A
{
	protected var _p : Point;

	public function A()
	{		
		trace ( _p );
	}
}
class B extends A
{
	public function B()
	{
		_p = new Point(23);
		super();
	}
}