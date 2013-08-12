package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import RoomPlayersProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class RoomWinnerEventProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WINNER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("RoomWinnerEventProtobuf.winner", "winner", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var winner:int;

		/**
		 *  @private
		 */
		public static const PLAYERS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("RoomWinnerEventProtobuf.players", "players", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return RoomPlayersProtobuf; });

		public var players:RoomPlayersProtobuf;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.winner);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.players);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var winner$count:uint = 0;
			var players$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (winner$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomWinnerEventProtobuf.winner cannot be set twice.');
					}
					++winner$count;
					this.winner = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (players$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoomWinnerEventProtobuf.players cannot be set twice.');
					}
					++players$count;
					this.players = new RoomPlayersProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.players);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
