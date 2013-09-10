package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import BoostersProtobuf;
	import AmuletProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class OpenAllGiftsResponseProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("OpenAllGiftsResponseProtobuf.money", "money", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var money:int;

		/**
		 *  @private
		 */
		public static const AMULETS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("OpenAllGiftsResponseProtobuf.amulets", "amulets", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return AmuletProtobuf; });

		[ArrayElementType("AmuletProtobuf")]
		public var amulets:Array = [];

		/**
		 *  @private
		 */
		public static const BOOSTERS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("OpenAllGiftsResponseProtobuf.boosters", "boosters", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return BoostersProtobuf; });

		private var boosters$field:BoostersProtobuf;

		public function clearBoosters():void {
			boosters$field = null;
		}

		public function get hasBoosters():Boolean {
			return boosters$field != null;
		}

		public function set boosters(value:BoostersProtobuf):void {
			boosters$field = value;
		}

		public function get boosters():BoostersProtobuf {
			return boosters$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.money);
			for (var amulets$index:uint = 0; amulets$index < this.amulets.length; ++amulets$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.amulets[amulets$index]);
			}
			if (hasBoosters) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, boosters$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var money$count:uint = 0;
			var boosters$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: OpenAllGiftsResponseProtobuf.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					this.amulets.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new AmuletProtobuf()));
					break;
				case 3:
					if (boosters$count != 0) {
						throw new flash.errors.IOError('Bad data format: OpenAllGiftsResponseProtobuf.boosters cannot be set twice.');
					}
					++boosters$count;
					this.boosters = new BoostersProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.boosters);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
