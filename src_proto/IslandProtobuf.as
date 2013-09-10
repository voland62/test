package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import LocationProtobuf;
	import PlayerShortProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class IslandProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ISLANDID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("IslandProtobuf.islandId", "islandId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var islandId:int;

		/**
		 *  @private
		 */
		public static const LOCATIONS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("IslandProtobuf.locations", "locations", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return LocationProtobuf; });

		[ArrayElementType("LocationProtobuf")]
		public var locations:Array = [];

		/**
		 *  @private
		 */
		public static const LEADERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("IslandProtobuf.leaders", "leaders", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerShortProtobuf; });

		[ArrayElementType("PlayerShortProtobuf")]
		public var leaders:Array = [];

		/**
		 *  @private
		 */
		public static const OPENED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("IslandProtobuf.opened", "opened", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var opened$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearOpened():void {
			hasField$0 &= 0xfffffffe;
			opened$field = new Boolean();
		}

		public function get hasOpened():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set opened(value:Boolean):void {
			hasField$0 |= 0x1;
			opened$field = value;
		}

		public function get opened():Boolean {
			return opened$field;
		}

		/**
		 *  @private
		 */
		public static const KING:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("IslandProtobuf.king", "king", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerShortProtobuf; });

		private var king$field:PlayerShortProtobuf;

		public function clearKing():void {
			king$field = null;
		}

		public function get hasKing():Boolean {
			return king$field != null;
		}

		public function set king(value:PlayerShortProtobuf):void {
			king$field = value;
		}

		public function get king():PlayerShortProtobuf {
			return king$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.islandId);
			for (var locations$index:uint = 0; locations$index < this.locations.length; ++locations$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.locations[locations$index]);
			}
			for (var leaders$index:uint = 0; leaders$index < this.leaders.length; ++leaders$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.leaders[leaders$index]);
			}
			if (hasOpened) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, opened$field);
			}
			if (hasKing) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, king$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var islandId$count:uint = 0;
			var opened$count:uint = 0;
			var king$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (islandId$count != 0) {
						throw new flash.errors.IOError('Bad data format: IslandProtobuf.islandId cannot be set twice.');
					}
					++islandId$count;
					this.islandId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					this.locations.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new LocationProtobuf()));
					break;
				case 3:
					this.leaders.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new PlayerShortProtobuf()));
					break;
				case 4:
					if (opened$count != 0) {
						throw new flash.errors.IOError('Bad data format: IslandProtobuf.opened cannot be set twice.');
					}
					++opened$count;
					this.opened = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 5:
					if (king$count != 0) {
						throw new flash.errors.IOError('Bad data format: IslandProtobuf.king cannot be set twice.');
					}
					++king$count;
					this.king = new PlayerShortProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.king);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
