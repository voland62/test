package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import RoomMessageProtobuf;
	import RoomPlayersProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class RoomProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PROGRESS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("RoomProtobuf.progress", "progress", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var progress:int;

		/**
		 *  @private
		 */
		public static const PLAYERS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("RoomProtobuf.players", "players", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return RoomPlayersProtobuf; });

		public var players:RoomPlayersProtobuf;

		/**
		 *  @private
		 */
		public static const MESSAGES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("RoomProtobuf.messages", "messages", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return RoomMessageProtobuf; });

		[ArrayElementType("RoomMessageProtobuf")]
		public var messages:Array = [];

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.progress);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.players);
			for (var messages$index:uint = 0; messages$index < this.messages.length; ++messages$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.messages[messages$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var progress$count:uint = 0;
			var players$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (progress$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomProtobuf.progress cannot be set twice.');
					}
					++progress$count;
					this.progress = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (players$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomProtobuf.players cannot be set twice.');
					}
					++players$count;
					this.players = new RoomPlayersProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.players);
					break;
				case 3:
					this.messages.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new RoomMessageProtobuf()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
