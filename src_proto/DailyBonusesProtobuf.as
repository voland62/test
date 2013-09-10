package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import DailyBonusProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DailyBonusesProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const STAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("DailyBonusesProtobuf.stage", "stage", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var stage:int;

		/**
		 *  @private
		 */
		public static const BONUSES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("DailyBonusesProtobuf.bonuses", "bonuses", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return DailyBonusProtobuf; });

		[ArrayElementType("DailyBonusProtobuf")]
		public var bonuses:Array = [];

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.stage);
			for (var bonuses$index:uint = 0; bonuses$index < this.bonuses.length; ++bonuses$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.bonuses[bonuses$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var stage$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (stage$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyBonusesProtobuf.stage cannot be set twice.');
					}
					++stage$count;
					this.stage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					this.bonuses.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new DailyBonusProtobuf()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
