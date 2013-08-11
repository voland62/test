package tutorial {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;

	import flash.utils.IDataInput;

	use namespace used_by_generated_code;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AddressBook extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PERSON:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("tutorial.AddressBook.person", "person", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return tutorial.Person; });

		[ArrayElementType("tutorial.Person")]
		public var person:Array = [];

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var person$index:uint = 0; person$index < this.person.length; ++person$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.person[person$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.person.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new tutorial.Person()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
