package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import BoostersProtobuf;
	import PlayerProtobuf;
	import AmuletProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ChestProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHESTID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("ChestProtobuf.chestId", "chestId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var chestId:int;

		/**
		 *  @private
		 */
		public static const CHESTDATE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("ChestProtobuf.chestDate", "chestDate", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var chestDate:int;

		/**
		 *  @private
		 */
		public static const SOURCETYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("ChestProtobuf.sourceType", "sourceType", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var sourceType:int;

		/**
		 *  @private
		 */
		public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("ChestProtobuf.player", "player", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerProtobuf; });

		private var player$field:PlayerProtobuf;

		public function clearPlayer():void {
			player$field = null;
		}

		public function get hasPlayer():Boolean {
			return player$field != null;
		}

		public function set player(value:PlayerProtobuf):void {
			player$field = value;
		}

		public function get player():PlayerProtobuf {
			return player$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("ChestProtobuf.money", "money", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money$field:int;

		private var hasField$0:uint = 0;

		public function clearMoney():void {
			hasField$0 &= 0xfffffffe;
			money$field = new int();
		}

		public function get hasMoney():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set money(value:int):void {
			hasField$0 |= 0x1;
			money$field = value;
		}

		public function get money():int {
			return money$field;
		}

		/**
		 *  @private
		 */
		public static const EXPERIENCE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("ChestProtobuf.experience", "experience", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var experience$field:int;

		public function clearExperience():void {
			hasField$0 &= 0xfffffffd;
			experience$field = new int();
		}

		public function get hasExperience():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set experience(value:int):void {
			hasField$0 |= 0x2;
			experience$field = value;
		}

		public function get experience():int {
			return experience$field;
		}

		/**
		 *  @private
		 */
		public static const AMULET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("ChestProtobuf.amulet", "amulet", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return AmuletProtobuf; });

		private var amulet$field:AmuletProtobuf;

		public function clearAmulet():void {
			amulet$field = null;
		}

		public function get hasAmulet():Boolean {
			return amulet$field != null;
		}

		public function set amulet(value:AmuletProtobuf):void {
			amulet$field = value;
		}

		public function get amulet():AmuletProtobuf {
			return amulet$field;
		}

		/**
		 *  @private
		 */
		public static const BOOSTERS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("ChestProtobuf.boosters", "boosters", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return BoostersProtobuf; });

		private var boosters$field:BoostersProtobuf;

		public function clearBoosters():void {
			boosters$field = null;
		}

		public function get hasBoosters():Boolean {
			return boosters$field != null;
		}

		public function set boosters(value:BoostersProtobuf):void {
			boosters$field = value;
		}

		public function get boosters():BoostersProtobuf {
			return boosters$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.chestId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.chestDate);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.sourceType);
			if (hasPlayer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, player$field);
			}
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, money$field);
			}
			if (hasExperience) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, experience$field);
			}
			if (hasAmulet) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, amulet$field);
			}
			if (hasBoosters) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, boosters$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var chestId$count:uint = 0;
			var chestDate$count:uint = 0;
			var sourceType$count:uint = 0;
			var player$count:uint = 0;
			var money$count:uint = 0;
			var experience$count:uint = 0;
			var amulet$count:uint = 0;
			var boosters$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (chestId$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChestProtobuf.chestId cannot be set twice.');
					}
					++chestId$count;
					this.chestId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (chestDate$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChestProtobuf.chestDate cannot be set twice.');
					}
					++chestDate$count;
					this.chestDate = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (sourceType$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChestProtobuf.sourceType cannot be set twice.');
					}
					++sourceType$count;
					this.sourceType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (player$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChestProtobuf.player cannot be set twice.');
					}
					++player$count;
					this.player = new PlayerProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.player);
					break;
				case 5:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChestProtobuf.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (experience$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChestProtobuf.experience cannot be set twice.');
					}
					++experience$count;
					this.experience = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (amulet$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChestProtobuf.amulet cannot be set twice.');
					}
					++amulet$count;
					this.amulet = new AmuletProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.amulet);
					break;
				case 8:
					if (boosters$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChestProtobuf.boosters cannot be set twice.');
					}
					++boosters$count;
					this.boosters = new BoostersProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.boosters);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
