package
{
	import com.onlyplay.slotmatch3.components.games.WinBubble;
	import flash.media.Video;
	import tutorial.Person;

	import com.onlyplay.slotmatch3.components.games.Parser;

	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;

	/**
	 * @author Andrew
	 */
	[SWF(backgroundColor="#5c5c5c", frameRate="31", width="640", height="480")]
	public class to_dell extends Sprite
	{
		// [Embed(source="assets/facebook/facebook/id_6/id_6/background-ipadhd.png", mimeType="image/png")]
		// private static var BgClass : Class;
		//
		// [Embed(source="assets/facebook/facebook/id_6/id_6/background-ipadhd.png", mimeType="image/png")]
		// private static var Bg2Class : Class;
		[Embed(source="assets/lib.swf", symbol="bomb_")]
		private var BombClass : Class;
		[Embed(source="assets/lib.swf", symbol="charge_")]
		private var ChargeClass : Class;
		[Embed(source="assets/s/s/game_icons_horisontdeleteiconan.swf")]
		private var FlashClass : Class;
		// [Embed(source="assets/s/f/game_icons_horisontdeleteiconanimation.flv", mimeType="video/flv")]
		// private var VideoClass: Class;
		//
		[Embed( source="assets/font/FranklinGothicDemiC.otf", 
		fontName="franklin_"
		, embedAsCFF="false"
		// ,mimeType="application/x-font"
		// ,unicodeRange = "U+0041-U+005A,U+0061-U+007A,U+0033,U+0030-U+0039 "
		)]
		private var franklin : Class;
		private var tf : TextField;

		public static function drawCircleSegment(graphics : Graphics, center : Point, start : Number, end : Number, r : Number, h_ratio : Number = 1, v_ratio : Number = 1, new_drawing : Boolean = true) : void
		{
			

			
			var x : Number = center.x;
			var y : Number = center.y;
			// first point of the circle segment
			graphics.moveTo(center.x, center.y);
			if (new_drawing)
			{
				graphics.lineTo(x + Math.cos(start) * r * h_ratio, y + Math.sin(start) * r * v_ratio);
			}

			// draw the circle in segments
			var segments : uint = 8;

			var theta : Number = (end - start) / segments;
			var angle : Number = start;
			// start drawing at angle ...

			var ctrlRadius : Number = r / Math.cos(theta / 2);
			// this gets the radius of the control point
			for (var i : int = 0; i < segments; i++)
			{
				// increment the angle
				angle += theta;
				var angleMid : Number = angle - (theta / 2);
				// calculate our control point
				var cx : Number = x + Math.cos(angleMid) * (ctrlRadius * h_ratio);
				var cy : Number = y + Math.sin(angleMid) * (ctrlRadius * v_ratio);
				// calculate our end point
				var px : Number = x + Math.cos(angle) * r * h_ratio;
				var py : Number = y + Math.sin(angle) * r * v_ratio;
				// draw the circle segment
				graphics.curveTo(cx, cy, px, py);
			}
		}

		public function to_dell()
		{
			
			
			var winAnim:WinBubble = new WinBubble( "0123456789" );
			addChild(winAnim);
			
			winAnim.x = stage.stageWidth >> 1;
			winAnim.y = stage.stageHeight >> 1;
			
			return;
			
						//var r = Math.random() - 0.5;
			
			for (var i : int = 0; i < 100; i++) 
			{
				var r = int(Math.random() + 0.5);
				log(r);
				log(Math.random() > 0.5);
			}
			
			return;
			
			var flash : MovieClip = new FlashClass();
			// log(flash.loaderInfo.content);

			// log(flash.movieClipData);
			log(flash.dataClass);
			
			
			

			for (var prop : String in flash)
			{
				log(prop, flash[prop]);
				
				
			}

			flash.addEventListener(Event.ENTER_FRAME, onEnterFrame);

			addChild(flash);
			return;



			var bomb : Sprite = new BombClass();
			bomb.x = bomb.y = 100;
			addChild(bomb);

			var bomb2 : Sprite = new bomb_();
			addChild(bomb2);
			bomb2.x = bomb2.y = 200;
			return;

			log(Math.PI / 2);
			log(Math.PI * 0.5);
			log(Math.PI >> 1);
			log(Math.PI << 1);

			return;

			var container : Sprite = new Sprite();
			container.x = 100;
			container.y = 100;
			addChild(container);

			container.graphics.beginFill(0xFF0000);

			drawCircleSegment(container.graphics, new Point(0, 0), Math.PI * 3 / 4, 9 / 4 * Math.PI, 80);
			container.graphics.endFill();

			return;

			// log(this["loader"]);
			// log(flash["loader"]);

			// var bg:Bitmap = new Ass.BgClass();
			// addChild(bg);

			return;

			var p1 : Point = new Point();
			var p2 : Point = new Point();

			log(p1 == p2);
			log(p1 === p2);

			log(p1.equals(p2));

			switch(p1)
			{
				case p2:
					log("cool");
					break;
				default:
					log("bolt");
			}

			return;

			log(5.99 >> 1);
			log(5 * 0.5);

			var base : Number = 100;

			log(53 % base);
			log(123 % base);
			log(-3 % base);
			log(-105 % base);

			return;
			// // // // // // // //
			var arr : Array = [];
			for (var i : int = 0; i < 25; i++)
			{
				arr.push(i);
			}

			log(arr);

			var newArr : Array = Parser.parseSpinData(arr);
			log(newArr[4]);

			return;

			Font.registerFont(franklin);

			trace("to_dell.to_dell()");

			var textFormat : TextFormat = new TextFormat();
			textFormat.size = 16;
			textFormat.font = "franklin_";

			tf = new TextField();
			// tf.text = "hello";
			tf.border = true;
			tf.defaultTextFormat = textFormat;
			tf.embedFonts = true;
			// tf.setTextFormat(textFormat);
			addChild(tf);

			tf.text = "hello";

			return;

			var ba : ByteArray = new ByteArray();
			// ba.endian = Endian.LITTLE_ENDIAN;

			var person : Person = new Person();
			person.name = "Andrew";
			person.id = 23;
			person.email = "voland@gmail.com";

			// trace (person.toString());

			person.writeTo(ba);
			// trace('ba.length: ' + (ba.length));

			var newPerson : Person = new Person();
			ba.position = 0;
			newPerson.mergeFrom(ba);

			trace(newPerson.toString());

			// ba.writeShort(23);
			// ba.writeShort(294);
			
			
			
			// return;
			//			
			// trace('ba.position: ' + (ba.position));
			// ba.position = 0;
			//			
			// trace('ba.position: ' + (ba.position));
			// var a:int = ba.readShort(); 
			// trace('a: ' + (a)); 
			//			
			// var b:int = ba.readShort();
			// trace('b: ' + (b));
			
			// addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e : Event) : void
		{
			// tf.text = "helllo12";
			// var m:Spri  = e.target as MovieClip;
			//			
			// trace('m.totalFrames: ' + (m.totalFrames));
			// trace('m.currentFrame: ' + (m.currentFrame));
			// if (m.currentFrame >= m.totalFrames - 1)
			// {
			// m.gotoAndPlay(1);
			// }
		}
	}
}
