package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import IconMultiplierProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class IconMultipliersProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MULTIPLIERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("IconMultipliersProtobuf.multipliers", "multipliers", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return IconMultiplierProtobuf; });

		[ArrayElementType("IconMultiplierProtobuf")]
		public var multipliers:Array = [];

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var multipliers$index:uint = 0; multipliers$index < this.multipliers.length; ++multipliers$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.multipliers[multipliers$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.multipliers.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new IconMultiplierProtobuf()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
