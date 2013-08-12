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
	public dynamic final class LocationLeaveRequestProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ISLANDID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LocationLeaveRequestProtobuf.islandId", "islandId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var islandId:int;

		/**
		 *  @private
		 */
		public static const LOCATIONID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LocationLeaveRequestProtobuf.locationId", "locationId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var locationId:int;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.islandId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.locationId);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var islandId$count:uint = 0;
			var locationId$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (islandId$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationLeaveRequestProtobuf.islandId cannot be set twice.');
					}
					++islandId$count;
					this.islandId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (locationId$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationLeaveRequestProtobuf.locationId cannot be set twice.');
					}
					++locationId$count;
					this.locationId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
