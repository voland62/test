/*выполняет загрузку разнотипного содержимого
для начала загрузки вызывается метод
Load(pathArr:Array, onCompleteHandler:Function)
pathArray = массив строковых путей к контенту
onCompleteHandler = функция, которая будет вызвана,
когда всё загрузится и в которую передастся массив результатов загрузки,

Метод Load можно вызывать, даже если сейчас загрузчик занят, он поставит новый заказ в очередь
и обработает, после того как обработает все предыдущие заказы



*/



package com.smith.loader{

    import flash.events.Event;
    import flash.events.IOErrorEvent;

    import flash.net.URLLoader;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.net.URLLoaderDataFormat;
	import flash.media.Sound;
	import flash.utils.Dictionary;
	
	import flash.system.*;
	

    public class KaoLoader  {
        public static const CONTENT_TEXT:String = "textType";
		public static const CONTENT_DATA:String = "dataType";
		public static const CONTENT_SOUND:String = "soundType";
		
		
		private static var inited:Boolean = false;
		private static var urlLoader:URLLoader;
        private static var loader:Loader;
		private static var sound:Sound;
        private static var urlRequest:URLRequest = new URLRequest;
		private static var ldrCntxt:LoaderContext
        //массив заказов на загрузки, каждый заказ - массив путей
        private static var requestsArr:Array = [];
		//массив функций, которые нужно вызвать в клиенте класса
       /* //после окончания загрузки заказов
        private static var clientHandlersArr:Vector.<Function> = new Vector.<Function>();*/
		
		
		
        private static var curRequest:Object;//текущий заказ - массив путей
        
        //массив загруженного отдаваемый заказчику
        private static var result:Object;
        //типы данных загружаемые при помощи URLLoader
        private static var textTypes:String = "*txt*xml*json*atlas*pbj*res*";
        //разновидность текстовых файлов, загружаемые как бинарные
        private static var binaryTypes:String = "*atlas*pbj*res*"
        //типы данных загружаемые при помощи Loader
        private static var dataTypes:String = "*png*jpg*jpeg*gif*swf*";
        //типы данных загружаемые как звуки
		private static var soundTypes:String = "*mp3*wav*"
		//ещё может быть "busy"
        private static var state:String = "free";
		//сниффер - хэш
		private static var dctSniffer:Dictionary = new Dictionary();
		
		
		

        public function KaoLoader() {
            
			
			
			
			
			
        }
		
        //обработчик ошибки загрузки.
        private static function onIoErrEvent(e:IOErrorEvent):void {
            trace ("[SmtLoader]:" + e);
            onLoadComplete();
        }
		
		
		 private static function init():void {
			urlLoader = new URLLoader();
            urlLoader.addEventListener(Event.COMPLETE, onLoadComplete);
            urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onIoErrEvent);
            
			loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIoErrEvent);
			 
			//CreateSniffer();
			
			inited = true;
		 }
		
		
		
        //загрузка
        //pathArr -  список (массив) путей того, что скачать
        //onCompleteHandler - ф-ия, которую вызвать,
        //когда всё скачается и скачанное передастся ей в аргументе массивом
        public static function Load(path:String, onCompleteHandler:Function, contentType:String = ""):void {
            requestsArr.push({path:path, handler:onCompleteHandler, conType:contentType});
            //clientHandlersArr.push(onCompleteHandler);
            if (state=="free"){
                state = "busy";
                StartLoad();
            }
        }

        private static function StartLoad():void {
            
			if (!inited) init();
			
			//если все заказы выполнены
            if (requestsArr.length == 0) {
                state = "free";
                return;
            }
           
			//считаем текущим заказом первый из имеющихся в списке
            curRequest = requestsArr[0];
            var type:String = GetContentType(curRequest);
			
			
			
			//type = curRequest.conType;
			
			
			
			
			
			
			
			
           
			
			//сниффер :))))
			/*if (path == "http://109.251.111.130:20002//d1a8305c-d9a1-4e2c-a056-6be91841f3f0//3e70c4f3-7b56-4915-aa70-9d1e99cb1b25/7b99734a-770a-478b-bc96-b6ba9e2a5ad4.swf?hash=7b8de5597f39b13c6f7efa6775c04986secur_") {
				path = "pano0.swf";
			}
			if (path == "http://109.251.111.130:20002//d1a8305c-d9a1-4e2c-a056-6be91841f3f0//3e70c4f3-7b56-4915-aa70-9d1e99cb1b25/9de40119-ba09-4af4-8853-4ffd47626c06.swf?hash=f6714f3e4b786f03d8f08b3743843a72secur_") {
				path = "pano3.swf";
			}*/
			
			//сниффер
			if (dctSniffer[curRequest.path] != undefined) curRequest.path = dctSniffer[curRequest.path];
			
			//в зависимости от типа определяем способ загрузки
            if (type == "textType") LoadTextType(curRequest.path); 
            if (type == "dataType") LoadDataType(curRequest.path);  
			if (type == "soundType") LoadSoundType(curRequest.path);
			   
        }

        //определяет тип загружаемого контента
        private static function GetContentType(request:Object):String {
            var type:String = "type not defined";
            
			if (request.conType != "") {
				type=request.conType
			}else {
				var sType:String =  GetExtension(request.path);
		
				if (textTypes.indexOf("*" + sType + "*") != -1)
					type = "textType";
				if (dataTypes.indexOf("*" + sType + "*") != -1)
					type = "dataType";
				 if (soundTypes.indexOf("*" + sType + "*") != -1)
					type = "soundType";
			}
            if (type==null)trace ("KaoLoader.GetContentType: Can't define content type")
			return type;
        }

        //получить расширение загружаемого файла
        private static function GetExtension(path:String):String {
            var ext:String = path.substr(path.lastIndexOf(".") + 1).toLocaleLowerCase();
			var paramsPosition:int = ext.indexOf("?");//после расширения могут быть параметры ("?value=....."), их надо отрезать
			if (paramsPosition != -1) ext = ext.substring(0, paramsPosition).toLocaleLowerCase();
			return ext;
        }

        //загружает текстовые данные
        private static function LoadTextType(path:String):void {
            //выбираем в каком формате будем загружать данные
            var sType:String = GetExtension(path);
            if (binaryTypes.indexOf("*" + sType + "*") != -1) {
                urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
            } else {
                urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
            }
            urlRequest.url = path;
            urlLoader.load(urlRequest);
        }

		
        //загружаем нетекстовые данные
        private static function LoadDataType(path:String):void {
            
			//если к пути загрузки приписано "secur_"- обрезаем приписку и загружаем с лоадер-контекстом
			//if (path.indexOf("secur_")!=-1){
			if (Security.sandboxType == "remote"){
			
				ldrCntxt = new LoaderContext(true);
				ldrCntxt.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
				ldrCntxt.securityDomain = SecurityDomain.currentDomain;
				urlRequest.url = path;// path.substr(0, -6)
				loader.load(urlRequest,ldrCntxt);
			
			}else {
				urlRequest.url = path;
				loader.load(urlRequest);
			}
        }
		
		//загружаем звуки
		private static function LoadSoundType(path:String):void {
			
			createSound();
			
			urlRequest.url = path;
			sound.load(urlRequest);
		}
		
		
		private static function createSound():void {
			
			if (sound) {
				sound.removeEventListener(Event.COMPLETE, onLoadComplete);
				sound.removeEventListener(IOErrorEvent.IO_ERROR, onIoErrEvent);
				sound = null;
			}
			
			sound = new Sound();
			sound.addEventListener(Event.COMPLETE, onLoadComplete);
			sound.addEventListener(IOErrorEvent.IO_ERROR, onIoErrEvent);
		}
		
		
        //данные загрузились
        private static function onLoadComplete(e:Event=null):void {
            //добавляем загруженное в посылку для данного заказчика
            //если чего-то нельзя загрузить (этот метод вызван из обработчика ошибки)
            //в отдаваемой заказчику посылке на данной позиции ставится null
            if (e != null) {
                var type:String = GetContentType(curRequest);
				if (type == "type not defined" && curRequest.length > 1) type = curRequest[1];
				
                if (type == "textType")result={path:curRequest[0], content:e.target.data};
				if (type == "dataType") {
					result={ path:curRequest.path, content:e.target.content };
					/*if (curRequest[0].indexOf("secur_") != -1) {
						trace (e.target.content.loaderInfo.bytesLoaded);
						trace ("")
					}*/
				}
				if (type == "soundType") {
					result={path:curRequest[0], content:e.target };
					sound = new Sound()
				}
            } else {
                result = { path:curRequest[0], content:null };
            }

            //отмечаем, что очередная часть заказа сделана
            //(вычёркиваем верхний путь из текущего заказа
            //var loadedItem:String = curRequest.shift();
            
            //если данный заказ закончен отправляем посылку заказчику
            //if (curRequest.length == 0){
                //отправляем посылку (вызываем  обработчик, переданный заказчиком)
                curRequest.handler.call(null, result);
                //отмечаем, что данный заказ выполнен
                //удаляем верхнюю запись из списка колбеков заказов
                //clientHandlersArr.shift();
                //удаляем верхнюю запись из списка заказов
                requestsArr.shift();
                //очищаем маасив с результатами загрузок
                result = [];
            //}
            //смотрим не надо ли ещё чего скачать
            StartLoad();
        }
		
		
		//------------------------ сниффер ---------------------------------
		/*private static function CreateSniffer():void {
			dctSniffer = new Dictionary();
			//тут же можно прписать сниффы, которые не добавляются динамически
		}*/
		
		public static function AddToSniffer(oldPath:String, newPath:String):void {
			dctSniffer[oldPath] = newPath;
		}
		
		public static function RemoveFromSniffer(oldPath:String):void {
			if (dctSniffer[oldPath] != undefined)delete dctSniffer[oldPath]
		}
		
		
    }
}