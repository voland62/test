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
	public dynamic final class PlayerGiftsProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const AVAILABLE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerGiftsProtobuf.available", "available", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var available:int;

		/**
		 *  @private
		 */
		public static const RECEIVED:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerGiftsProtobuf.received", "received", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var received:int;

		/**
		 *  @private
		 */
		public static const GIFTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PlayerGiftsProtobuf.gifts", "gifts", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return GiftProtobuf; });

		[ArrayElementType("GiftProtobuf")]
		public var gifts:Array = [];

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.available);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.received);
			for (var gifts$index:uint = 0; gifts$index < this.gifts.length; ++gifts$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.gifts[gifts$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var available$count:uint = 0;
			var received$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (available$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerGiftsProtobuf.available cannot be set twice.');
					}
					++available$count;
					this.available = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (received$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerGiftsProtobuf.received cannot be set twice.');
					}
					++received$count;
					this.received = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					this.gifts.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new GiftProtobuf()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
