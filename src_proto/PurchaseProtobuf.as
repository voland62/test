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
	public dynamic final class PurchaseProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const KEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PurchaseProtobuf.key", "key", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var key:String;

		/**
		 *  @private
		 */
		public static const DESCRIPTION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PurchaseProtobuf.description", "description", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var description:String;

		/**
		 *  @private
		 */
		public static const VALUE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PurchaseProtobuf.value", "value", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var value:int;

		/**
		 *  @private
		 */
		public static const BONUSCOINS:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PurchaseProtobuf.bonusCoins", "bonusCoins", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var bonusCoins:Boolean;

		/**
		 *  @private
		 */
		public static const BONUSCHEST:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PurchaseProtobuf.bonusChest", "bonusChest", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var bonusChest:Boolean;

		/**
		 *  @private
		 */
		public static const BONUSAMULET:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PurchaseProtobuf.bonusAmulet", "bonusAmulet", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		public var bonusAmulet:Boolean;

		/**
		 *  @private
		 */
		public static const BONUSBOOSTER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PurchaseProtobuf.bonusBooster", "bonusBooster", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		public var bonusBooster:Boolean;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.key);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.description);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.value);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.bonusCoins);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.bonusChest);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.bonusAmulet);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.bonusBooster);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var key$count:uint = 0;
			var description$count:uint = 0;
			var value$count:uint = 0;
			var bonusCoins$count:uint = 0;
			var bonusChest$count:uint = 0;
			var bonusAmulet$count:uint = 0;
			var bonusBooster$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (key$count != 0) {
						throw new flash.errors.IOError('Bad data format: PurchaseProtobuf.key cannot be set twice.');
					}
					++key$count;
					this.key = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (description$count != 0) {
						throw new flash.errors.IOError('Bad data format: PurchaseProtobuf.description cannot be set twice.');
					}
					++description$count;
					this.description = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (value$count != 0) {
						throw new flash.errors.IOError('Bad data format: PurchaseProtobuf.value cannot be set twice.');
					}
					++value$count;
					this.value = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (bonusCoins$count != 0) {
						throw new flash.errors.IOError('Bad data format: PurchaseProtobuf.bonusCoins cannot be set twice.');
					}
					++bonusCoins$count;
					this.bonusCoins = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 5:
					if (bonusChest$count != 0) {
						throw new flash.errors.IOError('Bad data format: PurchaseProtobuf.bonusChest cannot be set twice.');
					}
					++bonusChest$count;
					this.bonusChest = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 6:
					if (bonusAmulet$count != 0) {
						throw new flash.errors.IOError('Bad data format: PurchaseProtobuf.bonusAmulet cannot be set twice.');
					}
					++bonusAmulet$count;
					this.bonusAmulet = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 7:
					if (bonusBooster$count != 0) {
						throw new flash.errors.IOError('Bad data format: PurchaseProtobuf.bonusBooster cannot be set twice.');
					}
					++bonusBooster$count;
					this.bonusBooster = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
