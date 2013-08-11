package test.MyTestProject
{
	import com.onlyplay.slotmatch3.components.games.elements.booster.BoosterPanel;
	import com.onlyplay.slotmatch3.components.games.elements.booster.Booster;
	import com.onlyplay.slotmatch3.components.games.elements.PauseButton;
	import com.onlyplay.slotmatch3.components.games.elements.TimeProgress;
	import com.onlyplay.slotmatch3.components.games.elements.scrollArea.PaymentsScrollArea;

	import alternativa.gui.container.scrollPane.ScrollPane;

	import flash.geom.Rectangle;
	import flash.display.Bitmap;

	import alternativa.gui.container.scrollArea.ScrollArea;

	import com.onlyplay.slotmatch3.components.games.elements.FrendProgress;

	import alternativa.gui.container.linear.VBox;
	import alternativa.gui.container.tabPanel.TabData;

	import com.onlyplay.slotmatch3.components.games.elements.tab.RoomTabButton;
	import com.onlyplay.slotmatch3.components.games.elements.tab.RoomTabPanel;

	import alternativa.gui.controls.button.BaseButton;
	import alternativa.gui.controls.text.Label;
	import alternativa.gui.controls.text.LabelTF;
	import alternativa.gui.data.DataProvider;
	import alternativa.gui.layout.LayoutManager;
	import alternativa.init.GUI;

	import com.onlyplay.slotmatch3.components.games.elements.BetButtonLeft;
	import com.onlyplay.slotmatch3.components.games.elements.BetButtonRight;
	import com.onlyplay.slotmatch3.components.games.elements.BetStepper;
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
	import com.onlyplay.slotmatch3.components.games.elements.ToMach3Button;
	import com.onlyplay.slotmatch3.components.games.elements.list.RoomList;
	import com.onlyplay.slotmatch3.components.games.elements.ns.ExperienceProgressBar;
	import com.onlyplay.slotmatch3.components.games.elements.scroller.SimpleScrollBar;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.Font;
	import flash.text.TextFormat;

	/**
	 * @author Design3d
	 */
	[SWF(backgroundColor="#dddddd", frameRate="31", width="900", height="500")]
	public class TestAlternativaButton extends Sprite
	{
		[Embed( source="assets/font/FranklinGothicDemiC.otf", 
		fontName="franklin",
		embedAsCFF="false",
		mimeType="application/x-font"
		, unicodeRange = "U+0030-U+0039"
		)]
		private var franklin : Class;
		[Embed( source="assets/font/FranklinGothicDemiCondC.otf", 
		fontName="franklin2",
		mimeType="application/x-font",
		embedAsCFF="false"
		,unicodeRange = "U+0030-U+0039"
		)]
		private var franklin2 : Class;
		[Embed(source="assets/facebook/facebook/id_6/id_6/booster_paytable/ paytable/pay.png", mimeType="image/png")]
		private static var ScrollContent : Class;

		//
		public function TestAlternativaButton()
		{
			Font.registerFont(franklin);
			Font.registerFont(franklin2);

			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.stageFocusRect = false;

			this.mouseEnabled = false;
			this.tabEnabled = false;

			GUI.init(stage);

			LayoutManager.init(stage, [this]);

			// GUI.hideLogo();

			var format : TextFormat = new TextFormat("_sans", 10);
			// LabelTF.defaultFormat = format;
			LabelTF.embedFonts = false;

			var labeltf : LabelTF = new LabelTF();
			labeltf.size = 10;
			labeltf.tf.border = true;
			labeltf.x = 20;

			// labeltf.width = 100;
			// labeltf.height = 50;
			// labeltf.
			addChild(labeltf);
			labeltf.text = "hello";

			var label : Label = new Label();

			label.x = 50;
			addChild(label);
			label.text = "good evening";

			var playButton : BaseButton = new PlayButton();
			addChild(playButton);
			playButton.x = 200;
			playButton.y = 150;

			// playButton.locked = true;

			var betButtonRight : BaseButton = new BetButtonRight();
			addChild(betButtonRight);
			// betButtonRight.y = 100;
			betButtonRight.y = playButton.height + 10;
			betButtonRight.x = 100;

			var betButtonLeft : BaseButton = new BetButtonLeft();
			addChild(betButtonLeft);
			betButtonLeft.y = 100;
			// playButton.height + 10;

			var lineButtonLeft : BaseButton = new LineButtonLeft();
			addChild(lineButtonLeft);
			lineButtonLeft.x = 200;
			lineButtonLeft.y = 100;

			var lineButtonRight : BaseButton = new LineButtonRight();
			addChild(lineButtonRight);
			lineButtonRight.x = 300;
			lineButtonRight.y = 100;

			var payButton : BaseButton = new PayButton();
			addChild(payButton);
			payButton.x = 200;
			payButton.y = 10;

			var maxBetButton : BaseButton = new MaxBetButton();
			addChild(maxBetButton);
			maxBetButton.x = 300;
			maxBetButton.y = 50;

			var mapButton : BaseButton = new MapButton();
			addChild(mapButton);
			mapButton.x = 350;
			// mapButton.y = 350;

			var betStepper : BetStepper = new BetStepper();
			betStepper.textBottom = "Ставка";
			addChild(betStepper);
			betStepper.y = 300;
			betStepper.x = 10;
			// betStepper.width = 200;

			var toMachButton : BaseButton = new ToMach3Button();
			addChild(toMachButton);
			toMachButton.x = stage.stageWidth - toMachButton.width;
			toMachButton.y = stage.stageHeight - toMachButton.height - 30;

			var photoButton : BaseButton = new PhotoButton();
			addChild(photoButton);
			photoButton.y = 20;
			photoButton.x = 3;

			var settingsButton : BaseButton = new SettingsButton();
			addChild(settingsButton);
			settingsButton.y = 20;
			settingsButton.x = 30;

			var roomProgress : ProgressBarBase = new RoomProgress();
			addChild(roomProgress);
			// roomProgress.percent = 0.99;
			roomProgress.maxValue = 1000000;
			roomProgress.value = 750000;
			roomProgress.y = 70;
			roomProgress.x = 5;
			// roomProgress.value

			var experienceProgressBar : ExperienceProgressBar = new ExperienceProgressBar();
			experienceProgressBar.level = 33;
			addChild(experienceProgressBar);
			experienceProgressBar.maxValue = 1000;
			experienceProgressBar.value = 1000;

			experienceProgressBar.y = 200;
			experienceProgressBar.x = 5;

			var plusButton : BaseButton = new PlusButton();
			addChild(plusButton);
			plusButton.x = 130;
			plusButton.y = 2;

			var vec : Vector.<Object> = new <Object> [{label:"Маша"}, {label:"Петя"}, {label:"Коля"}];

			var simpleScrollBar : SimpleScrollBar = new SimpleScrollBar();
			addChild(simpleScrollBar);
			simpleScrollBar.height = 100;
			simpleScrollBar.maxScrollPosition = 100;
			simpleScrollBar.x = 270;
			simpleScrollBar.y = 40;

			var roomList : RoomList = new RoomList();
			// roomList.dataProvider = new DataProvider(new <Object>[{label:"Anrew"}, {label:"Tanya"}, {label:"Anrew"}, {label:"Tanya"}]);
			roomList.dataProvider = new DataProvider(vec);
			// roomList.selectedIndex = 2;
			//

			roomList.height = 300;
			roomList.width = 130;
			roomList.x = 460;
			roomList.y = 20;
			addChild(roomList);

			var tabPanel : RoomTabPanel = new RoomTabPanel();
			var tabButton1 : RoomTabButton = new RoomTabButton();
			tabButton1.label = "Игроки";
			var tabButton2 : RoomTabButton = new RoomTabButton();
			tabButton2.label = "Чат";
			var roomList2 : RoomList = new RoomList();
			// roomList.dataProvider = new DataProvider(new <Object>[{label:"Anrew"}, {label:"Tanya"}, {label:"Anrew"}, {label:"Tanya"}]);
			roomList2.dataProvider = new DataProvider(vec);
			// roomList.selectedIndex = 2;
			//

			roomList2.height = 200;
			// roomList2.width = 240;

			tabPanel.addTab(new TabData(tabButton1, roomList2));
			tabPanel.addTab(new TabData(tabButton2, new VBox(3)));

			tabPanel.height = 300;
			tabPanel.width = 130;

			tabPanel.x = 600;
			tabPanel.y = 10;
			addChild(tabPanel);

			tabPanel.selectTab = 1;
			tabPanel.selectTab = 0;

			// var roomProgress : ProgressBarBase = new RoomProgress();
			// addChild(roomProgress);
			//			//  roomProgress.percent = 0.99;
			// roomProgress.maxValue = 1000000;
			// roomProgress.value = 750000;
			// roomProgress.y = 70;
			// roomProgress.x = 5;

			var frendProgress : FrendProgress = new FrendProgress();
			addChild(frendProgress);

			frendProgress.maxValue = 1000000;
			frendProgress.value = 1000000;
			frendProgress.y = 400;
			frendProgress.x = 10;

			// --- scroll area
			var scrollArea : ScrollArea = new PaymentsScrollArea();

			addChild(scrollArea);

			// scrollArea.contentScrollRect = new Rectangle(0, 0, 100, 100);

			var scrollContend : Bitmap = new ScrollContent();

			scrollArea.content = scrollContend;

			scrollArea.x = 320;
			scrollArea.y = 190;

			// ------------------------------

			var scrollBar : SimpleScrollBar = new SimpleScrollBar();

			var scrollPane : ScrollPane = new ScrollPane();

			scrollPane.scrollBar = scrollBar;
			// scrollPane.scro
			scrollPane.width = 150;
			scrollPane.height = 100;

			addChild(scrollPane);
			var content : Bitmap = new ScrollContent();
			scrollPane.content = content;

			scrollPane.x = 440;
			scrollPane.y = 300;

			var timeProgress : TimeProgress = new TimeProgress();
			addChild(timeProgress);
			timeProgress.maxTime = 20;
			timeProgress.currentTime = 15;
			// timeProgress.percent = 0.5;
			// timeProgress.maxValue = 1000000;
			// timeProgress.value = 1000000;
			timeProgress.x = 10;
			timeProgress.y = 430;

			var pausebutton : BaseButton = new PauseButton();
			addChild(pausebutton);
			pausebutton.x = 300;

			var booster : Booster = new Booster();
			booster.skin = [Booster.BombaAClass, Booster.BombaNClass];
			addChild(booster);
			booster.x = 500;
			booster.y = 400;

			var boosterPanel : BoosterPanel = new BoosterPanel();
			addChild(boosterPanel);

			boosterPanel.x = stage.stageWidth - boosterPanel.width ;
		}
	}
}
