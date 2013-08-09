package tutorial {
	import tutorial.Person.PhoneNumber;

	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;

	import flash.errors.IOError;
	import flash.utils.IDataInput;

	use namespace used_by_generated_code;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class Person extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("tutorial.Person.name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var name:String;

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("tutorial.Person.id", "id", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var id:int;

		/**
		 *  @private
		 */
		public static const EMAIL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("tutorial.Person.email", "email", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var email$field:String;

		public function clearEmail():void {
			email$field = null;
		}

		public function get hasEmail():Boolean {
			return email$field != null;
		}

		public function set email(value:String):void {
			email$field = value;
		}

		public function get email():String {
			return email$field;
		}

		/**
		 *  @private
		 */
		public static const PHONE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("tutorial.Person.phone", "phone", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return tutorial.Person.PhoneNumber; });

		[ArrayElementType("tutorial.Person.PhoneNumber")]
		public var phone:Array = [];

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.name);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.id);
			if (hasEmail) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, email$field);
			}
			for (var phone$index:uint = 0; phone$index < this.phone.length; ++phone$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.phone[phone$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var name$count:uint = 0;
			var id$count:uint = 0;
			var email$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: Person.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: Person.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (email$count != 0) {
						throw new flash.errors.IOError('Bad data format: Person.email cannot be set twice.');
					}
					++email$count;
					this.email = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					this.phone.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new tutorial.Person.PhoneNumber()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
