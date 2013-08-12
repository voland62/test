package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import MatchProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MatchEnterResponseProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MATCH:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("MatchEnterResponseProtobuf.match", "match", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return MatchProtobuf; });

		public var match:MatchProtobuf;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.match);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var match$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (match$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchEnterResponseProtobuf.match cannot be set twice.');
					}
					++match$count;
					this.match = new MatchProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.match);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
