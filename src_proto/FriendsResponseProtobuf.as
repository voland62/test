package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import PlayerShortProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FriendsResponseProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OUTGAME:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("FriendsResponseProtobuf.outGame", "outGame", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerShortProtobuf; });

		[ArrayElementType("PlayerShortProtobuf")]
		public var outGame:Array = [];

		/**
		 *  @private
		 */
		public static const INGAME:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("FriendsResponseProtobuf.inGame", "inGame", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerShortProtobuf; });

		[ArrayElementType("PlayerShortProtobuf")]
		public var inGame:Array = [];

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var outGame$index:uint = 0; outGame$index < this.outGame.length; ++outGame$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.outGame[outGame$index]);
			}
			for (var inGame$index:uint = 0; inGame$index < this.inGame.length; ++inGame$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.inGame[inGame$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.outGame.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PlayerShortProtobuf()));
					break;
				case 2:
					this.inGame.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PlayerShortProtobuf()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
