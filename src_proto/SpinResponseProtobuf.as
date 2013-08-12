package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import WinLinesProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SpinResponseProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WINMONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("SpinResponseProtobuf.winMoney", "winMoney", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var winMoney:int;

		/**
		 *  @private
		 */
		public static const ICONS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("SpinResponseProtobuf.icons", "icons", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var icons:Array = [];

		/**
		 *  @private
		 */
		public static const WINLINES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("SpinResponseProtobuf.winLines", "winLines", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return WinLinesProtobuf; });

		private var winLines$field:WinLinesProtobuf;

		public function clearWinLines():void {
			winLines$field = null;
		}

		public function get hasWinLines():Boolean {
			return winLines$field != null;
		}

		public function set winLines(value:WinLinesProtobuf):void {
			winLines$field = value;
		}

		public function get winLines():WinLinesProtobuf {
			return winLines$field;
		}

		/**
		 *  @private
		 */
		public static const AMULETWINMONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("SpinResponseProtobuf.amuletWinMoney", "amuletWinMoney", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var amuletWinMoney$field:int;

		private var hasField$0:uint = 0;

		public function clearAmuletWinMoney():void {
			hasField$0 &= 0xfffffffe;
			amuletWinMoney$field = new int();
		}

		public function get hasAmuletWinMoney():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set amuletWinMoney(value:int):void {
			hasField$0 |= 0x1;
			amuletWinMoney$field = value;
		}

		public function get amuletWinMoney():int {
			return amuletWinMoney$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.winMoney);
			for (var icons$index:uint = 0; icons$index < this.icons.length; ++icons$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.icons[icons$index]);
			}
			if (hasWinLines) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, winLines$field);
			}
			if (hasAmuletWinMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, amuletWinMoney$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var winMoney$count:uint = 0;
			var winLines$count:uint = 0;
			var amuletWinMoney$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (winMoney$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpinResponseProtobuf.winMoney cannot be set twice.');
					}
					++winMoney$count;
					this.winMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.icons);
						break;
					}
					this.icons.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 3:
					if (winLines$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpinResponseProtobuf.winLines cannot be set twice.');
					}
					++winLines$count;
					this.winLines = new WinLinesProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.winLines);
					break;
				case 4:
					if (amuletWinMoney$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpinResponseProtobuf.amuletWinMoney cannot be set twice.');
					}
					++amuletWinMoney$count;
					this.amuletWinMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
