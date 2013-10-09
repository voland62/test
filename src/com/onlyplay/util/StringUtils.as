package com.onlyplay.util {
	/**
	 * ...
	 * @author smt
	 */
	public class StringUtils {
		
		
		
		public function StringUtils() {
			
		}
		
		
		public static function Format3Digits(numInput:*):String {
			var numIn:Number = Number (numInput);
			var znakStr:String = numIn < 0 ? "-" : ""
			var num:Number = Math.abs(numIn);
			var str:Vector.<String> = Vector.<String> (String(num).split("."));
			var celStr:String = str[0];
			var drobStr:String = str.length > 1 ? "." + str[1] : "";
			
			var cel:Vector.<String> = Vector.<String> (String(celStr).split(""));
			var strOut:Vector.<String> = new Vector.<String>();
			var nCounter:uint = 0;
			var startInd:uint = cel.length - 1;
			
			for (var i:int = startInd; i >= 0; i--) {
				nCounter++;
				strOut.unshift(cel[i])
				if (nCounter == 3 && i) {
					strOut.unshift(" ");
					nCounter = 0;
				}
				
			}
			return znakStr + strOut.join("") + drobStr;
		}
		
		
		
		
		
		public static function Strip(str:String, pat1:String, pat2:String):String {
			var out:String = str;
			while (out.indexOf(pat1) != -1) {
				out = out.replace(pat1, pat2);
			}
			return out;
		}
		
		
	}

}