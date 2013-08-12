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
	public dynamic final class RoomMessageProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SENDER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("RoomMessageProtobuf.sender", "sender", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var sender:int;

		/**
		 *  @private
		 */
		public static const SENDERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("RoomMessageProtobuf.senderName", "senderName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var senderName:String;

		/**
		 *  @private
		 */
		public static const MESSAGE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("RoomMessageProtobuf.message", "message", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var message:String;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.sender);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.senderName);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.message);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var sender$count:uint = 0;
			var senderName$count:uint = 0;
			var message$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (sender$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomMessageProtobuf.sender cannot be set twice.');
					}
					++sender$count;
					this.sender = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (senderName$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomMessageProtobuf.senderName cannot be set twice.');
					}
					++senderName$count;
					this.senderName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (message$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomMessageProtobuf.message cannot be set twice.');
					}
					++message$count;
					this.message = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
