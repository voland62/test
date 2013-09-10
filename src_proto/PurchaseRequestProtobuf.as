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
	public dynamic final class PurchaseRequestProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const KEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PurchaseRequestProtobuf.key", "key", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var key:String;

		/**
		 *  @private
		 */
		public static const TOKEN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PurchaseRequestProtobuf.token", "token", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var token:String;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.key);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.token);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var key$count:uint = 0;
			var token$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (key$count != 0) {
						throw new flash.errors.IOError('Bad data format: PurchaseRequestProtobuf.key cannot be set twice.');
					}
					++key$count;
					this.key = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (token$count != 0) {
						throw new flash.errors.IOError('Bad data format: PurchaseRequestProtobuf.token cannot be set twice.');
					}
					++token$count;
					this.token = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
