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
	public dynamic final class RoomPlayersProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ME:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("RoomPlayersProtobuf.me", "me", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerShortProtobuf; });

		public var me:PlayerShortProtobuf;

		/**
		 *  @private
		 */
		public static const ROOMMATES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("RoomPlayersProtobuf.roommates", "roommates", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerShortProtobuf; });

		[ArrayElementType("PlayerShortProtobuf")]
		public var roommates:Array = [];

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.me);
			for (var roommates$index:uint = 0; roommates$index < this.roommates.length; ++roommates$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.roommates[roommates$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var me$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (me$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomPlayersProtobuf.me cannot be set twice.');
					}
					++me$count;
					this.me = new PlayerShortProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.me);
					break;
				case 2:
					this.roommates.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PlayerShortProtobuf()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
