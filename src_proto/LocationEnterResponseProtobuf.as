package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import RoomProtobuf;
	import LocationProtobuf;
	import IconMultipliersProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class LocationEnterResponseProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LOCATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LocationEnterResponseProtobuf.location", "location", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return LocationProtobuf; });

		public var location:LocationProtobuf;

		/**
		 *  @private
		 */
		public static const MULTIPLIERS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LocationEnterResponseProtobuf.multipliers", "multipliers", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return IconMultipliersProtobuf; });

		public var multipliers:IconMultipliersProtobuf;

		/**
		 *  @private
		 */
		public static const ROOM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LocationEnterResponseProtobuf.room", "room", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return RoomProtobuf; });

		public var room:RoomProtobuf;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.location);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.multipliers);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.room);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var location$count:uint = 0;
			var multipliers$count:uint = 0;
			var room$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (location$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationEnterResponseProtobuf.location cannot be set twice.');
					}
					++location$count;
					this.location = new LocationProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.location);
					break;
				case 2:
					if (multipliers$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationEnterResponseProtobuf.multipliers cannot be set twice.');
					}
					++multipliers$count;
					this.multipliers = new IconMultipliersProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.multipliers);
					break;
				case 3:
					if (room$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationEnterResponseProtobuf.room cannot be set twice.');
					}
					++room$count;
					this.room = new RoomProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.room);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
