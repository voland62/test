package test.MyTestProject
{
	import com.onlyplay.slotmatch3.components.games.elements.InfoButton;
	import alternativa.gui.event.ResizableObjectEvent;
	import alternativa.gui.container.SimpleContainer;
	import alternativa.gui.container.Container;
	import alternativa.gui.mouse.resizableObject.ResizableObject;
	import alternativa.gui.container.linear.VBox;
	import alternativa.gui.container.scrollArea.ScrollArea;
	import alternativa.gui.container.scrollPane.ScrollPane;
	import alternativa.gui.container.tabPanel.TabData;
	import alternativa.gui.controls.button.BaseButton;
	import alternativa.gui.controls.text.Label;
	import alternativa.gui.controls.text.LabelTF;
	import alternativa.gui.data.DataProvider;
	import alternativa.gui.layout.LayoutManager;
	import alternativa.gui.primitives.stretch.StretchBitmap;
	import alternativa.init.GUI;

	import assets.DialogClasses;

	import com.onlyplay.slotmatch3.components.dialogs.Dialog;
	import com.onlyplay.slotmatch3.components.dialogs.TimeIsOverDialog;
	import com.onlyplay.slotmatch3.components.dialogs.panels.RoundPanel1;
	import com.onlyplay.slotmatch3.components.dialogs.panels.RoundPanel2;
	import com.onlyplay.slotmatch3.components.dialogs.panels.RoundPanel3;
	import com.onlyplay.slotmatch3.components.dialogs.panels.RoundPanelBase;
	import com.onlyplay.slotmatch3.components.games.elements.BetButtonLeft;
	import com.onlyplay.slotmatch3.components.games.elements.BetButtonRight;
	import com.onlyplay.slotmatch3.components.games.elements.BetStepper;
	import com.onlyplay.slotmatch3.components.games.elements.FreezeProgress;
	import com.onlyplay.slotmatch3.components.games.elements.FrendProgress;
	import com.onlyplay.slotmatch3.components.games.elements.LineButtonLeft;
	import com.onlyplay.slotmatch3.components.games.elements.LineButtonRight;
	import com.onlyplay.slotmatch3.components.games.elements.MapButton;
	import com.onlyplay.slotmatch3.components.games.elements.MaxBetButton;
	import com.onlyplay.slotmatch3.components.games.elements.PauseButton;
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
	import com.onlyplay.slotmatch3.components.games.elements.booster.Booster;
	import com.onlyplay.slotmatch3.components.games.elements.booster.BoosterPanel;
	import com.onlyplay.slotmatch3.components.games.elements.list.RoomList;
	import com.onlyplay.slotmatch3.components.games.elements.ns.ExperienceProgressBar;
	import com.onlyplay.slotmatch3.components.games.elements.scrollArea.PaymentsScrollArea;
	import com.onlyplay.slotmatch3.components.games.elements.scroller.SimpleScrollBar;
	import com.onlyplay.slotmatch3.components.games.elements.tab.RoomTabButton;
	import com.onlyplay.slotmatch3.components.games.elements.tab.RoomTabPanel;

	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;

	/**
	 * @author Design3d
	 */
	[SWF(backgroundColor="#dddddd", frameRate="31", width="900", height="700")]
	public class TestAlternativaButton extends Sprite
	{
//		[Embed( source="/assets/font/FranklinGothicDemiC.otf", 
//		fontName="franklin",
//		embedAsCFF="false",
//		mimeType="application/x-font"
//		, unicodeRange = "U+0030-U+0039"
//		)]
//		private var franklin : Class;
//		[Embed( source="/assets/font/FranklinGothicDemiCondC.otf", 
//		fontName="franklin2",
//		mimeType="application/x-font",
//		embedAsCFF="false"
//		,unicodeRange = "U+0030-U+0039"
//		)]
//		private var franklin2 : Class;
		[Embed(source="/assets/facebook/facebook/id_6/id_6/booster_paytable/ paytable/pay.png", mimeType="image/png")]
		private static var ScrollContent : Class;

		//
		public function TestAlternativaButton()
		{
			//Font.registerFont(franklin);
			//Font.registerFont(franklin2);

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
			
			var iButton:BaseButton = new InfoButton();
			addChild( iButton);
			iButton.x = 50;
			iButton.y = 10;

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
			photoButton.addEventListener(MouseEvent.CLICK, onPhotoClick);
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
			
			// ----------------------------------

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
			booster.persent = 0.95;
			booster.persent = 0.01;
			booster.x = 500;
			booster.y = 400;

			var boosterPanel : BoosterPanel = new BoosterPanel();
			addChild(boosterPanel);

			boosterPanel.x = stage.stageWidth - boosterPanel.width ;
			
			var freezeProgress :FreezeProgress = new FreezeProgress();
			addChild(freezeProgress);
			freezeProgress.percent = 0.5;
			
			freezeProgress.x = 0;
			freezeProgress.y = 550;
			
			var starProgress : StarProgress = new StarProgress();
			addChild(starProgress);
			// starProgress.percent = 0.75;
			starProgress.setProgress(0.25, false);
			starProgress.setProgress(0.75, true);
			
			starProgress.width = 400;
			starProgress.height = 30;
			
			starProgress.x = 100;
			starProgress.y = 490;
			
			var vBox:VBox = new VBox(5);
			addChild(vBox);
			vBox.x = 450;
			vBox.y = 450;
			
//			var roundPanel:RoundPanelBase = new RoundPanel1();
//			vBox.addChild( roundPanel );
//			roundPanel.width = 300;
//			roundPanel.x = 450;
//			roundPanel.y = 450;
//			
//			var roundPanel2:RoundPanelBase = new RoundPanel2();
//			vBox.addChild( roundPanel2 );
//			roundPanel2.width = 300;
//			roundPanel2.x = 450;
//			roundPanel2.y = 490;
//			
//			var roundPanel3:RoundPanelBase = new RoundPanel3();
//			vBox.addChild( roundPanel3 );
//			roundPanel3.width = 300;
//			roundPanel3.x = 450;
//			roundPanel3.y = 550;
			
			vBox.width = 300;
			vBox.height = 200;
			
//			var roundPanel4:RoundPanelBase = new RoundPanel4();
//			addChild( roundPanel4 );
//			roundPanel4.width = 300;
//			roundPanel4.x = 450;
//			roundPanel4.y = 600;
//			
//			var roundPanel5:RoundPanelBase = new RoundPanel5();
//			addChild( roundPanel5 );
//			roundPanel5.width = 350;
//			roundPanel5.x = 450;
//			roundPanel5.y = 620;
			
			
//			var cont:SimpleContainer = new SimpleContainer();
//			cont.x = cont.y = 40;
//			addChild(cont);
			//cont.mouseChildren = true;
			//cont.mouseEnabled = true;
			
//			var _squareTable :StretchBitmap = new StretchBitmap(
//								DialogClasses.tableBitmapData, 
//								DialogClasses.tableCorner , 
//								DialogClasses.tableCorner , 
//								DialogClasses.tableCorner , 
//								DialogClasses.tableCorner );
//								
//			//cont.addChild(_squareTable);
//			addChild(_squareTable);
//			//_squareTable.mouseChildren = true;
//			//_squareTable.mouseEnabled = true;
//			
//			
//			var resizableObject:ResizableObject = new ResizableObject();
//			resizableObject.border = 20;
//			_squareTable.addChild(resizableObject);
//			resizableObject.resizableContainer = _squareTable;
//			resizableObject.addEventListener(ResizableObjectEvent.START, function (e:*):void {trace ( "---resize start---");});
//			resizableObject.addEventListener(ResizableObjectEvent.CHANGE, function (e:*):void {trace ( "---resize change---");});
//			_squareTable.width = _squareTable.height = 100;
//			resizableObject.resize(100, 100);
			//resizableObject.height = resizableObject.width = 100;
			//resizableObject.drawGraphics();
			//cont.width  = cont.height  = 100;
		}

		private function onPhotoClick( e : MouseEvent) : void
		{
			var timeOverDialog: Dialog = new TimeIsOverDialog(); 
			//timeOverDialog.width = 400;
			//timeOverDialog.height = 200;
			timeOverDialog.title = "Закончилось время";
			timeOverDialog.x = (stage.stageWidth - timeOverDialog.width)>>1;
			timeOverDialog.y = (stage.stageHeight - timeOverDialog.height)>>1;
			addChild(timeOverDialog);
		}
	}
}
