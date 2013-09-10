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
	public dynamic final class EmotionProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EMOTIONID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("EmotionProtobuf.emotionId", "emotionId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var emotionId:int;

		/**
		 *  @private
		 */
		public static const PRICE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("EmotionProtobuf.price", "price", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var price:int;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.emotionId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.price);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var emotionId$count:uint = 0;
			var price$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (emotionId$count != 0) {
						throw new flash.errors.IOError('Bad data format: EmotionProtobuf.emotionId cannot be set twice.');
					}
					++emotionId$count;
					this.emotionId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (price$count != 0) {
						throw new flash.errors.IOError('Bad data format: EmotionProtobuf.price cannot be set twice.');
					}
					++price$count;
					this.price = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
