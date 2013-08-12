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
	public dynamic final class RoomComplimentRequestProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RECEIVER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("RoomComplimentRequestProtobuf.receiver", "receiver", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var receiver:int;

		/**
		 *  @private
		 */
		public static const COMPLIMENTID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("RoomComplimentRequestProtobuf.complimentId", "complimentId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var complimentId:int;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.receiver);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.complimentId);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var receiver$count:uint = 0;
			var complimentId$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (receiver$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomComplimentRequestProtobuf.receiver cannot be set twice.');
					}
					++receiver$count;
					this.receiver = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (complimentId$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomComplimentRequestProtobuf.complimentId cannot be set twice.');
					}
					++complimentId$count;
					this.complimentId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
