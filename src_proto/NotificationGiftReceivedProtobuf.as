package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import GiftProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NotificationGiftReceivedProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GIFT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("NotificationGiftReceivedProtobuf.gift", "gift", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return GiftProtobuf; });

		public var gift:GiftProtobuf;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.gift);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var gift$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gift$count != 0) {
						throw new flash.errors.IOError('Bad data format: NotificationGiftReceivedProtobuf.gift cannot be set twice.');
					}
					++gift$count;
					this.gift = new GiftProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.gift);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
