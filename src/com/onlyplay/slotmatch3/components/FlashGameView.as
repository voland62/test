package com.onlyplay.slotmatch3.components
{
	import com.greensock.TimelineLite;
	import alternativa.gui.container.linear.VBox;
	import alternativa.gui.container.tabPanel.TabData;
	import alternativa.gui.controls.button.BaseButton;
	import alternativa.gui.data.DataProvider;

	import assets.BgClass;

	import com.greensock.TweenLite;
	import com.greensock.easing.Quad;
	import com.onlyplay.slotmatch3.components.games.elements.BetButtonLeft;
	import com.onlyplay.slotmatch3.components.games.elements.BetButtonRight;
	import com.onlyplay.slotmatch3.components.games.elements.FreezeProgress;
	import com.onlyplay.slotmatch3.components.games.elements.LineButtonLeft;
	import com.onlyplay.slotmatch3.components.games.elements.LineButtonRight;
	import com.onlyplay.slotmatch3.components.games.elements.MapButton;
	import com.onlyplay.slotmatch3.components.games.elements.MaxBetButton;
	import com.onlyplay.slotmatch3.components.games.elements.PayButton;
	import com.onlyplay.slotmatch3.components.games.elements.PhotoButton;
	import com.onlyplay.slotmatch3.components.games.elements.PlayButton;
	import com.onlyplay.slotmatch3.components.games.elements.PlusButton;
	import com.onlyplay.slotmatch3.components.games.elements.ProgressBarBase;
	import com.onlyplay.slotmatch3.components.games.elements.RoomProgress;
	import com.onlyplay.slotmatch3.components.games.elements.SettingsButton;
	import com.onlyplay.slotmatch3.components.games.elements.StarProgress;
	import com.onlyplay.slotmatch3.components.games.elements.TimeProgress;
	import com.onlyplay.slotmatch3.components.games.elements.ToMach3Button;
	import com.onlyplay.slotmatch3.components.games.elements.ToSlotButton;
	import com.onlyplay.slotmatch3.components.games.elements.booster.BoosterPanel;
	import com.onlyplay.slotmatch3.components.games.elements.list.RoomList;
	import com.onlyplay.slotmatch3.components.games.elements.ns.ExperienceProgressBar;
	import com.onlyplay.slotmatch3.components.games.elements.tab.RoomTabButton;
	import com.onlyplay.slotmatch3.components.games.elements.tab.RoomTabPanel;
	import com.onlyplay.slotmatch3.components.games.match.ItemModel;
	import com.onlyplay.slotmatch3.components.games.match.MatchComponent;
	import com.onlyplay.slotmatch3.components.games.slot.SlotMashine;
	import com.onlyplay.slotmatch3.view.IGameView;

	import mx.events.DynamicEvent;

	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * @author Design3d
	 */
	public class FlashGameView extends Sprite implements IGameView
	{
		private var _slotMashineBase : DisplayObjectContainer = new Sprite();
		private var _slotMashine : SlotMashine;
		private var _matchComponentBase : DisplayObjectContainer = new Sprite();
		private var _matchComponent : MatchComponent;
		private var _w : Number;
		private var _h : Number;
		private var _spinButton : Sprite;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/timer/plashka.png", mimeType="image/png")]
		private var FakeProgressBgClass : Class;
		[Embed(source="/assets/facebook/facebook/Id_1/ava_user.png", mimeType="image/png")]
		private var FaceClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/center/icon_money_user.png", mimeType="image/png")]
		private var MoneyIconClass : Class;
		// [Embed(source="assets/facebook/facebook/id_6/id_6/background-ipadhd.png", mimeType="image/png")]
		// private static var BgClass : Class;
		[Embed(source="/assets/facebook/facebook/backgrounds/amazonka.png", mimeType="image/png")]
		private static var IslandBgClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/ paytable/booster_all.png", mimeType="image/png")]
		private static var PaymentsFakeClass : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/pl_schet.png", mimeType="image/png")]
		private static var PlashkaBottomClass : Class;
		
		[Embed(source="/assets/facebook/facebook/id_6/id_6/bg/up.png", mimeType="image/png")]
		private static var PlashkaTopClass : Class;
		
		[Embed(source="/assets/facebook/facebook/id_6/id_6/coins1.png", mimeType="image/png")]
		private static var CoinMiniClass : Class;
		
		
		
		//
		private var _bg : Bitmap;
		private var _playButton : BaseButton;
		private var _betButtonRight : BaseButton;
		private var _betButtonLeft : BaseButton;
		private var _lineButtonLeft : BaseButton;
		private var _lineButtonRight : BaseButton;
		private var _payButton : BaseButton;
		private var _maxBetButton : MaxBetButton;
		private var _mapButton : BaseButton;
		private var _toMach3Button : BaseButton;
		// --- textfilds ---
		// I use this shit indstead true Numeric steppers because Alternativa's one is not obviouse in using
		private var _betTf : TextField;
		private var _lineTf : TextField;
		private var _lineAmountTf : TextField;
		private var _betAmountTf : TextField;
		private var _userFace : Bitmap;
		private var _userName : TextField;
		private var _settingsButton : BaseButton;
		private var _photoButton : BaseButton;
		private var _roomProgress : ProgressBarBase;
		private var experienceProgressBar : ExperienceProgressBar;
		private var _upperWinTf : TextField;
		private var _upperBetTf : TextField;
		private var _upperWinAmountTf : TextField;
		private var _upperBenAmountTf : TextField;
		private var plusButton : PlusButton;
		private var _moneyTf : TextField;
		private var _moneyIcon : Bitmap;
		private var _roomList : RoomList;
		private var _islandBg : Bitmap;
		private var _paymentsFake : Bitmap;
		private var _fakeProgressBg : Bitmap;
		private var _toStotButton : BaseButton;
		private var _timeProgress : TimeProgress;
		private var _animBase : DisplayObjectContainer;
		private var _boosterPanel : BoosterPanel;
		private var _energyProgress : FreezeProgress;
		private var _plashka : Bitmap;
		private var _coins1 : Bitmap;
		private var _plashkaTop : Bitmap;
		private var _starProgress : StarProgress;

		public function FlashGameView()
		{
			_islandBg = new IslandBgClass();
			addChild(_islandBg);

			addChild(_slotMashineBase);
			addChild(_matchComponentBase);

			// createSlotMashine();

			_userFace = new FaceClass();
			addChild(_userFace);

			_plashka = new PlashkaBottomClass();
			addChild(_plashka);

			_bg = BgClass.getSingletone();
			addChild(_bg);
			
			_plashkaTop = new PlashkaTopClass();
			addChild(_plashkaTop);
			
			
			_starProgress = new StarProgress();
			addChild(_starProgress);
			// starProgress.percent = 0.75;
			//_starProgress.setProgress(0.25, false);
			//_starProgress.setProgress(0.75, true);
			
			_starProgress.width = 235;
			_starProgress.height = 21;
			_starProgress.setProgress(0.75, false);
			
			_paymentsFake = new PaymentsFakeClass();
			addChild(_paymentsFake);

			_userName = createTf(100, 11);
			_userName.text = "Лада";
			addChild(_userName);

			_upperWinTf = createTf(100, 12, 0xf9fcbe);
			addChild(_upperWinTf);
			_upperWinTf.text = "ВЫИГРЫШ:";

			//_coins1 = new CoinMiniClass();
			//addChild(_coins1);

			_upperWinAmountTf = createTf(100, 14, 0x00c400);
			addChild(_upperWinAmountTf);
			_upperWinAmountTf.text = String(0);

			_upperBetTf = createTf(100, 12, 0xf9fcbe);
			addChild(_upperBetTf);
			_upperBetTf.text = "СТАВКА:";

			_upperBenAmountTf = createTf(100, 14, 0xffff00);
			addChild(_upperBenAmountTf);
			_upperBenAmountTf.text = "10250";

			_moneyIcon = new MoneyIconClass();
			addChild(_moneyIcon);

			_roomProgress = new RoomProgress();
			_roomProgress.maxValue = 1000000;
			_roomProgress.value = 750000;
			addChild(_roomProgress);

			experienceProgressBar = new ExperienceProgressBar();
			experienceProgressBar.level = 33;
			addChild(experienceProgressBar);
			experienceProgressBar.maxValue = 1000;
			experienceProgressBar.value = 1000;

			_settingsButton = new SettingsButton();
			addChild(_settingsButton);

			_photoButton = new PhotoButton();
			addChild(_photoButton);

			_photoButton.addEventListener("click", function(_ : *) : void
			{
				_matchComponent.resetVisuals();
				// _matchComponent.startReinitAnimation();
				_matchComponent.playShuffleAnimation();
				// Animations.spiralVideo(_animBase, 
				// new Point(_matchComponent.x + (_matchComponent.width>>1), _matchComponent.y +(_matchComponent.height>>1)));
			});

			plusButton = new PlusButton();
			addChild(plusButton);

			_moneyTf = createTf(100, 14);
			addChild(_moneyTf);
			_moneyTf.text = String(0);

			// buttons
			_playButton = new PlayButton();
			_playButton.addEventListener(MouseEvent.CLICK, onPlayButtonClick);
			addChild(_playButton);

			// playButton.locked = true;

			_betButtonRight = new BetButtonRight();
			_betButtonRight.addEventListener(MouseEvent.CLICK, onBetIncreaseClick);
			addChild(_betButtonRight);

			_betButtonLeft = new BetButtonLeft();
			_betButtonLeft.addEventListener(MouseEvent.CLICK, onBetDecreaseClick);
			addChild(_betButtonLeft);

			_lineButtonLeft = new LineButtonLeft();
			_lineButtonLeft.addEventListener(MouseEvent.CLICK, function(e : Event) : void
			{
				dispatchEvent(new DynamicEvent("lines_dec"));
			});
			addChild(_lineButtonLeft);

			_lineButtonRight = new LineButtonRight();
			_lineButtonRight.addEventListener(MouseEvent.CLICK, function(e : Event) : void
			{
				dispatchEvent(new DynamicEvent("lines_inc"));
			});
			addChild(_lineButtonRight);

			_payButton = new PayButton();
			addChild(_payButton);

			_maxBetButton = new MaxBetButton();
			_maxBetButton.addEventListener(MouseEvent.CLICK, function(e : Event) : void
			{
				dispatchEvent(new DynamicEvent("max_bet"));
			});
			addChild(_maxBetButton);

			_mapButton = new MapButton();
			addChild(_mapButton);

			_toMach3Button = new ToMach3Button();
			_toMach3Button.addEventListener(MouseEvent.CLICK, function(e : Event) : void
			{
				dispatchEvent(new Event("toMatch"));
			});
			addChild(_toMach3Button);

			_betTf = createTf(55, 11);
			addChild(_betTf);
			_betTf.text = "Ставка";

			_lineTf = createTf(55, 11);
			addChild(_lineTf);
			_lineTf.text = "Линии";

			_lineAmountTf = createTf(55, 26);
			addChild(_lineAmountTf);
			_lineAmountTf.text = String(5);

			_betAmountTf = createTf(55, 16);
			// _betAmountTf.border = true;
			addChild(_betAmountTf);
			_betAmountTf.text = String(25000);

			_spinButton = new Sprite();
			_spinButton.graphics.beginFill(0xff00ff);
			_spinButton.graphics.drawRoundRect(0, 0, 100, 20, 5);
			_spinButton.graphics.endFill();
			_spinButton.addEventListener(MouseEvent.CLICK, onSpinMouseClick);
			// addChild(_spinButton);

			disableButtons(true);

			// -------------------------------
			var tabPanel : RoomTabPanel = new RoomTabPanel();
			addChild(tabPanel);

			var tabButton1 : RoomTabButton = new RoomTabButton();
			tabButton1.label = "Игроки";
			var tabButton2 : RoomTabButton = new RoomTabButton();
			tabButton2.label = "Чат";

			_roomList = new RoomList();
			// roomList.dataProvider = new DataProvider(new <Object>[{label:"Anrew"}, {label:"Tanya"}, {label:"Anrew"}, {label:"Tanya"}]);
			var vec : Vector.<Object> = new <Object> [{label:"Маша"}, {label:"Петя"}, {label:"Коля"}];
			_roomList.dataProvider = new DataProvider(vec);
			// roomList.selectedIndex = 2;
			//

			_roomList.height = 200;
			_roomList.width = 130;

			tabPanel.addTab(new TabData(tabButton1, _roomList));
			tabPanel.addTab(new TabData(tabButton2, new VBox(3)));

			tabPanel.y = 80;
			tabPanel.height = 411;
			tabPanel.width = 130;

			tabPanel.selectTab = 1;
			tabPanel.selectTab = 0;

			_animBase = new Sprite();
			_animBase.mouseChildren = false;
			_animBase.addEventListener("animComplete", onAnimComplete, true);
			addChild(_animBase);
		}

		private function onAnimComplete(e : Event) : void
		{
			(e.currentTarget as DisplayObjectContainer).removeChild(e.target.parent as DisplayObject);
		}

		private function createSlotMashine() : void
		{
			if (!_slotMashine)
			{
				_slotMashine = new SlotMashine();
				_slotMashine.addEventListener("AnimEnded", onAnimEnded);
				_slotMashineBase.addChild(_slotMashine);
			}
		}

		private function onAnimEnded(e : Event) : void
		{
			// log("FlashSlotsView.onAnimEnded(e)");
			dispatchEvent(e);
		}

		private function disableButtons(val : Boolean) : void
		{
			_playButton.locked = val;
			_maxBetButton.locked = val;
			// _mapButton.locked = val;
			_betButtonLeft.locked = val;
			_betButtonRight.locked = val;
			_lineButtonLeft.locked = val;
			_lineButtonRight.locked = val;
			_payButton.locked = val;
		}

		private function onPlayButtonClick(e : MouseEvent) : void
		{
			var event : DynamicEvent = new DynamicEvent("spin");
			dispatchEvent(event);
		}

		private function onBetDecreaseClick(e : MouseEvent) : void
		{
			var event : DynamicEvent = new DynamicEvent("dec");
			dispatchEvent(event);
		}

		private function onBetIncreaseClick(e : MouseEvent) : void
		{
			var event : DynamicEvent = new DynamicEvent("inc");
			dispatchEvent(event);
		}

		private function createTf(w : Number, size : Number, color : int = 0x400000) : TextField
		{
			var tf : TextField = new TextField();
			tf.multiline = false;
			tf.height = size + 5;
			tf.width = w;
			// tf.border = true;
			tf.textColor = color;
			tf.selectable = false;
			tf.antiAliasType = AntiAliasType.NORMAL;

			var format : TextFormat = new TextFormat();
			format.font = "_sans";
			// format.font = "franklin2";
			// tf.embedFonts = true;

			format.align = TextFormatAlign.CENTER;
			format.size = size;
			format.bold = true;
			tf.defaultTextFormat = format;
			return tf;
		}

		private function onSpinMouseClick(e : MouseEvent) : void
		{
			dispatchEvent(new Event("spin"));
		}

		public function onResize(e : Event = null) : void
		{
			
			_starProgress.x = 252;
			_starProgress.y = 25;
			
						
			_plashka.x = (_w - _plashka.width) >> 1;
			_plashka.y = 460;
			
			_plashkaTop.x = 149;

			if (_energyProgress)
			{
				_energyProgress.x = (_w - _energyProgress.width) >> 1;
				_energyProgress.y = 40;
			}

			if (_boosterPanel)
			{
				_boosterPanel.x = _w - _boosterPanel.width;
				_boosterPanel.y = 76;
			}

			if (_timeProgress)
			{
				_timeProgress.x = 245;
				_timeProgress.y = 514;
			}

			if (_fakeProgressBg)
			{
				_fakeProgressBg.x = 211;
				_fakeProgressBg.y = _h - _fakeProgressBg.height;
			}

			_islandBg.x = (stage.stageWidth - _islandBg.width) >> 1;
			_islandBg.y = 50;

			if (_slotMashine)
			{
				_slotMashine.x = _w >> 1;
				_slotMashine.y = _h >> 1;
			}

			if (_matchComponent)
			{
				_matchComponent.x = (_w - _matchComponent.width) >> 1;
				_matchComponent.y = 69;
			}

			_paymentsFake.x = _w - _paymentsFake.width;
			_paymentsFake.y = 65;

			_userFace.x = 3;
			_userFace.y = 3;

			_userName.x = 50;
			_userName.y = 11;

			_upperWinTf.x = 250;
			_upperWinTf.y = 469;

			//_coins1.x = 250 + _upperWinTf.width;
			//_coins1.y = 469;

			_moneyIcon.x = 599;
			_moneyIcon.y = 17;

			_upperWinAmountTf.x = 308;
			_upperWinAmountTf.y = 469;

			_upperBetTf.x = 370;
			_upperBetTf.y = 469;

			_upperBenAmountTf.x = 420;
			_upperBenAmountTf.y = 469;

			_moneyTf.x = 623;
			_moneyTf.y = 24;

			_roomProgress.x = 254;
			_roomProgress.y = 4;

			plusButton.x = width - plusButton.width - 10;
			plusButton.y = 17;

			experienceProgressBar.x = 52;
			experienceProgressBar.y = 33;

			_settingsButton.x = 179;
			_settingsButton.y = 5;

			_photoButton.x = 555;
			_photoButton.y = 5;

			var padding : Number = 10;
			_spinButton.x = _w - _spinButton.width - padding;
			_spinButton.y = _h - _spinButton.height - padding;

			_playButton.x = _w - 122;
			_playButton.y = _h - 112;

			_betButtonRight.x = 439;
			_betButtonRight.y = 502;

			_betButtonLeft.x = 360;
			_betButtonLeft.y = 502;

			_lineButtonLeft.x = 226;
			_lineButtonLeft.y = 502;

			_lineButtonRight.x = 304;
			_lineButtonRight.y = 502;

			_payButton.x = 149;
			_payButton.y = 505;

			_maxBetButton.x = 495;
			_maxBetButton.y = 502;

			_mapButton.x = 13;
			_mapButton.y = 502;

			_toMach3Button.x = _w - _toMach3Button.width;
			_toMach3Button.y = 345;

			_betTf.x = 390;
			_betTf.y = 540;

			_lineTf.x = 255;
			_lineTf.y = 540;

			_lineAmountTf.x = 255;
			_lineAmountTf.y = 507;

			_betAmountTf.x = 390;
			_betAmountTf.y = 514;

			if (_toStotButton)
			{
				_toStotButton.x = _playButton.x;
				_toStotButton.y = _playButton.y;
			}
		}

		public function get w() : Number
		{
			return _w;
		}

		public function set w(w : Number) : void
		{
			_w = w;
			onResize();
		}

		public function get h() : Number
		{
			return _h;
		}

		public function set h(h : Number) : void
		{
			_h = h;
			onResize();
		}

		public function showSping(newState : Array) : void
		{
			if (_slotMashine ) _slotMashine.spin(newState);
			disableButtons(true);
		}

		public function drawLines(winLines : Array) : void
		{
			if (_slotMashine) _slotMashine.drawLines(winLines);
		}

		public function setReady() : void
		{
			disableButtons(false);
		}

		public function setName(name : String) : void
		{
			_userName.text = name;
		}

		public function setExperinece(experience : int, level : int, leftVal : int, rightVal : int) : void
		{
			// experienceProgressBar.value = experience;
			experienceProgressBar.maxValue = rightVal;
			experienceProgressBar.value = leftVal;
			experienceProgressBar.level = level;
		}

		public function setMoney(money : int) : void
		{
			_moneyTf.text = money.toString();
		}

		public function updateConfig(serverConfig : IslandProtobuf) : void
		{
			_maxBetButton.text = (serverConfig.maxBet * serverConfig.maxLines).toString();
		}

		public function setUpperBet(wholeBet : Number) : void
		{
			_upperBenAmountTf.text = wholeBet.toString();
		}

		public function setBetPerLine(betPerLine : Number) : void
		{
			_betAmountTf.text = betPerLine.toString();
		}

		public function setLines(linesNum : uint) : void
		{
			_lineAmountTf.text = linesNum.toString();
		}

		public function setWin(win : Number) : void
		{
			_upperWinAmountTf.text = win.toString();
		}

		public function setCurrenMoney(currentMoney : int) : void
		{
			_moneyTf.text = currentMoney.toString();
		}

		public function setPlayers(players : Array) : void
		{
			_roomList.dataProvider = new DataProvider(Vector.<Object>(players));
		}

		public function updatePlayerFromList(index : int, newPlayerState : Object) : void
		{
			_roomList.dataProvider.replaceItemAt(newPlayerState, index);
		}

		public function setProgress(lastProgress : int, targetProgress : int) : void
		{
			_roomProgress.maxValue = targetProgress;
			_roomProgress.value = lastProgress;
		}

		private function createMatchComponent() : void
		{
			if (!_matchComponent)
			{
				_matchComponent = new MatchComponent();
				_matchComponentBase.addChild(_matchComponent)
				_matchComponent.addEventListener("animMicrobonus", onAnimMicrobonus);
			}
		}

		private function onAnimMicrobonus(e : DynamicEvent) : void
		{
			var microbonusIcon : DisplayObject = e.icon;
			var globalPos : Point = e.pos;

			_animBase.addChild(microbonusIcon);
			microbonusIcon.x = globalPos.x;
			microbonusIcon.y = globalPos.y;

			var target : DisplayObject;
			var bonusType : int = e.bonusType;
			switch(bonusType)
			{
				case ItemModel.HOURGLASS:
					target = _timeProgress;
					break;
				case ItemModel.COIN:
					target = _moneyIcon;
					break;
				case ItemModel.FLASH:
					target = _energyProgress;
					// _roomProgress;
					break;
				default:
			}

			if (target)
			{
				var newPos : Point = target.localToGlobal(new Point());
				TweenLite.to(microbonusIcon, 1, {x:newPos.x, y:newPos.y, onComplete:onEnd, ease:Quad.easeIn});
			}

			function onEnd() : void
			{
				_animBase.removeChild(microbonusIcon);
				var event : DynamicEvent = new DynamicEvent("onBonus");
				event.
				bonusType = bonusType;
				dispatchEvent(event);
			}
		}

		// --- states switchers ---------
		public function setSlotState() : void
		{
			if (_matchComponent)
			{
				_matchComponent.visible = false;
			}
			if (!_slotMashine) createSlotMashine();
			_slotMashine.visible = true;
			_paymentsFake.visible = true;
			_toMach3Button.visible = true;
			if (_fakeProgressBg) _fakeProgressBg.visible = false;

			_playButton.visible = true;
			if (_toStotButton ) _toStotButton.visible = false;
			if (_timeProgress) _timeProgress.visible = false;

			if (_boosterPanel) _boosterPanel.visible = false;
			if ( _energyProgress ) _energyProgress.visible = false;

			addChildAt(_animBase, numChildren - 1);

			onResize();
		}

		public function setMatchState() : void
		{
			if (_slotMashine) _slotMashine.visible = false;
			if (!_matchComponent) createMatchComponent();
			_matchComponent.animBaseForSpiral = _animBase;
			_matchComponent.visible = true;
			_paymentsFake.visible = false;
			_toMach3Button.visible = false;

			if (!_fakeProgressBg)
			{
				_fakeProgressBg = new FakeProgressBgClass();
				addChild(_fakeProgressBg);
			}
			_fakeProgressBg.visible = true;

			_playButton.visible = false;
			if (!_toStotButton)
			{
				_toStotButton = new ToSlotButton();
				_toStotButton.addEventListener(MouseEvent.CLICK, function(e : Event) : void
				{
					dispatchEvent(new Event("toSlot"));
				});
				addChild(_toStotButton);
			}
			_toStotButton.visible = true;

			if (!_timeProgress)
			{
				_timeProgress = new TimeProgress();
				_timeProgress.maxTime = 30;
				_timeProgress.currentTime = 60;
				addChild(_timeProgress)
			}
			_timeProgress.visible = true;

			if (!_boosterPanel)
			{
				_boosterPanel = new BoosterPanel();
				addChild(_boosterPanel);
			}
			_boosterPanel.visible = true;

			if (!_energyProgress)
			{
				_energyProgress = new FreezeProgress();
				addChild(_energyProgress);
			}
			_energyProgress.visible = true;

			addChildAt(_animBase, numChildren - 1);

			// _matchComponent.startReinitAnimation();

			onResize();
		}

		public function setMatchCurrentTime(matchCurrentTime : Number) : void
		{
			_timeProgress.currentTime = matchCurrentTime;
		}

		public function setMatchMaxTime(maxTime : Number) : void
		{
			_timeProgress.maxTime = maxTime;
		}

		public function matchReinit() : void
		{
			// Здесь мы говоим матч компоненту - сделать новый филд и
			// проиграть reinit анимацию

			_matchComponent.reinit();
			_matchComponent.playFall();
		}

		public function playWinAnimation(win : Number, onWinAnimComeplete : Function) : void
		{
			var tf :TextField = new TextField();
			_animBase.addChild(tf);
			tf.text = "Выйгрыш:" + win.toString();
			tf.textColor = 0xFFFFFF;
			tf.width = 100;
			tf.height = 20;
			tf.x = (_w - tf.width) >> 1;
			tf.y = 60;
			
			function foo ():void
			{
				_animBase.removeChild(tf);
				onWinAnimComeplete();
			}
			
			
			var timeLine:TimelineLite = new TimelineLite({onComplete:foo});
			timeLine.append( TweenLite.to(tf, 1, { scaleX:2, scaleY:2}) );
			timeLine.append( TweenLite.to(tf, 1, { scaleX:1, scaleY:1}) );
		}
	}
}
