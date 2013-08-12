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
	public dynamic final class PlayerShortProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GAMEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerShortProtobuf.gameId", "gameId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gameId:int;

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PlayerShortProtobuf.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var name:String;

		/**
		 *  @private
		 */
		public static const FACEBOOKID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PlayerShortProtobuf.facebookId", "facebookId", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var facebookId:String;

		/**
		 *  @private
		 */
		public static const TWITTERID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PlayerShortProtobuf.twitterId", "twitterId", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var twitterId:String;

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerShortProtobuf.level", "level", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		public var level:int;

		/**
		 *  @private
		 */
		public static const EXPERIENCE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerShortProtobuf.experience", "experience", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		public var experience:int;

		/**
		 *  @private
		 */
		public static const EXPERIENCEBOUND:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerShortProtobuf.experienceBound", "experienceBound", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		public var experienceBound:int;

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerShortProtobuf.money", "money", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		public var money:int;

		/**
		 *  @private
		 */
		public static const ROOMWINSAMOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerShortProtobuf.roomWinsAmount", "roomWinsAmount", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var roomWinsAmount$field:int;

		private var hasField$0:uint = 0;

		public function clearRoomWinsAmount():void {
			hasField$0 &= 0xfffffffe;
			roomWinsAmount$field = new int();
		}

		public function get hasRoomWinsAmount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set roomWinsAmount(value:int):void {
			hasField$0 |= 0x1;
			roomWinsAmount$field = value;
		}

		public function get roomWinsAmount():int {
			return roomWinsAmount$field;
		}

		/**
		 *  @private
		 */
		public static const PROGRESS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerShortProtobuf.progress", "progress", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var progress$field:int;

		public function clearProgress():void {
			hasField$0 &= 0xfffffffd;
			progress$field = new int();
		}

		public function get hasProgress():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set progress(value:int):void {
			hasField$0 |= 0x2;
			progress$field = value;
		}

		public function get progress():int {
			return progress$field;
		}

		/**
		 *  @private
		 */
		public static const LASTWIN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerShortProtobuf.lastWin", "lastWin", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lastWin$field:int;

		public function clearLastWin():void {
			hasField$0 &= 0xfffffffb;
			lastWin$field = new int();
		}

		public function get hasLastWin():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set lastWin(value:int):void {
			hasField$0 |= 0x4;
			lastWin$field = value;
		}

		public function get lastWin():int {
			return lastWin$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.gameId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.name);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.facebookId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.twitterId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.level);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.experience);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.experienceBound);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.money);
			if (hasRoomWinsAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, roomWinsAmount$field);
			}
			if (hasProgress) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, progress$field);
			}
			if (hasLastWin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, lastWin$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var gameId$count:uint = 0;
			var name$count:uint = 0;
			var facebookId$count:uint = 0;
			var twitterId$count:uint = 0;
			var level$count:uint = 0;
			var experience$count:uint = 0;
			var experienceBound$count:uint = 0;
			var money$count:uint = 0;
			var roomWinsAmount$count:uint = 0;
			var progress$count:uint = 0;
			var lastWin$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gameId$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerShortProtobuf.gameId cannot be set twice.');
					}
					++gameId$count;
					this.gameId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerShortProtobuf.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (facebookId$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerShortProtobuf.facebookId cannot be set twice.');
					}
					++facebookId$count;
					this.facebookId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (twitterId$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerShortProtobuf.twitterId cannot be set twice.');
					}
					++twitterId$count;
					this.twitterId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerShortProtobuf.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (experience$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerShortProtobuf.experience cannot be set twice.');
					}
					++experience$count;
					this.experience = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (experienceBound$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerShortProtobuf.experienceBound cannot be set twice.');
					}
					++experienceBound$count;
					this.experienceBound = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerShortProtobuf.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (roomWinsAmount$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerShortProtobuf.roomWinsAmount cannot be set twice.');
					}
					++roomWinsAmount$count;
					this.roomWinsAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (progress$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerShortProtobuf.progress cannot be set twice.');
					}
					++progress$count;
					this.progress = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (lastWin$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerShortProtobuf.lastWin cannot be set twice.');
					}
					++lastWin$count;
					this.lastWin = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
