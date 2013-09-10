package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import AmuletsProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PlayerInventoryProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const AMULETS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PlayerInventoryProtobuf.amulets", "amulets", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return AmuletsProtobuf; });

		public var amulets:AmuletsProtobuf;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.amulets);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var amulets$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (amulets$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerInventoryProtobuf.amulets cannot be set twice.');
					}
					++amulets$count;
					this.amulets = new AmuletsProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.amulets);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
