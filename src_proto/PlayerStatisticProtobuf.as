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
	public dynamic final class PlayerStatisticProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MAXWIN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerStatisticProtobuf.maxWin", "maxWin", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var maxWin:int;

		/**
		 *  @private
		 */
		public static const BOOSTERSUSED:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerStatisticProtobuf.boostersUsed", "boostersUsed", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var boostersUsed$field:int;

		private var hasField$0:uint = 0;

		public function clearBoostersUsed():void {
			hasField$0 &= 0xfffffffe;
			boostersUsed$field = new int();
		}

		public function get hasBoostersUsed():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set boostersUsed(value:int):void {
			hasField$0 |= 0x1;
			boostersUsed$field = value;
		}

		public function get boostersUsed():int {
			return boostersUsed$field;
		}

		/**
		 *  @private
		 */
		public static const FRIENDSAMOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerStatisticProtobuf.friendsAmount", "friendsAmount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var friendsAmount$field:int;

		public function clearFriendsAmount():void {
			hasField$0 &= 0xfffffffd;
			friendsAmount$field = new int();
		}

		public function get hasFriendsAmount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set friendsAmount(value:int):void {
			hasField$0 |= 0x2;
			friendsAmount$field = value;
		}

		public function get friendsAmount():int {
			return friendsAmount$field;
		}

		/**
		 *  @private
		 */
		public static const GIFTSRECEIVED:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerStatisticProtobuf.giftsReceived", "giftsReceived", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var giftsReceived$field:int;

		public function clearGiftsReceived():void {
			hasField$0 &= 0xfffffffb;
			giftsReceived$field = new int();
		}

		public function get hasGiftsReceived():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set giftsReceived(value:int):void {
			hasField$0 |= 0x4;
			giftsReceived$field = value;
		}

		public function get giftsReceived():int {
			return giftsReceived$field;
		}

		/**
		 *  @private
		 */
		public static const GIFTSSENDED:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerStatisticProtobuf.giftsSended", "giftsSended", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var giftsSended$field:int;

		public function clearGiftsSended():void {
			hasField$0 &= 0xfffffff7;
			giftsSended$field = new int();
		}

		public function get hasGiftsSended():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set giftsSended(value:int):void {
			hasField$0 |= 0x8;
			giftsSended$field = value;
		}

		public function get giftsSended():int {
			return giftsSended$field;
		}

		/**
		 *  @private
		 */
		public static const ROOMWINSAMOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PlayerStatisticProtobuf.roomWinsAmount", "roomWinsAmount", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var roomWinsAmount$field:int;

		public function clearRoomWinsAmount():void {
			hasField$0 &= 0xffffffef;
			roomWinsAmount$field = new int();
		}

		public function get hasRoomWinsAmount():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set roomWinsAmount(value:int):void {
			hasField$0 |= 0x10;
			roomWinsAmount$field = value;
		}

		public function get roomWinsAmount():int {
			return roomWinsAmount$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.maxWin);
			if (hasBoostersUsed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, boostersUsed$field);
			}
			if (hasFriendsAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, friendsAmount$field);
			}
			if (hasGiftsReceived) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, giftsReceived$field);
			}
			if (hasGiftsSended) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, giftsSended$field);
			}
			if (hasRoomWinsAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, roomWinsAmount$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var maxWin$count:uint = 0;
			var boostersUsed$count:uint = 0;
			var friendsAmount$count:uint = 0;
			var giftsReceived$count:uint = 0;
			var giftsSended$count:uint = 0;
			var roomWinsAmount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (maxWin$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerStatisticProtobuf.maxWin cannot be set twice.');
					}
					++maxWin$count;
					this.maxWin = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (boostersUsed$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerStatisticProtobuf.boostersUsed cannot be set twice.');
					}
					++boostersUsed$count;
					this.boostersUsed = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (friendsAmount$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerStatisticProtobuf.friendsAmount cannot be set twice.');
					}
					++friendsAmount$count;
					this.friendsAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (giftsReceived$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerStatisticProtobuf.giftsReceived cannot be set twice.');
					}
					++giftsReceived$count;
					this.giftsReceived = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (giftsSended$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerStatisticProtobuf.giftsSended cannot be set twice.');
					}
					++giftsSended$count;
					this.giftsSended = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (roomWinsAmount$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerStatisticProtobuf.roomWinsAmount cannot be set twice.');
					}
					++roomWinsAmount$count;
					this.roomWinsAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
