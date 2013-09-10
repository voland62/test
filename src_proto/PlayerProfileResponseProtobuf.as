package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import PlayerProfileProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PlayerProfileResponseProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PROFILE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PlayerProfileResponseProtobuf.profile", "profile", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerProfileProtobuf; });

		public var profile:PlayerProfileProtobuf;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.profile);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var profile$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (profile$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerProfileResponseProtobuf.profile cannot be set twice.');
					}
					++profile$count;
					this.profile = new PlayerProfileProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.profile);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
