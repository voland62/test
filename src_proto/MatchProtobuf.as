package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import MatchLevelProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MatchProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("MatchProtobuf.time", "time", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var time:int;

		/**
		 *  @private
		 */
		public static const MBTIME:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("MatchProtobuf.mbTime", "mbTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var mbTime:int;

		/**
		 *  @private
		 */
		public static const MBENERGY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("MatchProtobuf.mbEnergy", "mbEnergy", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var mbEnergy:int;

		/**
		 *  @private
		 */
		public static const MBMONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("MatchProtobuf.mbMoney", "mbMoney", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var mbMoney:int;

		/**
		 *  @private
		 */
		public static const ICONENERGY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("MatchProtobuf.iconEnergy", "iconEnergy", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var iconEnergy:int;

		/**
		 *  @private
		 */
		public static const BOOSTERENERGY:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("MatchProtobuf.boosterEnergy", "boosterEnergy", (6 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var boosterEnergy:Number;

		/**
		 *  @private
		 */
		public static const BOOSTERENERGYGROWTHPERSECOND:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("MatchProtobuf.boosterEnergyGrowthPerSecond", "boosterEnergyGrowthPerSecond", (7 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var boosterEnergyGrowthPerSecond:Number;

		/**
		 *  @private
		 */
		public static const LEVELS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("MatchProtobuf.levels", "levels", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return MatchLevelProtobuf; });

		[ArrayElementType("MatchLevelProtobuf")]
		public var levels:Array = [];

		/**
		 *  @private
		 */
		public static const STARTLEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("MatchProtobuf.startLevel", "startLevel", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var startLevel$field:int;

		private var hasField$0:uint = 0;

		public function clearStartLevel():void {
			hasField$0 &= 0xfffffffe;
			startLevel$field = new int();
		}

		public function get hasStartLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set startLevel(value:int):void {
			hasField$0 |= 0x1;
			startLevel$field = value;
		}

		public function get startLevel():int {
			return startLevel$field;
		}

		/**
		 *  @private
		 */
		public static const BOMBCHANCE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("MatchProtobuf.bombChance", "bombChance", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bombChance$field:int;

		public function clearBombChance():void {
			hasField$0 &= 0xfffffffd;
			bombChance$field = new int();
		}

		public function get hasBombChance():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set bombChance(value:int):void {
			hasField$0 |= 0x2;
			bombChance$field = value;
		}

		public function get bombChance():int {
			return bombChance$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.time);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.mbTime);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.mbEnergy);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.mbMoney);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.iconEnergy);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 6);
			com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, this.boosterEnergy);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 7);
			com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, this.boosterEnergyGrowthPerSecond);
			for (var levels$index:uint = 0; levels$index < this.levels.length; ++levels$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.levels[levels$index]);
			}
			if (hasStartLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, startLevel$field);
			}
			if (hasBombChance) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, bombChance$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var time$count:uint = 0;
			var mbTime$count:uint = 0;
			var mbEnergy$count:uint = 0;
			var mbMoney$count:uint = 0;
			var iconEnergy$count:uint = 0;
			var boosterEnergy$count:uint = 0;
			var boosterEnergyGrowthPerSecond$count:uint = 0;
			var startLevel$count:uint = 0;
			var bombChance$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchProtobuf.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (mbTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchProtobuf.mbTime cannot be set twice.');
					}
					++mbTime$count;
					this.mbTime = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (mbEnergy$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchProtobuf.mbEnergy cannot be set twice.');
					}
					++mbEnergy$count;
					this.mbEnergy = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (mbMoney$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchProtobuf.mbMoney cannot be set twice.');
					}
					++mbMoney$count;
					this.mbMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (iconEnergy$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchProtobuf.iconEnergy cannot be set twice.');
					}
					++iconEnergy$count;
					this.iconEnergy = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (boosterEnergy$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchProtobuf.boosterEnergy cannot be set twice.');
					}
					++boosterEnergy$count;
					this.boosterEnergy = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				case 7:
					if (boosterEnergyGrowthPerSecond$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchProtobuf.boosterEnergyGrowthPerSecond cannot be set twice.');
					}
					++boosterEnergyGrowthPerSecond$count;
					this.boosterEnergyGrowthPerSecond = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				case 8:
					this.levels.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new MatchLevelProtobuf()));
					break;
				case 9:
					if (startLevel$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchProtobuf.startLevel cannot be set twice.');
					}
					++startLevel$count;
					this.startLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (bombChance$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchProtobuf.bombChance cannot be set twice.');
					}
					++bombChance$count;
					this.bombChance = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
