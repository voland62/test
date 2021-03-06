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
	public dynamic final class BoosterProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BOOSTERID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("BoosterProtobuf.boosterId", "boosterId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var boosterId:int;

		/**
		 *  @private
		 */
		public static const AMOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("BoosterProtobuf.amount", "amount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var amount:int;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.boosterId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.amount);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var boosterId$count:uint = 0;
			var amount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (boosterId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BoosterProtobuf.boosterId cannot be set twice.');
					}
					++boosterId$count;
					this.boosterId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: BoosterProtobuf.amount cannot be set twice.');
					}
					++amount$count;
					this.amount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
