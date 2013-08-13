package com.onlyplay.slotmatch3.components.games.match
{
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Linear;
	import com.greensock.easing.Quad;
	import com.greensock.easing.Sine;
	import com.onlyplay.slotmatch3.components.games.Util;

	import mx.events.DynamicEvent;

	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import flash.net.registerClassAlias;
	import flash.system.MessageChannel;
	import flash.system.Worker;
	import flash.system.WorkerDomain;
	import flash.utils.Dictionary;
	import flash.utils.Timer;

	/**
	 * @author Andrew
	 */
	public class MatchComponent extends Sprite
	{
		// worker
		[Embed(source="D:/work/workspaces/fdt_ws/slotmatch3/bin/MyWorker.swf", mimeType="application/octet-stream")]
		private static var MyWorkerClass : Class;
		// icons
		[Embed(source="/assets/Match3/1.png", mimeType="image/png")]
		private var Icon_1_Class : Class;
		[Embed(source="/assets/Match3/2.png", mimeType="image/png")]
		private var Icon_2_Class : Class;
		[Embed(source="/assets/Match3/3.png", mimeType="image/png")]
		private var Icon_3_Class : Class;
		[Embed(source="/assets/Match3/4.png", mimeType="image/png")]
		private var Icon_4_Class : Class;
		[Embed(source="/assets/Match3/5.png", mimeType="image/png")]
		private var Icon_5_Class : Class;
		[Embed(source="/assets/Match3/6.png", mimeType="image/png")]
		private var Icon_6_Class : Class;
		[Embed(source="/assets/Match3/bonus.jpg", mimeType="image/jpg")]
		private var Icon_Bonus_Class : Class;
		// microbonuses assets
		[Embed(source="/assets/facebook/facebook/id_6/id_6/microbonus/baks.png", mimeType="image/png")]
		private static var Backs_Class : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/microbonus/fire.png", mimeType="image/png")]
		private static var FireClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/microbonus/time.png", mimeType="image/png")]
		private static var HourGlass : Class;
		private var _bg : DisplayObject;
		[Embed(source="/assets/facebook/facebook/backgrounds/amazonka_6x6.png", mimeType="image/png")]
		private static var Amazonka_6x6_BGClass : Class;
		[Embed(source="/assets/facebook/facebook/backgrounds/hawaii_6x6.png", mimeType="image/png")]
		private static var Hawaii_6x6_BGClass : Class;
		[Embed(source="/assets/facebook/facebook/backgrounds/pirate_6x6.png", mimeType="image/png")]
		private static var Pirate_6x6_BGClass : Class;
		[Embed(source="/assets/facebook/facebook/backgrounds/underwater_6x6.png", mimeType="image/png")]
		private static var UnderWater_6x6_BGClass : Class;
		private var _cellSize : Number = 70;
		private var _field : Array;
		private var _map : Dictionary ;
		// = new Dictionary(true);
		private var _selected1 : String;
		private var _selected2 : String;
		private var _animPlaying : Boolean;
		private static const _micrbonuces : Array = [0, HourGlass, Backs_Class, FireClass];
		private var _iconsBase : DisplayObjectContainer;
		private var _animBase : DisplayObjectContainer;
		// worker stuff
		private var myWorker : Worker;
		private var bm : MessageChannel;
		private var mb : MessageChannel;
		private var _currentSwaps : Array;
		private var _showSwapsTimer : Timer = new Timer(3000);
		private var _blastBackBase : DisplayObjectContainer;
		private var _blastFrontBase : DisplayObjectContainer;
		// fild dimantions
		private var _w : uint = 6;
		private var _h : uint = 6;
		// костыль
		public var animBaseForSpiral : DisplayObjectContainer;

		public function MatchComponent()
		{
			registerClassAlias("ItemModel_", ItemModel);
			_showSwapsTimer.addEventListener(TimerEvent.TIMER, onShowSwapsTick);

			// --- worker stuff --------------
			if ( Worker.isSupported)
			{
				myWorker = WorkerDomain.current.createWorker(new MyWorkerClass());
				// myWorker = WorkerDomain.current.createWorker( WorkerManager.test_MyTestProject_MyWorker);

				bm = myWorker.createMessageChannel(Worker.current);
				mb = Worker.current.createMessageChannel(myWorker);

				myWorker.setSharedProperty("btm", bm);
				myWorker.setSharedProperty("mtb", mb);

				bm.addEventListener(Event.CHANNEL_MESSAGE, onBackToMain);

				myWorker.start();
			}

			// -------------------------------
			_bg = getBg(_w, _h, 1);
			if (_bg) addChild(_bg);

			_blastBackBase = new Sprite();
			_blastBackBase.addEventListener("animComplete", onAnimCompleteFromTimeLine, true);
			addChild(_blastBackBase);

			_iconsBase = new Sprite();
			addChild(_iconsBase);

			_blastFrontBase = new Sprite();
			_blastFrontBase.addEventListener("animComplete", onAnimCompleteFromTimeLine, true);
			addChild(_blastFrontBase);

			_animBase = new Sprite();
			_animBase.addEventListener("animComplete", onAnimCompleteFromTimeLine, true);
			addChild(_animBase);

			reinit();

			// fall();

			_iconsBase.addEventListener(MouseEvent.CLICK, onMouseClick);
		}

		override public function get width() : Number
		{
			return _bg.width;
		}

		// ATTENTION: этот метод не универсальный - он требует знаний о внутренней структуре анимаций
		private function onAnimCompleteFromTimeLine(e : Event) : void
		{
			(e.currentTarget as DisplayObjectContainer).removeChild(e.target.parent as DisplayObject);
		}

		// --- animations ------------------------------------
		public function playDrop() : void
		{
			Animations.drop(_field, _map, _h, _w, _cellSize);
		}

		public function playFall() : void
		{
			Animations.fall(_h, _cellSize, _map);
		}

		// ---------------------------------------------------
		private function onShowSwapsTick(event : TimerEvent) : void
		{
			if (_currentSwaps)
			{
				// log("--- show swaps ---");

				// debug

				var swapsItemsRaw : Array = [].concat.apply(null, _currentSwaps);
				swapsItemsRaw = [].concat.apply(null, swapsItemsRaw);

				var filter : GlowFilter = new GlowFilter(0x00ffff);

				var swapedIcons : Array = [];
				for each (var item : ItemModel in swapsItemsRaw)
				{
					var icon : DisplayObjectContainer = _map[item.id];
					if (icon)
					{
						icon.filters = [filter];
						swapedIcons.push(icon);
					}
				}
				TweenLite.delayedCall(1.5, function() : void
				{
					for each (var icon : DisplayObject in swapedIcons)
					{
						icon.filters = [];
					}
				});

				// var swapGroups : Array = _currentSwaps[Util.randInt(_currentSwaps.length)];
				// var swapGroup : Array = swapGroups[Util.randInt(swapGroups.length)];
				// for each (var item : ItemModel in swapGroup)
				// {
				// var icon : DisplayObjectContainer = _map[item.id];
				// if (icon)
				// {
				// var graphicBase : DisplayObject = icon.getChildByName("graphicBase");
				// var timeLine : TimelineLite = new TimelineLite();
				// timeLine.append(TweenLite.to(graphicBase, 0.125, {scaleX:1.1, scaleY:1.1, ease:Sine.easeIn}));
				// timeLine.append(TweenLite.to(graphicBase, 0.125, {scaleX:1, scaleY:1, ease:Sine.easeOut}));
				// timeLine.append(TweenLite.to(graphicBase, 0.125, {scaleX:1.1, scaleY:1.1, ease:Sine.easeIn}));
				// timeLine.append(TweenLite.to(graphicBase, 0.125, {scaleX:1, scaleY:1, ease:Sine.easeOut}));
				// }
				// }
			}
		}

		private function onBackToMain(event : Event) : void
		{
			log("-------MatchComponent.onBackToMain(event)");
			if (bm.messageAvailable)
			{
				var header : String = bm.receive();
				log("header:" + header);
				if ( header == "echo")
				{
					log("---> echo");
				}
				if ( header == "onGetPossibleSwaps")
				{
					var swaps : Array = bm.receive();
					_currentSwaps = swaps;
					if ( swaps.length == 0)
					{
						startReinitAnimation();
					}
					else
					{
						_showSwapsTimer.start();
					}

					log("---> From worker!!", "swaps.length:" + swaps.length);
				}
			}
		}

		override public function get height() : Number
		{
			return _bg.height;
			// return super.height;
		}

		public function reinit() : void
		{
			do
			{
				// _w = 14;
				// _field = Matcher_v2.genField(FieldShapes.RECTANGULAR, _w, _h);
				// _field = Matcher_v2.genField2(FieldShapes.RECTANGULAR, _w, _h);
				_field = Matcher_v2.genField3(FieldShapes.RECTANGULAR, _w, _h);
				var swaps : Array = Matcher_v2.getPossibleSwaps(_field);
				// _field = Matcher_v2.genField( FieldShapes.SMILE ); _w = 7;_h = 7;
				// _field = Matcher_v2.genField3( FieldShapes.SMILE ); _w = 7;_h = 7;

			}
			while (swaps.length == 0);
			_currentSwaps = swaps;
			
			_showSwapsTimer.start();
			
			// --------------------
			if (_map)
			{
				for each (var ic : DisplayObject in _map)
				{
					_iconsBase.removeChild(ic);
				}
			}
			_map = null;
			// для ясности

			_map = new Dictionary(true);
			drawGrid();
		}

		private function getBg(w : int, h : int, type : int) : DisplayObject
		{
			var BgClass : Class;

			if (w == 6 && h == 6)
			{
				switch(type)
				{
					case 0:
						BgClass = Amazonka_6x6_BGClass;
						break;
					case 1:
						BgClass = Hawaii_6x6_BGClass;
						break;
					case 2:
						BgClass = Pirate_6x6_BGClass;
						break;
					case 3:
						BgClass = UnderWater_6x6_BGClass;
						break;
					default:
				}
			}

			if (BgClass)
			{
				return new BgClass();
			}

			return null;
		}

		private function onMouseClick(e : MouseEvent) : void
		{
			if (_animPlaying) return;
			// log(e.target);
			var graphicBase : DisplayObjectContainer = e.target as DisplayObjectContainer;
			if ( graphicBase && graphicBase.parent )
			{
				var icon : DisplayObjectContainer = graphicBase.parent;
				// e.target as Sprite;
				var item : Object = Matcher_v2.getItemById(icon.name, _field);

				if (_selected1)
				{
					var selected1_item : Object = Matcher_v2.getItemById(_selected1, _field);
					if (_map[_selected1]) (_map[_selected1] as DisplayObject).filters = [];
					if (_selected1 == item.id)
					{
						_selected1 = null;
						_selected2 = null;
					}
					else if ( Matcher_v2._isNeigbour(selected1_item, item))
					{
						_selected2 = item.id;
					}
					else
					{
						_selected1 = item.id;
						_selected2 = null;
					}
				}
				else
				{
					_selected1 = item.id;
					_selected2 = null;
				}
				if (_selected1) (_map[_selected1] as DisplayObject).filters = [new GlowFilter()];
				// e.updateAfterEvent();
				// 59000015573866 - mama
				// 20280000716024 -
				//
				if (_selected1 && _selected2) processSwap(_field);
			}
		}

		private function processSwap(field : Array) : void
		{
			if (_selected1 && _selected2)
			{
				log("MatchGame.processGame()");

				var item1 : ItemModel = Matcher_v2.getItemById(_selected1, field) as ItemModel;
				var item2 : ItemModel = Matcher_v2.getItemById(_selected2, field) as ItemModel;

				var res : Object = Matcher_v2.resolve(Matcher_v2.swap(item1, item2, field));
				var groups : Array = res.groups;
				var bonuses : Object = res.bonuses;
				var newSwapedState : Array = res.newState;

				if (groups.length > 0)
				{
					log("something neen to be processed");

					_showSwapsTimer.stop();

					var icon1 : DisplayObject = _map[item1.id];
					var icon2 : DisplayObject = _map[item2.id];

					TweenLite.to(icon1, 0.25, {x:icon2.x, y:icon2.y});
					TweenLite.to(icon2, 0.25, {x:icon1.x, y:icon1.y, onComplete:onSwapAnimComplete});

					function onSwapAnimComplete() : void
					{
						_animPlaying = false;
						processDeleteAndPopulate(groups, newSwapedState, bonuses);
					}

					// old variant 
					// startFieldAnimation(newSwapedState, onSwapAnimComplete);
				}
				else
				{
					dummyAnimation(_selected1, _selected2);
				}
				resetSelection();
			}
		}

		private function processGame() : void
		{
			var res : Object = Matcher_v2.resolve(_field);
			var groups : Array = res.groups;
			var bonuses : Object = res.bonuses;
			var newSwapedState : Array = res.newState;
			if ( groups.length > 0)
			{
				processDeleteAndPopulate(groups, newSwapedState, bonuses);
			}
			else
			{
				// return;
				// XXX: hack. Redo this
				// TweenLite.delayedCall(1, checkPossibleSwap);

				checkPossibleSwap();

				function checkPossibleSwap() : void
				{
					if ( false && Worker.isSupported )//
					{
						mb.send("getPossibleSwaps");
						mb.send(newSwapedState);
					}
					else
					{
						var swaps : Array = Matcher_v2.getPossibleSwaps(newSwapedState);
						log('swaps.length: ' + (swaps.length));
						if (swaps.length == 0)
						{
							// there an't possible next moves
							// start drop animation
							// startReinitAnimation();

							// log("-------------");

							// playDrop();
							//
							// TweenLite.delayedCall(1, function() : void
							// {
							// reinit();
							// Animations.fall(_h, _cellSize, _map);
							//								//  fall();
							// });

							// _field = Matcher_v2.shuffle3(_field);
							// resetVisuals();
							playShuffleAnimation();

							// dispatchEvent( new Event ("noChoice"));

							// Animations.spiralVideo(_animBase, new Point(_matchComponent.x + (_matchComponent.width >> 1), _matchComponent.y + (_matchComponent.height >> 1)));

							_showSwapsTimer.start();
						}
						else
						{
							_currentSwaps = swaps;
							_showSwapsTimer.start();

							// debug
						}
					}
				}
			}
		}

		public function startReinitAnimation(onComplete : Function = null) : void
		{
			// this is drop

			// Animations.fall(_h, _cellSize, _map);

			// fall();
			
			// drop();
			
			// for each (var item : Object in _field)
			// {
			// item.y += 6;
			// }
			// startFieldAnimation(_field, function() : void
			// {
			//				//  _animPlaying = false;
			//				//  this is fall
			// reinit();
			// });
		}

		public function playShuffleAnimation(onComplete : Function = null) : void
		{
			var centerGlobal : Point = localToGlobal(new Point(_cellSize * _w >> 1, _cellSize * _h >> 1));
			// log(centerGlobal);

			Animations.spiralField(_map, centerGlobal, _cellSize, _iconsBase, foo);

			if ( animBaseForSpiral ) Animations.spiralVideo(animBaseForSpiral, centerGlobal);

			function foo() : void
			{
				
				// TODO: вынести этот общий функционал с reinit() в отдельную функцию
				do {
					var newShuffledState : Array = Matcher_v2.shuffle3(_field);
					var swaps:Array = Matcher_v2.getPossibleSwaps(newShuffledState);
					
				} while (swaps.length == 0);
				
				_currentSwaps = swaps;
				_showSwapsTimer.start();
				
				//------------------------------------

				_field = newShuffledState;
				playBangAnimation();
			}
		}

		public function playBangAnimation() : void
		{
			var center : Point = new Point(_w * _cellSize >> 1, _h * _cellSize >> 1);
			Animations.bangFromCenter(_map, _field, _cellSize, center);
		}

		// утильная функция. Нигде, кроме дебага не использовал пока
		public function resetVisuals() : void
		{
			for (var itemId : * in _map)
			{
				var icon : DisplayObject = _map[itemId];
				var item : ItemModel = Matcher_v2.getItemById(itemId, _field) as ItemModel;
				if (item)
				{
					icon.scaleX = icon.scaleY = 1;
					icon.x = item.x * _cellSize + (_cellSize >> 1);
					icon.y = item.y * _cellSize + (_cellSize >> 1);
				}
			}
		}

		private function dummyAnimation(selected1 : String, selected2 : String) : void
		{
			trace("MatchComponent.dummyAnimation(selected1, selected2)");
			_animPlaying = true;

			var icon1 : Sprite = _map[selected1];
			var icon2 : Sprite = _map[selected2];

			// TODO: выяснить почему старый подход с delay  - перестал работать
			// изменения во флешьплеере?
			// TweenLite.to(icon1, 0.5, {x:icon2.x, y:icon2.y});
			// TweenLite.to(icon2, 0.5, {x:icon1.x, y:icon1.y});
			//
			// TweenLite.to(icon1, 0.5, {x:icon1.x, y:icon1.y, delay:0.5});
			// TweenLite.to(icon2, 0.5, {x:icon2.x, y:icon2.y, delay:0.5, onComplete:function() : void
			// {
			// _animPlaying = false;
			// }});

			var timeLine : TimelineLite = new TimelineLite({onComplete:function() : void
			{
				_animPlaying = false;
			}});
			timeLine.appendMultiple([TweenLite.to(icon1, 0.3, {x:icon2.x, y:icon2.y}), TweenLite.to(icon2, 0.3, {x:icon1.x, y:icon1.y})]);
			timeLine.appendMultiple([TweenLite.to(icon1, 0.3, {x:icon1.x, y:icon1.y}), TweenLite.to(icon2, 0.3, {x:icon2.x, y:icon2.y})]);
		}

		private function processDeleteAndPopulate(groups : Array, newSwapedState : Array, bonuses : Object) : void
		{
			// return {newField:newField, forAnim:forAnim};
			var res : Object = Matcher_v2.getNewStateAfterDeletionAndPopulation(groups, newSwapedState, bonuses);
			var newFieldState : Array = res.newField;
			manageTilesAndStartBlustAnimation(newFieldState, res.forAnim);

			var newDensityFieldState : Array = Matcher_v2.getNewDensityState(newFieldState);

			TweenLite.delayedCall(0.25, foo);

			function foo() : void
			{
				startFieldAnimation(newDensityFieldState, function() : void
				{
					_animPlaying = false;
					processGame();
				});

				_field = newDensityFieldState;
			}
		}

		private function startFieldAnimation(newDensityFieldState : Array, continuationClosure : Function = null) : void
		{
			_animPlaying = true;

			var dur : Number = 0.5;

			for each (var icon : Sprite in _map)
			{
				var item : Object = Matcher_v2.getItemById(icon.name, newDensityFieldState);
				if (item)
				{
					var newX : Number = item.x * _cellSize + (_cellSize >> 1);
					var newY : Number = item.y * _cellSize + (_cellSize >> 1);
					if ( newX != icon.x || newY != icon.y)
					{
						TweenLite.to(icon, dur, {x:newX, y:newY});
					}
				}
				else
				{
					log("Strange: no item for icon:" + icon.name);
				}
			}
			if (continuationClosure) TweenLite.delayedCall(dur, continuationClosure);
		}

		private function manageTilesAndStartBlustAnimation(newFieldState : Array, forAnim : Array) : void
		{
			var iconsOnDelete : Array = [];
			// delete visuals
			for (var itemId : String in _map)
			{
				var item : ItemModel = Matcher_v2.getItemById(itemId, newFieldState) as ItemModel;
				if ( !item )
				{
					// iconsOnDelete.push( icon );
					// microbonus stuff
					var icon : Sprite = _map[itemId];

					var micorbonusAnimItem : ItemModel = Matcher_v2.getItemById(itemId, forAnim) as ItemModel;
					// microbonuses
					if (micorbonusAnimItem && micorbonusAnimItem.microbonus)
					{
						// animation here
						var microbonusIcon : DisplayObject = (icon.getChildByName("graphicBase") as DisplayObjectContainer).getChildByName("microbonus");
						if (microbonusIcon)
						{
							var event : DynamicEvent = new DynamicEvent("animMicrobonus");
							event.pos = microbonusIcon.localToGlobal(new Point());
							event.bonusType = micorbonusAnimItem.microbonus;
							event.icon = microbonusIcon;
							dispatchEvent(event);
						}
					}
					// charged
					if (micorbonusAnimItem && micorbonusAnimItem.charge)
					{
						playChargeAnimation(micorbonusAnimItem.charge, micorbonusAnimItem.x, micorbonusAnimItem.y);
					}

					addBlustMoveieClip(icon.x, icon.y);
					// attention
					// _iconsBase.removeChild(icon);
					iconsOnDelete.push(icon);

					// value
					_map[itemId] = null;
					// key
					delete _map[itemId];
				}
				// we modify appearence of existing icon here, according to the "charge" field - to show bomb,vert or hor, modifers
				else if (item.charge)
				{
					var icon : Sprite = _map[itemId];
					var chargeBase : DisplayObjectContainer = (icon.getChildByName("graphicBase") as DisplayObjectContainer).getChildByName("chargeBase") as DisplayObjectContainer;

					if (item.charge == ItemModel.BOMB)
					{
						if (!chargeBase.getChildByName("bomb"))
						{
							var bomb : Sprite = new bomb_anim();
							bomb.mouseEnabled = false;
							bomb.name = "bomb";
							chargeBase.addChild(bomb);
						}
					}
					if (item.charge == ItemModel.HOR)
					{
						if (!chargeBase.getChildByName("hor"))
						{
							var hor : Sprite = new video_host();
							// new charge_();
							hor.mouseEnabled = false;
							hor.name = "hor";
							chargeBase.addChild(hor);
						}
					}
					if (item.charge == ItemModel.VER)
					{
						if (!chargeBase.getChildByName("ver"))
						{
							var ver : Sprite = new video_host();
							// new charge_();
							ver.rotation = 90;
							ver.mouseEnabled = false;
							ver.name = "ver";
							chargeBase.addChild(ver);
						}
					}
				}
			}

			// remove old icons with delay
			TweenLite.delayedCall(0.2, deleteIconsFinnaly);
			function deleteIconsFinnaly() : void
			{
				for each (var i : DisplayObject in iconsOnDelete)
				{
					_iconsBase.removeChild(i);
				}
			}

			// place new visuals

			for each (var item : ItemModel in newFieldState)
			{
				if (!_map[item.id])
				{
					var icon_ : Sprite = createIcon(item);
					icon_.name = item.id;
					_iconsBase.addChild(icon_);
					_map[item.id] = icon_;
				}
			}

			// TweenLite.delayedCall(0.5, placeNewVisuals);
			//			
			// function placeNewVisuals ():void
			// {
			// }
		}

		private function addBlustMoveieClip(x : Number, y : Number) : void
		{
			var blastBack : DisplayObject = new blast_ordinary_back();
			_blastBackBase.addChild(blastBack);

			var blastFront : DisplayObject = new blast_ordinary_front();
			_blastFrontBase.addChild(blastFront);

			var star : Sprite = new star_();
			_animBase.addChild(star);

			star.x = blastBack.x = blastFront.x = x;
			star.y = blastBack.y = blastFront.y = y;
			// star.scaleX = star.scaleY = 0.7;

			var randSignX : int = Util.sign(Math.random() - 0.5);
			var randSignY : int = Util.sign(Math.random() - 0.5);
			var randSignRot : int = Util.sign(Math.random() - 0.5);

			var newX : Number = x + randSignX * (Math.random() * 20 + 120);
			var newY : Number = y + randSignY * (Math.random() * 20 + 120);

			TweenLite.to(star, 0.7, {x:newX, y:newY, rotation:randSignRot * (1.1 * 360 + Math.random() * 180), ease:Linear.easeIn, scaleX:0.35, scaleY:0.35, onComplete:function() : void
			{
				star.parent.removeChild(star);
			}});
		}

		private function playChargeAnimation(charge : int, x : Number, y : Number) : void
		{
			log("---MatchComponent.playChargeAnimation(charge, x, y) charge:" + charge);
			var blastClasses : Array = [0, charge_blast_, charge_blast_, bomb_blast];
			// var blastClasses : Array = [0, hor_blast2, hor_blast2, bomb_blast];
			var BlastClass : Class = blastClasses[charge];
			var anim : Sprite = new BlastClass();
			// new Sprite();
			anim.x = x * _cellSize + 0.5 * _cellSize;
			anim.y = y * _cellSize + 0.5 * _cellSize;
			_animBase.addChild(anim);

			// var g : Graphics = anim.graphics;
			// g.lineStyle(4, 0xffffff);

			var delayInFrames : int;
			switch(charge)
			{
				case ItemModel.BOMB:
					delayInFrames = 17;
					break;
				case ItemModel.HOR:
					// var newY : Number = y * _cellSize + 0.5 * _cellSize;
					delayInFrames = 11;
					// g.moveTo(0, newY);
					// g.lineTo(_cellSize * 6, newY);
					break;
				case ItemModel.VER:
					anim.rotation = 90;
					// var newX : Number = x * _cellSize + 0.5 * _cellSize;
					delayInFrames = 11;
					// g.moveTo(newX, 0);
					// g.lineTo(newX, _cellSize * 6);
					break;
				default:
			}

			TweenLite.delayedCall(delayInFrames, function() : void
			{
				_animBase.removeChild(anim);
			}, null, true);
		}

		private function resetSelection() : void
		{
			if (_selected1) (_map[_selected1 ] as DisplayObject).filters = [];
			_selected1 = null;
			_selected2 = null;
		}

		private function drawGrid() : void
		{
			for each (var item : ItemModel in _field)
			{
				var icon : Sprite = createIcon(item);
				icon.name = item.id;
				_iconsBase.addChild(icon);
				_map [item.id] = icon;
				// _map[icon] = item;
			}
		}

		private function createIcon(item : ItemModel) : Sprite
		{
			var iconsMap : Array = [Icon_1_Class, Icon_2_Class, Icon_3_Class, Icon_4_Class, Icon_5_Class, Icon_6_Class];
			iconsMap["super"] = Icon_Bonus_Class;
			var icon : Bitmap = new iconsMap[item.type]();

			var s : Sprite = new Sprite();

			var graphicBase : DisplayObjectContainer = new Sprite();
			graphicBase.name = "graphicBase";
			// graphicBase.x = _cellSize >> 1;
			// graphicBase.y = _cellSize >> 1;

			s.addChild(graphicBase);
			icon.x = -icon.width >> 1;
			icon.y = -icon.height >> 1;
			graphicBase.addChild(icon);

			var chargeBase : DisplayObjectContainer = new Sprite();
			chargeBase.mouseEnabled = false;
			chargeBase.name = "chargeBase";
			graphicBase.addChild(chargeBase);

			if (item.microbonus)
			{
				var microLabel : Bitmap = new _micrbonuces[item.microbonus]();
				microLabel.name = "microbonus";
				graphicBase.addChild(microLabel);

				microLabel.x = (_cellSize >> 1) - microLabel.width;
				microLabel.y = (_cellSize >> 1) - microLabel.height;
			}

			icon.width = icon.height = _cellSize;
			s.x = item.x * _cellSize + (_cellSize >> 1);
			s.y = item.y * _cellSize + (_cellSize >> 1);
			return s;
		}

		public function get animBase() : DisplayObjectContainer
		{
			return _animBase;
		}
	}
}


