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
	public dynamic final class NotificationStarProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const STAR:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("NotificationStarProtobuf.star", "star", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var star:int;

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("NotificationStarProtobuf.money", "money", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money$field:int;

		private var hasField$0:uint = 0;

		public function clearMoney():void {
			hasField$0 &= 0xfffffffe;
			money$field = new int();
		}

		public function get hasMoney():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set money(value:int):void {
			hasField$0 |= 0x1;
			money$field = value;
		}

		public function get money():int {
			return money$field;
		}

		/**
		 *  @private
		 */
		public static const EXPERIENCE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("NotificationStarProtobuf.experience", "experience", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var experience$field:int;

		public function clearExperience():void {
			hasField$0 &= 0xfffffffd;
			experience$field = new int();
		}

		public function get hasExperience():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set experience(value:int):void {
			hasField$0 |= 0x2;
			experience$field = value;
		}

		public function get experience():int {
			return experience$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.star);
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, money$field);
			}
			if (hasExperience) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, experience$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var star$count:uint = 0;
			var money$count:uint = 0;
			var experience$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (star$count != 0) {
						throw new flash.errors.IOError('Bad data format: NotificationStarProtobuf.star cannot be set twice.');
					}
					++star$count;
					this.star = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: NotificationStarProtobuf.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (experience$count != 0) {
						throw new flash.errors.IOError('Bad data format: NotificationStarProtobuf.experience cannot be set twice.');
					}
					++experience$count;
					this.experience = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
