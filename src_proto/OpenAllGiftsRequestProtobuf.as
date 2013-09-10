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
	public dynamic final class OpenAllGiftsRequestProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OPENALL:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("OpenAllGiftsRequestProtobuf.openAll", "openAll", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var openAll$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearOpenAll():void {
			hasField$0 &= 0xfffffffe;
			openAll$field = new Boolean();
		}

		public function get hasOpenAll():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set openAll(value:Boolean):void {
			hasField$0 |= 0x1;
			openAll$field = value;
		}

		public function get openAll():Boolean {
			return openAll$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasOpenAll) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, openAll$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var openAll$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (openAll$count != 0) {
						throw new flash.errors.IOError('Bad data format: OpenAllGiftsRequestProtobuf.openAll cannot be set twice.');
					}
					++openAll$count;
					this.openAll = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
