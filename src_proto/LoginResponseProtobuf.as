package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import LoginResponseProtobuf.LoginStatus;
	import PlayerProtobuf;
	import AchievementsProtobuf;
	import IslandsProtobuf;
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
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
