package com.onlyplay.util
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;

	import org.flintparticles.common.renderers.Renderer;
	import org.flintparticles.twoD.emitters.Emitter2D;

	import flash.geom.Point;

	/**
	 * @author Andrew
	 */
	public class SparklerFire
	{
		public function SparklerFire(renderer : Renderer, p1 : Point, p3 : Point, t:Number)
		{
			var emitter : Emitter2D = new Sparkler();
			renderer.addEmitter(emitter);

			var p2 : Point = Point.interpolate(p1, p3, 0.5);
			// new Point ( 300, 300 );
			var distance : Number = Point.distance(p1, p3);
			p2 = p2.add(new Point(0, -distance * 0.4));
			// trace('p2: ' + (p2));

			emitter.x = p1.x;
			emitter.y = p1.y;

			TweenMax.to(emitter, t, {bezier:[{x:p2.x, y:p2.y}, {x:p3.x, y:p3.y}], ease:Linear.easeOut, onComplete:foo});
			emitter.start();
			function  foo() : void
			{
				emitter.stop();
				emitter.killAllParticles();
			}
			;
		}
	}
}
