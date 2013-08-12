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
	public dynamic final class MatchLevelProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ENERGY:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("MatchLevelProtobuf.energy", "energy", (1 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var energy:Number;

		/**
		 *  @private
		 */
		public static const ENERGYFALLPERSECOND:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("MatchLevelProtobuf.energyFallPerSecond", "energyFallPerSecond", (2 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var energyFallPerSecond:Number;

		/**
		 *  @private
		 */
		public static const MULTIPLIER:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("MatchLevelProtobuf.multiplier", "multiplier", (3 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		public var multiplier:Number;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, this.energy);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, this.energyFallPerSecond);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, this.multiplier);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var energy$count:uint = 0;
			var energyFallPerSecond$count:uint = 0;
			var multiplier$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (energy$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchLevelProtobuf.energy cannot be set twice.');
					}
					++energy$count;
					this.energy = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				case 2:
					if (energyFallPerSecond$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchLevelProtobuf.energyFallPerSecond cannot be set twice.');
					}
					++energyFallPerSecond$count;
					this.energyFallPerSecond = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				case 3:
					if (multiplier$count != 0) {
						throw new flash.errors.IOError('Bad data format: MatchLevelProtobuf.multiplier cannot be set twice.');
					}
					++multiplier$count;
					this.multiplier = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
