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
	public dynamic final class RoomNewComplimentEventProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SENDER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("RoomNewComplimentEventProtobuf.sender", "sender", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var sender:int;

		/**
		 *  @private
		 */
		public static const RECEIVER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("RoomNewComplimentEventProtobuf.receiver", "receiver", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var receiver:int;

		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("RoomNewComplimentEventProtobuf.type", "type", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var type:int;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.sender);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.receiver);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.type);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var sender$count:uint = 0;
			var receiver$count:uint = 0;
			var type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (sender$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomNewComplimentEventProtobuf.sender cannot be set twice.');
					}
					++sender$count;
					this.sender = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (receiver$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomNewComplimentEventProtobuf.receiver cannot be set twice.');
					}
					++receiver$count;
					this.receiver = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomNewComplimentEventProtobuf.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
