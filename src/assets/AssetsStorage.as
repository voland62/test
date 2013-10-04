package assets
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;


        /**
         * @author andrey
         */
        public class AssetsStorage extends EventDispatcher {
                private static var _instance : AssetsStorage;


                //  COllection of AssetLoader's
                private var storage : Dictionary = new Dictionary( false );


                [Embed (source="/Achievements/achievement_3_in_the_row.png" ) ]
                private var Ach_3 : Class;
                [Embed (source="/Achievements/achievement_3x5_in_the_row.png" ) ]
                private var Ach_3x5 : Class;
                [Embed (source="/Achievements/achievement_4_in_the_row.png" ) ]
                private var Ach_4 : Class;
                [Embed (source="/Achievements/achievement_4x5_in_the_row.png" ) ]
                private var Ach_4x5 : Class;
                [Embed (source="/Achievements/achievement_5_in_the_row.png" ) ]
                private var Ach_5 : Class;
                [Embed (source="/Achievements/achievement_5x5_in_the_row.png" ) ]
                private var Ach_5x5 : Class;
				
//                [Embed (source="assets/lib.swf", symbol="arrow") ]
//                private var ArrowClass : Class;
//                
//                [Embed (source="assets/lib.swf", symbol="flip") ]
//                private var FlipClass : Class;
                
//              [Embed (source="assets/lib.swf", symbol="logo") ]
//              private var LogoClass : Class;


                public function AssetsStorage(target : IEventDispatcher = null) {
                        super( target );
                        
                        initEmbeded( );
                }


                private function initEmbeded() : void {
                        
                       // init(  "arrow", ArrowClass );
                       // init(  "flip", FlipClass );
                        //init(  "logo", LogoClass );
//                      var url : String = "arrow";
//                      var assetLoader : AssetLoader = new AssetLoader( url );
//                      
//                      var a : DisplayObject = new ArrowClass( );
//                      assetLoader.setupBitmapData( a, 0, 0 );
//                      storage[url] = assetLoader;
                        
                        init( 'ach_3' , Ach_3);
						init( 'ach_3x5' , Ach_3x5);
						init( 'ach_4' , Ach_4);
                        
                        function init( url : String, Clazz : Class ) : void {
                                
                                var assetLoader : AssetLoader = new AssetLoader( url );                 
                                var a : DisplayObject = new Clazz( );
                                assetLoader.setupBitmapData( a, 0, 0 );
                                storage[url] = assetLoader;
                        }
                }


                public static function get instance() : AssetsStorage {
                        if ( !_instance ) {
                                _instance = new AssetsStorage( );
                        }
                        return _instance;
                }
                
                


                


                public function getAsset( url : String, callBack : Function, copy : Boolean = false ) : void {
                        
                        var assetLoader : AssetLoader;// = storage[url] as AssetLoader;


                        if ( storage[url] ) {
                                
                                assetLoader = storage[url];
                                if (assetLoader.loaded) {
                                        callBack( assetLoader.getContentBitmapData( ) );
                                } else {
                                        assetLoader.addCallBack( callBack );
                                }
                        } else {
                                assetLoader = new AssetLoader( url );
                                //assetLoader.neeedCopy = copy;
                                assetLoader.addCallBack( callBack );
                                //assetLoader.addEventListener( "asset_loaded", assetLoaded );
                                storage[url] = assetLoader;
                                assetLoader.load( );
                        }
                }


//              private function assetLoaded( e : Event ) : void {
//                      //var asldr : AssetLoader = e.target as AssetLoader;
//              }
        }
}


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.Loader;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLRequest;


internal  class AssetLoader  extends EventDispatcher {
        private var loader : Loader;
        //private var request : URLRequest;
        private var _contentBitmapData : BitmapData;
        private var _contentData : Object;
        private var _contentDataCopy : Object;
        private var callBacks : Array = [];


        public var url : String;
        public var loaded : Boolean = false;
        private var request : URLRequest;
        
        public var neeedCopy : Boolean = false;
        


        public function addCallBack(callBack : Function) : void {
                callBacks.push( callBack );
        }


        public function AssetLoader( url : String) {
                
                this.url = url;
                request = new URLRequest( url );
                loader = new Loader( );
                
                loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onLoadd );
                
                //loader.contentLoaderInfo.addEventListener( Event.INIT, onLoad );
                //loader.contentLoaderInfo.addEventListener( HTTPStatusEvent.HTTP_STATUS, httpStatusHandler );
                //loader.contentLoaderInfo.addEventListener( Event.INIT, initHandler );
                //loader.contentLoaderInfo.addEventListener( Event.OPEN, openHandler );
                //loader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, AssetsStorage.test );


                loader.contentLoaderInfo.addEventListener( SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler );
                loader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, ioErrorHandler );
                loader.contentLoaderInfo.addEventListener( Event.UNLOAD, unLoadHandler );
        }


        
        public function getContentBitmapData() : Object {
                return  _contentData; //_contentBitmapData;
        }
        
        public function getContentBitmapDataCopy() : Object {
                return  null;//TODO_contentData; //_contentBitmapData;
        }
        


        private function securityErrorHandler(event : SecurityErrorEvent) : void {
                trace( "Ошибка безопасности при загрузке " + url );
        }


        private function unLoadHandler(event : Event) : void {
                trace( "unload " + url );
        }


        private function ioErrorHandler(event : Event) : void {
                trace( "Ошибка загрузки " + url );
        }


        private function onLoadd(event : Event) : void {
                
                if ( ! neeedCopy ){
                        var w : Number = loader.contentLoaderInfo.width;
                        var h : Number = loader.contentLoaderInfo.height;
                        
                        setupBitmapData( loader.content, w, h );
                        //trace (  "oader.contentLoaderInfo.width:" + loader.contentLoaderInfo.width );
                        
                }else {
                        
                }
                
        }
        
        
//      public function setupBitmapDataCopy( content : Object ):void{
//              if (content is Bitmap) {
//                      _contentBitmapData = (content as Bitmap).bitmapData;
//                      _contentDataCopy = _contentBitmapData;
//                      trace( "bitmap loaded" );
//              }else if ( content is Sprite ) {
//                      //var newLoader : Loader = new Loader();
//                      //newLoader.loadBytes( (content as DisplayObject).loaderInfo.bytes);
//                      //newLoader.contentLoaderInfo.addEventListener( Event.COMPLETE, onBytesLoaded);
//                      trace( "sprite loaded" );
//                      
//                      _contentDataCopy = content;
//                      
//                      loaded = true;
//                      
//                      makeLoop();
//                      
//                      return;
//                      
//                      
//              }else if ( content is Class ){
//                      _contentData = content;
//                      
//                      
//              }
//      
//              loaded = true;
//              
//              for each ( var callBack : Function in callBacks) {
//                      //callBack( _contentBitmapData );
//                      callBack( _contentData );
//              }
//              
//              callBacks = [];
//              
//              dispatchEvent( new Event( "asset_loaded" ) );
//      }
        
        
//      private function makeLoop():void{
//              for each ( var callBack : Function in callBacks) {
//                      
//                      var bytesLoader : Loader = new Loader();
//                      bytesLoader.loadBytes(_contentDataCopy); 
//                      
//                      callBack( _contentData );
//              }
//      }
        
        




        public function setupBitmapData( content : Object, w : Number, h : Number ) : void {
                
                //content.loaderInfo.width;
                
                if (content is Bitmap) {
                        _contentBitmapData = (content as Bitmap).bitmapData;
                        _contentData = _contentBitmapData;
                        //trace( "bitmap loaded" );
                }else if ( (content is DisplayObject) && !( content is Bitmap ) ) {
                        
                        //var bmpd : BitmapData = new BitmapData( w, h, true, 0);
                        //bmpd.draw( content );
                        //_contentBitmapData = bmpd;
                        //var className : String = getQualifiedClassName(content);
                        //var className : String = 
                        //trace ( className );
                        //_contentData = loader.contentLoaderInfo.applicationDomain.getDefinition( className ) as Class;
                        //_contentData = getQualifiedClassName(content);get
                        
                        _contentData = content;
                        trace( "sprite loaded" );
                }else if ( content is Class ){
                        _contentData = content;
                }
        
                loaded = true;
                
                for each ( var callBack : Function in callBacks) {
                        //callBack( _contentBitmapData );
                        callBack( _contentData );
                }
                
                callBacks = [];
                
                dispatchEvent( new Event( "asset_loaded" ) );
        }


        public function load() : void {
                loader.load( request );
        }
}