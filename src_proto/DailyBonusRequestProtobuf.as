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
	public dynamic final class DailyBonusRequestProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OK:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DailyBonusRequestProtobuf.ok", "ok", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ok$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearOk():void {
			hasField$0 &= 0xfffffffe;
			ok$field = new Boolean();
		}

		public function get hasOk():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set ok(value:Boolean):void {
			hasField$0 |= 0x1;
			ok$field = value;
		}

		public function get ok():Boolean {
			return ok$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasOk) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, ok$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var ok$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (ok$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyBonusRequestProtobuf.ok cannot be set twice.');
					}
					++ok$count;
					this.ok = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
