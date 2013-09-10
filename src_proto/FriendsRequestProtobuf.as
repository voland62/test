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
	public dynamic final class FriendsRequestProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FACEBOOKID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("FriendsRequestProtobuf.facebookId", "facebookId", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var facebookId:String;

		/**
		 *  @private
		 */
		public static const FACEBOOKTOKEN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("FriendsRequestProtobuf.facebookToken", "facebookToken", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var facebookToken:String;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.facebookId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.facebookToken);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var facebookId$count:uint = 0;
			var facebookToken$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (facebookId$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendsRequestProtobuf.facebookId cannot be set twice.');
					}
					++facebookId$count;
					this.facebookId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (facebookToken$count != 0) {
						throw new flash.errors.IOError('Bad data format: FriendsRequestProtobuf.facebookToken cannot be set twice.');
					}
					++facebookToken$count;
					this.facebookToken = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
