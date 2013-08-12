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
	public dynamic final class DeviceInfoProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UDID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("DeviceInfoProtobuf.udid", "udid", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var udid:String;

		/**
		 *  @private
		 */
		public static const CLIENTVERSION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("DeviceInfoProtobuf.clientVersion", "clientVersion", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var clientVersion:String;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.udid);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.clientVersion);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var udid$count:uint = 0;
			var clientVersion$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (udid$count != 0) {
						throw new flash.errors.IOError('Bad data format: DeviceInfoProtobuf.udid cannot be set twice.');
					}
					++udid$count;
					this.udid = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (clientVersion$count != 0) {
						throw new flash.errors.IOError('Bad data format: DeviceInfoProtobuf.clientVersion cannot be set twice.');
					}
					++clientVersion$count;
					this.clientVersion = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
