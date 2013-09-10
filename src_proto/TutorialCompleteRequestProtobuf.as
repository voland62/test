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
	public dynamic final class TutorialCompleteRequestProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COMPLETED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("TutorialCompleteRequestProtobuf.completed", "completed", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var completed$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearCompleted():void {
			hasField$0 &= 0xfffffffe;
			completed$field = new Boolean();
		}

		public function get hasCompleted():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set completed(value:Boolean):void {
			hasField$0 |= 0x1;
			completed$field = value;
		}

		public function get completed():Boolean {
			return completed$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCompleted) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, completed$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var completed$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (completed$count != 0) {
						throw new flash.errors.IOError('Bad data format: TutorialCompleteRequestProtobuf.completed cannot be set twice.');
					}
					++completed$count;
					this.completed = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
