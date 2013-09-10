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
	public dynamic final class AmuletActivateResponseProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const AMULETID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("AmuletActivateResponseProtobuf.amuletId", "amuletId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var amuletId:Int64;

		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("AmuletActivateResponseProtobuf.type", "type", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var type:int;

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("AmuletActivateResponseProtobuf.time", "time", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var time:Int64;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, this.amuletId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.type);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, this.time);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var amuletId$count:uint = 0;
			var type$count:uint = 0;
			var time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (amuletId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletActivateResponseProtobuf.amuletId cannot be set twice.');
					}
					++amuletId$count;
					this.amuletId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletActivateResponseProtobuf.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletActivateResponseProtobuf.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
