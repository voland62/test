package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import AmuletsProtobuf;
	import LoginResponseProtobuf.LoginStatus;
	import PlayerInventoryProtobuf;
	import PlayerGiftsProtobuf;
	import PlayerProtobuf;
	import PurchasesProtobuf;
	import RatingProtobuf;
	import AchievementsProtobuf;
	import IslandsProtobuf;
	import EmotionsProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class LoginResponseProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GAMEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LoginResponseProtobuf.gameId", "gameId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gameId:int;

		/**
		 *  @private
		 */
		public static const LOGINSTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("LoginResponseProtobuf.loginStatus", "loginStatus", (2 << 3) | com.netease.protobuf.WireType.VARINT, LoginResponseProtobuf.LoginStatus);

		public var loginStatus:int;

		/**
		 *  @private
		 */
		public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LoginResponseProtobuf.player", "player", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerProtobuf; });

		public var player:PlayerProtobuf;

		/**
		 *  @private
		 */
		public static const ISLANDS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LoginResponseProtobuf.islands", "islands", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return IslandsProtobuf; });

		public var islands:IslandsProtobuf;

		/**
		 *  @private
		 */
		public static const ACHIEVEMENTS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LoginResponseProtobuf.achievements", "achievements", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return AchievementsProtobuf; });

		public var achievements:AchievementsProtobuf;

		/**
		 *  @private
		 */
		public static const PURCHASES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LoginResponseProtobuf.purchases", "purchases", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PurchasesProtobuf; });

		public var purchases:PurchasesProtobuf;

		/**
		 *  @private
		 */
		public static const GIFTS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LoginResponseProtobuf.gifts", "gifts", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerGiftsProtobuf; });

		public var gifts:PlayerGiftsProtobuf;

		/**
		 *  @private
		 */
		public static const RATING:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LoginResponseProtobuf.rating", "rating", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return RatingProtobuf; });

		public var rating:RatingProtobuf;

		/**
		 *  @private
		 */
		public static const AMULETS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LoginResponseProtobuf.amulets", "amulets", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return AmuletsProtobuf; });

		public var amulets:AmuletsProtobuf;

		/**
		 *  @private
		 */
		public static const EMOTIONS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LoginResponseProtobuf.emotions", "emotions", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return EmotionsProtobuf; });

		public var emotions:EmotionsProtobuf;

		/**
		 *  @private
		 */
		public static const INVENTORY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LoginResponseProtobuf.inventory", "inventory", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerInventoryProtobuf; });

		public var inventory:PlayerInventoryProtobuf;

		/**
		 *  @private
		 */
		public static const TUTORIAL:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("LoginResponseProtobuf.tutorial", "tutorial", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tutorial$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearTutorial():void {
			hasField$0 &= 0xfffffffe;
			tutorial$field = new Boolean();
		}

		public function get hasTutorial():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set tutorial(value:Boolean):void {
			hasField$0 |= 0x1;
			tutorial$field = value;
		}

		public function get tutorial():Boolean {
			return tutorial$field;
		}

		/**
		 *  @private
		 */
		public static const FACEBOOKREWARD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LoginResponseProtobuf.facebookReward", "facebookReward", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var facebookReward$field:int;

		public function clearFacebookReward():void {
			hasField$0 &= 0xfffffffd;
			facebookReward$field = new int();
		}

		public function get hasFacebookReward():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set facebookReward(value:int):void {
			hasField$0 |= 0x2;
			facebookReward$field = value;
		}

		public function get facebookReward():int {
			return facebookReward$field;
		}

		/**
		 *  @private
		 */
		public static const TWITTERREWARD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LoginResponseProtobuf.twitterReward", "twitterReward", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var twitterReward$field:int;

		public function clearTwitterReward():void {
			hasField$0 &= 0xfffffffb;
			twitterReward$field = new int();
		}

		public function get hasTwitterReward():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set twitterReward(value:int):void {
			hasField$0 |= 0x4;
			twitterReward$field = value;
		}

		public function get twitterReward():int {
			return twitterReward$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.gameId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, this.loginStatus);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.player);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.islands);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.achievements);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.purchases);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.gifts);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.rating);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.amulets);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.emotions);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.inventory);
			if (hasTutorial) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, tutorial$field);
			}
			if (hasFacebookReward) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, facebookReward$field);
			}
			if (hasTwitterReward) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, twitterReward$field);
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
			var loginStatus$count:uint = 0;
			var player$count:uint = 0;
			var islands$count:uint = 0;
			var achievements$count:uint = 0;
			var purchases$count:uint = 0;
			var gifts$count:uint = 0;
			var rating$count:uint = 0;
			var amulets$count:uint = 0;
			var emotions$count:uint = 0;
			var inventory$count:uint = 0;
			var tutorial$count:uint = 0;
			var facebookReward$count:uint = 0;
			var twitterReward$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gameId$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.gameId cannot be set twice.');
					}
					++gameId$count;
					this.gameId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (loginStatus$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.loginStatus cannot be set twice.');
					}
					++loginStatus$count;
					this.loginStatus = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 3:
					if (player$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.player cannot be set twice.');
					}
					++player$count;
					this.player = new PlayerProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.player);
					break;
				case 4:
					if (islands$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.islands cannot be set twice.');
					}
					++islands$count;
					this.islands = new IslandsProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.islands);
					break;
				case 5:
					if (achievements$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.achievements cannot be set twice.');
					}
					++achievements$count;
					this.achievements = new AchievementsProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.achievements);
					break;
				case 6:
					if (purchases$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.purchases cannot be set twice.');
					}
					++purchases$count;
					this.purchases = new PurchasesProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.purchases);
					break;
				case 7:
					if (gifts$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.gifts cannot be set twice.');
					}
					++gifts$count;
					this.gifts = new PlayerGiftsProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.gifts);
					break;
				case 8:
					if (rating$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.rating cannot be set twice.');
					}
					++rating$count;
					this.rating = new RatingProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.rating);
					break;
				case 9:
					if (amulets$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.amulets cannot be set twice.');
					}
					++amulets$count;
					this.amulets = new AmuletsProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.amulets);
					break;
				case 10:
					if (emotions$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.emotions cannot be set twice.');
					}
					++emotions$count;
					this.emotions = new EmotionsProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.emotions);
					break;
				case 11:
					if (inventory$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.inventory cannot be set twice.');
					}
					++inventory$count;
					this.inventory = new PlayerInventoryProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.inventory);
					break;
				case 12:
					if (tutorial$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.tutorial cannot be set twice.');
					}
					++tutorial$count;
					this.tutorial = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 13:
					if (facebookReward$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.facebookReward cannot be set twice.');
					}
					++facebookReward$count;
					this.facebookReward = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 14:
					if (twitterReward$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponseProtobuf.twitterReward cannot be set twice.');
					}
					++twitterReward$count;
					this.twitterReward = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
