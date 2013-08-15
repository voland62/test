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
	public dynamic final class IconMultiplierProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ICONID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("IconMultiplierProtobuf.iconId", "iconId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var iconId:int;

		/**
		 *  @private
		 */
		public static const X1:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("IconMultiplierProtobuf.x1", "x1", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var x1$field:int;

		private var hasField$0:uint = 0;

		public function clearX1():void {
			hasField$0 &= 0xfffffffe;
			x1$field = new int();
		}

		public function get hasX1():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set x1(value:int):void {
			hasField$0 |= 0x1;
			x1$field = value;
		}

		public function get x1():int {
			return x1$field;
		}

		/**
		 *  @private
		 */
		public static const X2:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("IconMultiplierProtobuf.x2", "x2", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var x2$field:int;

		public function clearX2():void {
			hasField$0 &= 0xfffffffd;
			x2$field = new int();
		}

		public function get hasX2():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set x2(value:int):void {
			hasField$0 |= 0x2;
			x2$field = value;
		}

		public function get x2():int {
			return x2$field;
		}

		/**
		 *  @private
		 */
		public static const X3:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("IconMultiplierProtobuf.x3", "x3", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var x3$field:int;

		public function clearX3():void {
			hasField$0 &= 0xfffffffb;
			x3$field = new int();
		}

		public function get hasX3():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set x3(value:int):void {
			hasField$0 |= 0x4;
			x3$field = value;
		}

		public function get x3():int {
			return x3$field;
		}

		/**
		 *  @private
		 */
		public static const X4:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("IconMultiplierProtobuf.x4", "x4", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var x4$field:int;

		public function clearX4():void {
			hasField$0 &= 0xfffffff7;
			x4$field = new int();
		}

		public function get hasX4():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set x4(value:int):void {
			hasField$0 |= 0x8;
			x4$field = value;
		}

		public function get x4():int {
			return x4$field;
		}

		/**
		 *  @private
		 */
		public static const X5:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("IconMultiplierProtobuf.x5", "x5", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var x5$field:int;

		public function clearX5():void {
			hasField$0 &= 0xffffffef;
			x5$field = new int();
		}

		public function get hasX5():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set x5(value:int):void {
			hasField$0 |= 0x10;
			x5$field = value;
		}

		public function get x5():int {
			return x5$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.iconId);
			if (hasX1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, x1$field);
			}
			if (hasX2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, x2$field);
			}
			if (hasX3) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, x3$field);
			}
			if (hasX4) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, x4$field);
			}
			if (hasX5) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, x5$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var iconId$count:uint = 0;
			var x1$count:uint = 0;
			var x2$count:uint = 0;
			var x3$count:uint = 0;
			var x4$count:uint = 0;
			var x5$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (iconId$count != 0) {
						throw new flash.errors.IOError('Bad data format: IconMultiplierProtobuf.iconId cannot be set twice.');
					}
					++iconId$count;
					this.iconId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (x1$count != 0) {
						throw new flash.errors.IOError('Bad data format: IconMultiplierProtobuf.x1 cannot be set twice.');
					}
					++x1$count;
					this.x1 = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (x2$count != 0) {
						throw new flash.errors.IOError('Bad data format: IconMultiplierProtobuf.x2 cannot be set twice.');
					}
					++x2$count;
					this.x2 = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (x3$count != 0) {
						throw new flash.errors.IOError('Bad data format: IconMultiplierProtobuf.x3 cannot be set twice.');
					}
					++x3$count;
					this.x3 = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (x4$count != 0) {
						throw new flash.errors.IOError('Bad data format: IconMultiplierProtobuf.x4 cannot be set twice.');
					}
					++x4$count;
					this.x4 = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (x5$count != 0) {
						throw new flash.errors.IOError('Bad data format: IconMultiplierProtobuf.x5 cannot be set twice.');
					}
					++x5$count;
					this.x5 = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
