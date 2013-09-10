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
	public dynamic final class AmuletProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const AMULETID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("AmuletProtobuf.amuletId", "amuletId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var amuletId:Int64;

		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("AmuletProtobuf.type", "type", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var type:int;

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("AmuletProtobuf.time", "time", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var time:Int64;

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("AmuletProtobuf.money", "money", (4 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var money$field:Number;

		private var hasField$0:uint = 0;

		public function clearMoney():void {
			hasField$0 &= 0xfffffffe;
			money$field = new Number();
		}

		public function get hasMoney():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set money(value:Number):void {
			hasField$0 |= 0x1;
			money$field = value;
		}

		public function get money():Number {
			return money$field;
		}

		/**
		 *  @private
		 */
		public static const MONEYBUY:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("AmuletProtobuf.moneyBuy", "moneyBuy", (5 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var moneyBuy$field:Number;

		public function clearMoneyBuy():void {
			hasField$0 &= 0xfffffffd;
			moneyBuy$field = new Number();
		}

		public function get hasMoneyBuy():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set moneyBuy(value:Number):void {
			hasField$0 |= 0x2;
			moneyBuy$field = value;
		}

		public function get moneyBuy():Number {
			return moneyBuy$field;
		}

		/**
		 *  @private
		 */
		public static const EXPERIENCE:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("AmuletProtobuf.experience", "experience", (6 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var experience$field:Number;

		public function clearExperience():void {
			hasField$0 &= 0xfffffffb;
			experience$field = new Number();
		}

		public function get hasExperience():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set experience(value:Number):void {
			hasField$0 |= 0x4;
			experience$field = value;
		}

		public function get experience():Number {
			return experience$field;
		}

		/**
		 *  @private
		 */
		public static const RANDOMBOOSTERUSAGE:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("AmuletProtobuf.randomBoosterUsage", "randomBoosterUsage", (7 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var randomBoosterUsage$field:Number;

		public function clearRandomBoosterUsage():void {
			hasField$0 &= 0xfffffff7;
			randomBoosterUsage$field = new Number();
		}

		public function get hasRandomBoosterUsage():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set randomBoosterUsage(value:Number):void {
			hasField$0 |= 0x8;
			randomBoosterUsage$field = value;
		}

		public function get randomBoosterUsage():Number {
			return randomBoosterUsage$field;
		}

		/**
		 *  @private
		 */
		public static const FREESPIN:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("AmuletProtobuf.freeSpin", "freeSpin", (8 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var freeSpin$field:Number;

		public function clearFreeSpin():void {
			hasField$0 &= 0xffffffef;
			freeSpin$field = new Number();
		}

		public function get hasFreeSpin():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set freeSpin(value:Number):void {
			hasField$0 |= 0x10;
			freeSpin$field = value;
		}

		public function get freeSpin():Number {
			return freeSpin$field;
		}

		/**
		 *  @private
		 */
		public static const ADDITIONALBUYBOOSTER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("AmuletProtobuf.additionalBuyBooster", "additionalBuyBooster", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var additionalBuyBooster$field:int;

		public function clearAdditionalBuyBooster():void {
			hasField$0 &= 0xffffffdf;
			additionalBuyBooster$field = new int();
		}

		public function get hasAdditionalBuyBooster():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set additionalBuyBooster(value:int):void {
			hasField$0 |= 0x20;
			additionalBuyBooster$field = value;
		}

		public function get additionalBuyBooster():int {
			return additionalBuyBooster$field;
		}

		/**
		 *  @private
		 */
		public static const MATCHTIME:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("AmuletProtobuf.matchTime", "matchTime", (10 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var matchTime$field:Number;

		public function clearMatchTime():void {
			hasField$0 &= 0xffffffbf;
			matchTime$field = new Number();
		}

		public function get hasMatchTime():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set matchTime(value:Number):void {
			hasField$0 |= 0x40;
			matchTime$field = value;
		}

		public function get matchTime():Number {
			return matchTime$field;
		}

		/**
		 *  @private
		 */
		public static const MATCHPROGRESSDOWNSPEED:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("AmuletProtobuf.matchProgressDownSpeed", "matchProgressDownSpeed", (11 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var matchProgressDownSpeed$field:Number;

		public function clearMatchProgressDownSpeed():void {
			hasField$0 &= 0xffffff7f;
			matchProgressDownSpeed$field = new Number();
		}

		public function get hasMatchProgressDownSpeed():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set matchProgressDownSpeed(value:Number):void {
			hasField$0 |= 0x80;
			matchProgressDownSpeed$field = value;
		}

		public function get matchProgressDownSpeed():Number {
			return matchProgressDownSpeed$field;
		}

		/**
		 *  @private
		 */
		public static const MATCHPROGRESSLEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("AmuletProtobuf.matchProgressLevel", "matchProgressLevel", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var matchProgressLevel$field:int;

		public function clearMatchProgressLevel():void {
			hasField$0 &= 0xfffffeff;
			matchProgressLevel$field = new int();
		}

		public function get hasMatchProgressLevel():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set matchProgressLevel(value:int):void {
			hasField$0 |= 0x100;
			matchProgressLevel$field = value;
		}

		public function get matchProgressLevel():int {
			return matchProgressLevel$field;
		}

		/**
		 *  @private
		 */
		public static const DAILYBONUSMONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("AmuletProtobuf.dailyBonusMoney", "dailyBonusMoney", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dailyBonusMoney$field:int;

		public function clearDailyBonusMoney():void {
			hasField$0 &= 0xfffffdff;
			dailyBonusMoney$field = new int();
		}

		public function get hasDailyBonusMoney():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set dailyBonusMoney(value:int):void {
			hasField$0 |= 0x200;
			dailyBonusMoney$field = value;
		}

		public function get dailyBonusMoney():int {
			return dailyBonusMoney$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, this.amuletId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.type);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, this.time);
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, money$field);
			}
			if (hasMoneyBuy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, moneyBuy$field);
			}
			if (hasExperience) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, experience$field);
			}
			if (hasRandomBoosterUsage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, randomBoosterUsage$field);
			}
			if (hasFreeSpin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, freeSpin$field);
			}
			if (hasAdditionalBuyBooster) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, additionalBuyBooster$field);
			}
			if (hasMatchTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, matchTime$field);
			}
			if (hasMatchProgressDownSpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, matchProgressDownSpeed$field);
			}
			if (hasMatchProgressLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, matchProgressLevel$field);
			}
			if (hasDailyBonusMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, dailyBonusMoney$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var amuletId$count:uint = 0;
			var type$count:uint = 0;
			var time$count:uint = 0;
			var money$count:uint = 0;
			var moneyBuy$count:uint = 0;
			var experience$count:uint = 0;
			var randomBoosterUsage$count:uint = 0;
			var freeSpin$count:uint = 0;
			var additionalBuyBooster$count:uint = 0;
			var matchTime$count:uint = 0;
			var matchProgressDownSpeed$count:uint = 0;
			var matchProgressLevel$count:uint = 0;
			var dailyBonusMoney$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (amuletId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletProtobuf.amuletId cannot be set twice.');
					}
					++amuletId$count;
					this.amuletId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletProtobuf.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletProtobuf.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletProtobuf.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				case 5:
					if (moneyBuy$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletProtobuf.moneyBuy cannot be set twice.');
					}
					++moneyBuy$count;
					this.moneyBuy = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				case 6:
					if (experience$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletProtobuf.experience cannot be set twice.');
					}
					++experience$count;
					this.experience = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				case 7:
					if (randomBoosterUsage$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletProtobuf.randomBoosterUsage cannot be set twice.');
					}
					++randomBoosterUsage$count;
					this.randomBoosterUsage = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				case 8:
					if (freeSpin$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletProtobuf.freeSpin cannot be set twice.');
					}
					++freeSpin$count;
					this.freeSpin = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				case 9:
					if (additionalBuyBooster$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletProtobuf.additionalBuyBooster cannot be set twice.');
					}
					++additionalBuyBooster$count;
					this.additionalBuyBooster = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (matchTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletProtobuf.matchTime cannot be set twice.');
					}
					++matchTime$count;
					this.matchTime = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				case 11:
					if (matchProgressDownSpeed$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletProtobuf.matchProgressDownSpeed cannot be set twice.');
					}
					++matchProgressDownSpeed$count;
					this.matchProgressDownSpeed = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				case 12:
					if (matchProgressLevel$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletProtobuf.matchProgressLevel cannot be set twice.');
					}
					++matchProgressLevel$count;
					this.matchProgressLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (dailyBonusMoney$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmuletProtobuf.dailyBonusMoney cannot be set twice.');
					}
					++dailyBonusMoney$count;
					this.dailyBonusMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
