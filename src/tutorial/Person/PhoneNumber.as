package tutorial.Person {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;

	import flash.errors.IOError;
	import flash.utils.IDataInput;

	// use namespace com.netease.protobuf.used_by_generated_code;
	
	use namespace used_by_generated_code;
	
	
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PhoneNumber extends com.netease.protobuf.Message {
		
		
		 
		
		/**
		 *  @private
		 */
		public static const NUMBER:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("tutorial.Person.PhoneNumber.number", "number", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);
//
		public var number:String;
//
//		/**
//		 *  @private
//		 */
		public static const TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("tutorial.Person.PhoneNumber.type", "type", (2 << 3) | com.netease.protobuf.WireType.VARINT, tutorial.Person.PhoneType);
//
		private var type$field:int;
//
		private var hasField$0:uint = 0;
//
		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			type$field = new int();
		}
//
		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}
//
		public function set type(value:int):void {
			hasField$0 |= 0x1;
			type$field = value;
		}
//
		public function get type():int {
			if(!hasType) {
				return tutorial.Person.PhoneType.HOME;
			}
			return type$field;
		}
//
//		/**
//		 *  @private
//		 */
		override used_by_generated_code function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.number);
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}
//
//		/**
//		 *  @private
//		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var number$count:uint = 0;
			var type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (number$count != 0) {
						throw new flash.errors.IOError('Bad data format: PhoneNumber.number cannot be set twice.');
					}
					++number$count;
					this.number = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: PhoneNumber.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
