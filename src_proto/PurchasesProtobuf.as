package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import PurchaseProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PurchasesProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COINSPURCHASES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PurchasesProtobuf.coinsPurchases", "coinsPurchases", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PurchaseProtobuf; });

		[ArrayElementType("PurchaseProtobuf")]
		public var coinsPurchases:Array = [];

		/**
		 *  @private
		 */
		public static const AMULETSPURCHASES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PurchasesProtobuf.amuletsPurchases", "amuletsPurchases", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PurchaseProtobuf; });

		[ArrayElementType("PurchaseProtobuf")]
		public var amuletsPurchases:Array = [];

		/**
		 *  @private
		 */
		public static const BOOSTERSPURCHASES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PurchasesProtobuf.boostersPurchases", "boostersPurchases", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PurchaseProtobuf; });

		[ArrayElementType("PurchaseProtobuf")]
		public var boostersPurchases:Array = [];

		/**
		 *  @private
		 */
		public static const SPECIALPURCHASES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PurchasesProtobuf.specialPurchases", "specialPurchases", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PurchaseProtobuf; });

		[ArrayElementType("PurchaseProtobuf")]
		public var specialPurchases:Array = [];

		/**
		 *  @private
		 */
		public static const BUYTIMEPURCHASES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PurchasesProtobuf.buyTimePurchases", "buyTimePurchases", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PurchaseProtobuf; });

		[ArrayElementType("PurchaseProtobuf")]
		public var buyTimePurchases:Array = [];

		/**
		 *  @private
		 */
		public static const OTHERPURCHASES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PurchasesProtobuf.otherPurchases", "otherPurchases", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PurchaseProtobuf; });

		[ArrayElementType("PurchaseProtobuf")]
		public var otherPurchases:Array = [];

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var coinsPurchases$index:uint = 0; coinsPurchases$index < this.coinsPurchases.length; ++coinsPurchases$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.coinsPurchases[coinsPurchases$index]);
			}
			for (var amuletsPurchases$index:uint = 0; amuletsPurchases$index < this.amuletsPurchases.length; ++amuletsPurchases$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.amuletsPurchases[amuletsPurchases$index]);
			}
			for (var boostersPurchases$index:uint = 0; boostersPurchases$index < this.boostersPurchases.length; ++boostersPurchases$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.boostersPurchases[boostersPurchases$index]);
			}
			for (var specialPurchases$index:uint = 0; specialPurchases$index < this.specialPurchases.length; ++specialPurchases$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.specialPurchases[specialPurchases$index]);
			}
			for (var buyTimePurchases$index:uint = 0; buyTimePurchases$index < this.buyTimePurchases.length; ++buyTimePurchases$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.buyTimePurchases[buyTimePurchases$index]);
			}
			for (var otherPurchases$index:uint = 0; otherPurchases$index < this.otherPurchases.length; ++otherPurchases$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.otherPurchases[otherPurchases$index]);
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
					this.coinsPurchases.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PurchaseProtobuf()));
					break;
				case 2:
					this.amuletsPurchases.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PurchaseProtobuf()));
					break;
				case 3:
					this.boostersPurchases.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PurchaseProtobuf()));
					break;
				case 4:
					this.specialPurchases.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PurchaseProtobuf()));
					break;
				case 5:
					this.buyTimePurchases.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PurchaseProtobuf()));
					break;
				case 6:
					this.otherPurchases.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PurchaseProtobuf()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
