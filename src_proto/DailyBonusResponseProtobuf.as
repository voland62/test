package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DailyBonusResponseProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("DailyBonusResponseProtobuf.money", "money", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var money:int;

		/**
		 *  @private
		 */
		public static const AMULETMONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("DailyBonusResponseProtobuf.amuletMoney", "amuletMoney", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var amuletMoney$field:int;

		private var hasField$0:uint = 0;

		public function clearAmuletMoney():void {
			hasField$0 &= 0xfffffffe;
			amuletMoney$field = new int();
		}

		public function get hasAmuletMoney():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set amuletMoney(value:int):void {
			hasField$0 |= 0x1;
			amuletMoney$field = value;
		}

		public function get amuletMoney():int {
			return amuletMoney$field;
		}

		/**
		 *  @private
		 */
		public static const AMULETTYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("DailyBonusResponseProtobuf.amuletType", "amuletType", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var amuletType$field:int;

		public function clearAmuletType():void {
			hasField$0 &= 0xfffffffd;
			amuletType$field = new int();
		}

		public function get hasAmuletType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set amuletType(value:int):void {
			hasField$0 |= 0x2;
			amuletType$field = value;
		}

		public function get amuletType():int {
			return amuletType$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.money);
			if (hasAmuletMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, amuletMoney$field);
			}
			if (hasAmuletType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, amuletType$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var money$count:uint = 0;
			var amuletMoney$count:uint = 0;
			var amuletType$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyBonusResponseProtobuf.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (amuletMoney$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyBonusResponseProtobuf.amuletMoney cannot be set twice.');
					}
					++amuletMoney$count;
					this.amuletMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (amuletType$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyBonusResponseProtobuf.amuletType cannot be set twice.');
					}
					++amuletType$count;
					this.amuletType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
