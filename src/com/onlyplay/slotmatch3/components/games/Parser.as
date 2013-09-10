package com.onlyplay.slotmatch3.components.games
{
	import flash.utils.Endian;
	import flash.utils.ByteArray;

	/**
	 * @author Design3d
	 */
	public class Parser
	{
		public static function parseSpinData(stack : Array) : Array
		{
			trace('stack.length: ' + (stack.length));

			var targetArr : Array = [];
			for (var i : int = 0; i < 5; i++)
			{
				var arr : Array = [];
				for (var j : int = 0; j < 5; j++)
				{
					var index : int = j * 5 + i;
					trace('index: ' + (index));
					//var item : IconInfoProtobuf = stack[index] as IconInfoProtobuf;
					var item : int = stack[index] as int;
					trace('item: ' + (item));
					arr.push(item);
				}
				targetArr.push(arr);
			}

			return targetArr;
		}

		public static function parseByteArray(winLines : ByteArray, bytesPerElement : uint = 1) : Array
		{
			var result : Array = [];
			
			winLines.endian = Endian.LITTLE_ENDIAN;
			
			winLines.position = 0;
			
			

			while (winLines.bytesAvailable)
			{
				var lineNum : int;
				switch(bytesPerElement)
				{
					case 1:
						lineNum = winLines.readByte();
						break;
					case 2:
						lineNum = winLines.readShort();
						break;
					default:
					    lineNum = NaN;
						log("unsupported bytness in Parser.parseByteArray()");
				}

				result.push(lineNum);
			}
			return result;
		}
	}
}
