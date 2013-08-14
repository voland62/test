package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import QuestProtobuf;
	import LeaderInfoProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class LocationProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LOCATIONID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LocationProtobuf.locationId", "locationId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var locationId:int;

		/**
		 *  @private
		 */
		public static const LOCATIONINDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LocationProtobuf.locationIndex", "locationIndex", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var locationIndex:int;

		/**
		 *  @private
		 */
		public static const MINBET:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LocationProtobuf.minBet", "minBet", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var minBet:int;

		/**
		 *  @private
		 */
		public static const MAXBET:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LocationProtobuf.maxBet", "maxBet", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var maxBet:int;

		/**
		 *  @private
		 */
		public static const MINLINESAMOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LocationProtobuf.minLinesAmount", "minLinesAmount", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var minLinesAmount:int;

		/**
		 *  @private
		 */
		public static const MAXLINESAMOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LocationProtobuf.maxLinesAmount", "maxLinesAmount", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		public var maxLinesAmount:int;

		/**
		 *  @private
		 */
		public static const STAR1QUEST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LocationProtobuf.star1quest", "star1quest", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return QuestProtobuf; });

		public var star1quest:QuestProtobuf;

		/**
		 *  @private
		 */
		public static const STAR2QUEST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LocationProtobuf.star2quest", "star2quest", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return QuestProtobuf; });

		public var star2quest:QuestProtobuf;

		/**
		 *  @private
		 */
		public static const STAR3QUEST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LocationProtobuf.star3quest", "star3quest", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return QuestProtobuf; });

		public var star3quest:QuestProtobuf;

		/**
		 *  @private
		 */
		public static const BETENLARGER:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("LocationProtobuf.betEnlarger", "betEnlarger", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var betEnlarger:Array = [];

		/**
		 *  @private
		 */
		public static const LEADERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("LocationProtobuf.leaders", "leaders", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return LeaderInfoProtobuf; });

		[ArrayElementType("LeaderInfoProtobuf")]
		public var leaders:Array = [];

		/**
		 *  @private
		 */
		public static const OPENED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("LocationProtobuf.opened", "opened", (12 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const VISITED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("LocationProtobuf.visited", "visited", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var visited$field:Boolean;

		public function clearVisited():void {
			hasField$0 &= 0xfffffffd;
			visited$field = new Boolean();
		}

		public function get hasVisited():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set visited(value:Boolean):void {
			hasField$0 |= 0x2;
			visited$field = value;
		}

		public function get visited():Boolean {
			return visited$field;
		}

		/**
		 *  @private
		 */
		public static const LASTBET:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LocationProtobuf.lastBet", "lastBet", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lastBet$field:int;

		public function clearLastBet():void {
			hasField$0 &= 0xfffffffb;
			lastBet$field = new int();
		}

		public function get hasLastBet():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set lastBet(value:int):void {
			hasField$0 |= 0x4;
			lastBet$field = value;
		}

		public function get lastBet():int {
			return lastBet$field;
		}

		/**
		 *  @private
		 */
		public static const LASTLINESAMOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LocationProtobuf.lastLinesAmount", "lastLinesAmount", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lastLinesAmount$field:int;

		public function clearLastLinesAmount():void {
			hasField$0 &= 0xfffffff7;
			lastLinesAmount$field = new int();
		}

		public function get hasLastLinesAmount():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set lastLinesAmount(value:int):void {
			hasField$0 |= 0x8;
			lastLinesAmount$field = value;
		}

		public function get lastLinesAmount():int {
			return lastLinesAmount$field;
		}

		/**
		 *  @private
		 */
		public static const MINLEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LocationProtobuf.minLevel", "minLevel", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var minLevel$field:int;

		public function clearMinLevel():void {
			hasField$0 &= 0xffffffef;
			minLevel$field = new int();
		}

		public function get hasMinLevel():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set minLevel(value:int):void {
			hasField$0 |= 0x10;
			minLevel$field = value;
		}

		public function get minLevel():int {
			return minLevel$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.locationId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.locationIndex);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.minBet);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.maxBet);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.minLinesAmount);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.maxLinesAmount);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.star1quest);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.star2quest);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.star3quest);
			for (var betEnlarger$index:uint = 0; betEnlarger$index < this.betEnlarger.length; ++betEnlarger$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.betEnlarger[betEnlarger$index]);
			}
			for (var leaders$index:uint = 0; leaders$index < this.leaders.length; ++leaders$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.leaders[leaders$index]);
			}
			if (hasOpened) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, opened$field);
			}
			if (hasVisited) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, visited$field);
			}
			if (hasLastBet) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, lastBet$field);
			}
			if (hasLastLinesAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, lastLinesAmount$field);
			}
			if (hasMinLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, minLevel$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var locationId$count:uint = 0;
			var locationIndex$count:uint = 0;
			var minBet$count:uint = 0;
			var maxBet$count:uint = 0;
			var minLinesAmount$count:uint = 0;
			var maxLinesAmount$count:uint = 0;
			var star1quest$count:uint = 0;
			var star2quest$count:uint = 0;
			var star3quest$count:uint = 0;
			var opened$count:uint = 0;
			var visited$count:uint = 0;
			var lastBet$count:uint = 0;
			var lastLinesAmount$count:uint = 0;
			var minLevel$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (locationId$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.locationId cannot be set twice.');
					}
					++locationId$count;
					this.locationId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (locationIndex$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.locationIndex cannot be set twice.');
					}
					++locationIndex$count;
					this.locationIndex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (minBet$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.minBet cannot be set twice.');
					}
					++minBet$count;
					this.minBet = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (maxBet$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.maxBet cannot be set twice.');
					}
					++maxBet$count;
					this.maxBet = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (minLinesAmount$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.minLinesAmount cannot be set twice.');
					}
					++minLinesAmount$count;
					this.minLinesAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (maxLinesAmount$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.maxLinesAmount cannot be set twice.');
					}
					++maxLinesAmount$count;
					this.maxLinesAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (star1quest$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.star1quest cannot be set twice.');
					}
					++star1quest$count;
					this.star1quest = new QuestProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.star1quest);
					break;
				case 8:
					if (star2quest$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.star2quest cannot be set twice.');
					}
					++star2quest$count;
					this.star2quest = new QuestProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.star2quest);
					break;
				case 9:
					if (star3quest$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.star3quest cannot be set twice.');
					}
					++star3quest$count;
					this.star3quest = new QuestProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.star3quest);
					break;
				case 10:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.betEnlarger);
						break;
					}
					this.betEnlarger.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 11:
					this.leaders.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new LeaderInfoProtobuf()));
					break;
				case 12:
					if (opened$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.opened cannot be set twice.');
					}
					++opened$count;
					this.opened = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 13:
					if (visited$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.visited cannot be set twice.');
					}
					++visited$count;
					this.visited = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 14:
					if (lastBet$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.lastBet cannot be set twice.');
					}
					++lastBet$count;
					this.lastBet = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 15:
					if (lastLinesAmount$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.lastLinesAmount cannot be set twice.');
					}
					++lastLinesAmount$count;
					this.lastLinesAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 16:
					if (minLevel$count != 0) {
						throw new flash.errors.IOError('Bad data format: LocationProtobuf.minLevel cannot be set twice.');
					}
					++minLevel$count;
					this.minLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
