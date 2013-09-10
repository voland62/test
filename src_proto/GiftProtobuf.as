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
	public dynamic final class GiftProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GIFTID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("GiftProtobuf.giftId", "giftId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var giftId:Int64;

		/**
		 *  @private
		 */
		public static const SENDER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("GiftProtobuf.sender", "sender", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerShortProtobuf; });

		public var sender:PlayerShortProtobuf;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, this.giftId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.sender);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var giftId$count:uint = 0;
			var sender$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (giftId$count != 0) {
						throw new flash.errors.IOError('Bad data format: GiftProtobuf.giftId cannot be set twice.');
					}
					++giftId$count;
					this.giftId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (sender$count != 0) {
						throw new flash.errors.IOError('Bad data format: GiftProtobuf.sender cannot be set twice.');
					}
					++sender$count;
					this.sender = new PlayerShortProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.sender);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
