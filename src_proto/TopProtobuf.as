package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import PlayerShortProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class TopProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BYMONEY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("TopProtobuf.byMoney", "byMoney", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerShortProtobuf; });

		[ArrayElementType("PlayerShortProtobuf")]
		public var byMoney:Array = [];

		/**
		 *  @private
		 */
		public static const BYEXPERIENCE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("TopProtobuf.byExperience", "byExperience", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerShortProtobuf; });

		[ArrayElementType("PlayerShortProtobuf")]
		public var byExperience:Array = [];

		/**
		 *  @private
		 */
		public static const BYWINS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("TopProtobuf.byWins", "byWins", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerShortProtobuf; });

		[ArrayElementType("PlayerShortProtobuf")]
		public var byWins:Array = [];

		/**
		 *  @private
		 */
		public static const BYPOINTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("TopProtobuf.byPoints", "byPoints", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerShortProtobuf; });

		[ArrayElementType("PlayerShortProtobuf")]
		public var byPoints:Array = [];

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var byMoney$index:uint = 0; byMoney$index < this.byMoney.length; ++byMoney$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.byMoney[byMoney$index]);
			}
			for (var byExperience$index:uint = 0; byExperience$index < this.byExperience.length; ++byExperience$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.byExperience[byExperience$index]);
			}
			for (var byWins$index:uint = 0; byWins$index < this.byWins.length; ++byWins$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.byWins[byWins$index]);
			}
			for (var byPoints$index:uint = 0; byPoints$index < this.byPoints.length; ++byPoints$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.byPoints[byPoints$index]);
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
					this.byMoney.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PlayerShortProtobuf()));
					break;
				case 2:
					this.byExperience.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PlayerShortProtobuf()));
					break;
				case 3:
					this.byWins.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PlayerShortProtobuf()));
					break;
				case 4:
					this.byPoints.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PlayerShortProtobuf()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
