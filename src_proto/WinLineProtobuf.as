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
	public dynamic final class WinLineProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LINENUMBER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("WinLineProtobuf.lineNumber", "lineNumber", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var lineNumber:int;

		/**
		 *  @private
		 */
		public static const ICONSCOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("WinLineProtobuf.iconsCount", "iconsCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var iconsCount:int;

		/**
		 *  @private
		 */
		public static const MULTIPLIER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("WinLineProtobuf.multiplier", "multiplier", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var multiplier:int;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.lineNumber);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.iconsCount);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.multiplier);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var lineNumber$count:uint = 0;
			var iconsCount$count:uint = 0;
			var multiplier$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (lineNumber$count != 0) {
						throw new flash.errors.IOError('Bad data format: WinLineProtobuf.lineNumber cannot be set twice.');
					}
					++lineNumber$count;
					this.lineNumber = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (iconsCount$count != 0) {
						throw new flash.errors.IOError('Bad data format: WinLineProtobuf.iconsCount cannot be set twice.');
					}
					++iconsCount$count;
					this.iconsCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (multiplier$count != 0) {
						throw new flash.errors.IOError('Bad data format: WinLineProtobuf.multiplier cannot be set twice.');
					}
					++multiplier$count;
					this.multiplier = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
