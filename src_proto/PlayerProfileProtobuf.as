package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import PlayerProtobuf;
	import AchievementsProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PlayerProfileProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PlayerProfileProtobuf.player", "player", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerProtobuf; });

		public var player:PlayerProtobuf;

		/**
		 *  @private
		 */
		public static const ACHIEVEMENTS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PlayerProfileProtobuf.achievements", "achievements", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return AchievementsProtobuf; });

		public var achievements:AchievementsProtobuf;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.player);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.achievements);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var player$count:uint = 0;
			var achievements$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (player$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProfileProtobuf.player cannot be set twice.');
					}
					++player$count;
					this.player = new PlayerProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.player);
					break;
				case 2:
					if (achievements$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProfileProtobuf.achievements cannot be set twice.');
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
