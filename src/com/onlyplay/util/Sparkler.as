package com.onlyplay.util
{
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.actions.Fade;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.displayObjects.Star;
	import org.flintparticles.common.easing.Quadratic;
	import org.flintparticles.common.initializers.ImageClass;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.common.initializers.ScaleImageInit;
	import org.flintparticles.twoD.actions.Accelerate;
	import org.flintparticles.twoD.actions.DeathZone;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.twoD.initializers.Velocity;
	import org.flintparticles.twoD.zones.DiscZone;
	import org.flintparticles.twoD.zones.RectangleZone;
	
	/**
	 * @author Andrew
	 */
	public class Sparkler extends Emitter2D
	{
		public function Sparkler()
		{
			counter = new Steady(200);
			// emitter.counter = new Blast(100);
			// emitter.addInitializer(new ImageClass(RadialDot, [2]));
			addInitializer(new ImageClass(Star, [5]));
			// emitter.addInitializer(new Position(new LineZone(new Point(-5, -5), new Point(505, -5))));
			addInitializer(new Position(new DiscZone(null, 10)));
			// emitter.addInitializer(new Velocity(new PointZone(new Point(0, 0))));
			addInitializer(new Velocity(new DiscZone(null, 6)));
			addInitializer(new ScaleImageInit(0.75, 2));
			// emitter.addAction( new RandomDrift( 100, 100) );
			addInitializer(new Lifetime(0.1, 0.4));
			addAction(new Age(Quadratic.easeOut));
			addAction(new Move());
			addAction(new Fade());
			addAction(new Accelerate(0, 50));
			// emitter.addAction(new LinearDrag(0.5));
			addAction(new Move());
			addAction(new DeathZone(new RectangleZone(-10, -10, 520, 420), true));
		}

		
	}
}
