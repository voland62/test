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
	public dynamic final class QuestProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const QUESTID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("QuestProtobuf.questId", "questId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var questId:int;

		/**
		 *  @private
		 */
		public static const COMPLETE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("QuestProtobuf.complete", "complete", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var complete:Boolean;

		/**
		 *  @private
		 */
		public static const CURRENTVALUE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("QuestProtobuf.currentValue", "currentValue", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var currentValue:int;

		/**
		 *  @private
		 */
		public static const COMPLETEVALUE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("QuestProtobuf.completeValue", "completeValue", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var completeValue:int;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.questId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.complete);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.currentValue);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.completeValue);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var questId$count:uint = 0;
			var complete$count:uint = 0;
			var currentValue$count:uint = 0;
			var completeValue$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (questId$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestProtobuf.questId cannot be set twice.');
					}
					++questId$count;
					this.questId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (complete$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestProtobuf.complete cannot be set twice.');
					}
					++complete$count;
					this.complete = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 3:
					if (currentValue$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestProtobuf.currentValue cannot be set twice.');
					}
					++currentValue$count;
					this.currentValue = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (completeValue$count != 0) {
						throw new flash.errors.IOError('Bad data format: QuestProtobuf.completeValue cannot be set twice.');
					}
					++completeValue$count;
					this.completeValue = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
