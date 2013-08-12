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
	public dynamic final class SpinRequestProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BET:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("SpinRequestProtobuf.bet", "bet", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var bet:int;

		/**
		 *  @private
		 */
		public static const LINESAMOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("SpinRequestProtobuf.linesAmount", "linesAmount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var linesAmount:int;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.bet);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.linesAmount);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var bet$count:uint = 0;
			var linesAmount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (bet$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpinRequestProtobuf.bet cannot be set twice.');
					}
					++bet$count;
					this.bet = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (linesAmount$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpinRequestProtobuf.linesAmount cannot be set twice.');
					}
					++linesAmount$count;
					this.linesAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
