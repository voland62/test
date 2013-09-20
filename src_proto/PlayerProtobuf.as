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
	import AmuletProtobuf;
	import PlayerStatisticProtobuf;
	import ChestsProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PlayerProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GAMEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerProtobuf.gameId", "gameId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gameId:int;

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PlayerProtobuf.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var name:String;

		/**
		 *  @private
		 */
		public static const FACEBOOKID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PlayerProtobuf.facebookId", "facebookId", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var facebookId:String;

		/**
		 *  @private
		 */
		public static const TWITTERID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PlayerProtobuf.twitterId", "twitterId", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var twitterId:String;

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerProtobuf.level", "level", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		public var level:int;

		/**
		 *  @private
		 */
		public static const EXPERIENCE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerProtobuf.experience", "experience", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		public var experience:int;

		/**
		 *  @private
		 */
		public static const EXPERIENCEBOUND:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerProtobuf.experienceBound", "experienceBound", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		public var experienceBound:int;

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerProtobuf.money", "money", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		public var money:int;

		/**
		 *  @private
		 */
		public static const AMULET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PlayerProtobuf.amulet", "amulet", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return AmuletProtobuf; });

		public var amulet:AmuletProtobuf;

		/**
		 *  @private
		 */
		public static const BOOSTERS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PlayerProtobuf.boosters", "boosters", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return BoostersProtobuf; });

		public var boosters:BoostersProtobuf;

		/**
		 *  @private
		 */
		public static const CHESTS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PlayerProtobuf.chests", "chests", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return ChestsProtobuf; });

		public var chests:ChestsProtobuf;

		/**
		 *  @private
		 */
		public static const STATISTIC:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PlayerProtobuf.statistic", "statistic", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerStatisticProtobuf; });

		public var statistic:PlayerStatisticProtobuf;

		/**
		 *  @private
		 */
		public static const ACHIEVEMENTIDS:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("PlayerProtobuf.achievementIds", "achievementIds", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var achievementIds:Array = [];

		/**
		 *  @private
		 */
		public static const CURRENTISLANDID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerProtobuf.currentIslandId", "currentIslandId", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var currentIslandId$field:int;

		private var hasField$0:uint = 0;

		public function clearCurrentIslandId():void {
			hasField$0 &= 0xfffffffe;
			currentIslandId$field = new int();
		}

		public function get hasCurrentIslandId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set currentIslandId(value:int):void {
			hasField$0 |= 0x1;
			currentIslandId$field = value;
		}

		public function get currentIslandId():int {
			return currentIslandId$field;
		}

		/**
		 *  @private
		 */
		public static const CURRENTLOCATIONID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerProtobuf.currentLocationId", "currentLocationId", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var currentLocationId$field:int;

		public function clearCurrentLocationId():void {
			hasField$0 &= 0xfffffffd;
			currentLocationId$field = new int();
		}

		public function get hasCurrentLocationId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set currentLocationId(value:int):void {
			hasField$0 |= 0x2;
			currentLocationId$field = value;
		}

		public function get currentLocationId():int {
			return currentLocationId$field;
		}

		/**
		 *  @private
		 */
		public static const BOT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PlayerProtobuf.bot", "bot", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bot$field:Boolean;

		public function clearBot():void {
			hasField$0 &= 0xfffffffb;
			bot$field = new Boolean();
		}

		public function get hasBot():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set bot(value:Boolean):void {
			hasField$0 |= 0x4;
			bot$field = value;
		}

		public function get bot():Boolean {
			return bot$field;
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
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.amulet);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.boosters);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.chests);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.statistic);
			for (var achievementIds$index:uint = 0; achievementIds$index < this.achievementIds.length; ++achievementIds$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.achievementIds[achievementIds$index]);
			}
			if (hasCurrentIslandId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, currentIslandId$field);
			}
			if (hasCurrentLocationId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, currentLocationId$field);
			}
			if (hasBot) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, bot$field);
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
			var amulet$count:uint = 0;
			var boosters$count:uint = 0;
			var chests$count:uint = 0;
			var statistic$count:uint = 0;
			var currentIslandId$count:uint = 0;
			var currentLocationId$count:uint = 0;
			var bot$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gameId$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.gameId cannot be set twice.');
					}
					++gameId$count;
					this.gameId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (facebookId$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.facebookId cannot be set twice.');
					}
					++facebookId$count;
					this.facebookId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (twitterId$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.twitterId cannot be set twice.');
					}
					++twitterId$count;
					this.twitterId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (experience$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.experience cannot be set twice.');
					}
					++experience$count;
					this.experience = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (experienceBound$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.experienceBound cannot be set twice.');
					}
					++experienceBound$count;
					this.experienceBound = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (amulet$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.amulet cannot be set twice.');
					}
					++amulet$count;
					this.amulet = new AmuletProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.amulet);
					break;
				case 11:
					if (boosters$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.boosters cannot be set twice.');
					}
					++boosters$count;
					this.boosters = new BoostersProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.boosters);
					break;
				case 12:
					if (chests$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.chests cannot be set twice.');
					}
					++chests$count;
					this.chests = new ChestsProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.chests);
					break;
				case 13:
					if (statistic$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.statistic cannot be set twice.');
					}
					++statistic$count;
					this.statistic = new PlayerStatisticProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.statistic);
					break;
				case 14:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.achievementIds);
						break;
					}
					this.achievementIds.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 15:
					if (currentIslandId$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.currentIslandId cannot be set twice.');
					}
					++currentIslandId$count;
					this.currentIslandId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 16:
					if (currentLocationId$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.currentLocationId cannot be set twice.');
					}
					++currentLocationId$count;
					this.currentLocationId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 17:
					if (bot$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProtobuf.bot cannot be set twice.');
					}
					++bot$count;
					this.bot = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
