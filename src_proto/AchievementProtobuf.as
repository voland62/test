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
	public dynamic final class AchievementProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ACHIEVEMENTID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("AchievementProtobuf.achievementId", "achievementId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var achievementId:int;

		/**
		 *  @private
		 */
		public static const OPENED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("AchievementProtobuf.opened", "opened", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var opened:Boolean;

		/**
		 *  @private
		 */
		public static const ACHIEVED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("AchievementProtobuf.achieved", "achieved", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var achieved:Boolean;

		/**
		 *  @private
		 */
		public static const COMPLETE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("AchievementProtobuf.complete", "complete", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var complete:Boolean;

		/**
		 *  @private
		 */
		public static const CURRENTSTAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("AchievementProtobuf.currentStage", "currentStage", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var currentStage:int;

		/**
		 *  @private
		 */
		public static const CURRENTVALUE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("AchievementProtobuf.currentValue", "currentValue", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		public var currentValue:int;

		/**
		 *  @private
		 */
		public static const NEXTSTAGEVALUE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("AchievementProtobuf.nextStageValue", "nextStageValue", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		public var nextStageValue:int;

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("AchievementProtobuf.money", "money", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money$field:int;

		private var hasField$0:uint = 0;

		public function clearMoney():void {
			hasField$0 &= 0xfffffffe;
			money$field = new int();
		}

		public function get hasMoney():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set money(value:int):void {
			hasField$0 |= 0x1;
			money$field = value;
		}

		public function get money():int {
			return money$field;
		}

		/**
		 *  @private
		 */
		public static const EXPERIENCE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("AchievementProtobuf.experience", "experience", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var experience$field:int;

		public function clearExperience():void {
			hasField$0 &= 0xfffffffd;
			experience$field = new int();
		}

		public function get hasExperience():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set experience(value:int):void {
			hasField$0 |= 0x2;
			experience$field = value;
		}

		public function get experience():int {
			return experience$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.achievementId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.opened);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.achieved);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.complete);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.currentStage);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.currentValue);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.nextStageValue);
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, money$field);
			}
			if (hasExperience) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, experience$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var achievementId$count:uint = 0;
			var opened$count:uint = 0;
			var achieved$count:uint = 0;
			var complete$count:uint = 0;
			var currentStage$count:uint = 0;
			var currentValue$count:uint = 0;
			var nextStageValue$count:uint = 0;
			var money$count:uint = 0;
			var experience$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (achievementId$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementProtobuf.achievementId cannot be set twice.');
					}
					++achievementId$count;
					this.achievementId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (opened$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementProtobuf.opened cannot be set twice.');
					}
					++opened$count;
					this.opened = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 3:
					if (achieved$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementProtobuf.achieved cannot be set twice.');
					}
					++achieved$count;
					this.achieved = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 4:
					if (complete$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementProtobuf.complete cannot be set twice.');
					}
					++complete$count;
					this.complete = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 5:
					if (currentStage$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementProtobuf.currentStage cannot be set twice.');
					}
					++currentStage$count;
					this.currentStage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (currentValue$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementProtobuf.currentValue cannot be set twice.');
					}
					++currentValue$count;
					this.currentValue = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (nextStageValue$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementProtobuf.nextStageValue cannot be set twice.');
					}
					++nextStageValue$count;
					this.nextStageValue = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementProtobuf.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (experience$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementProtobuf.experience cannot be set twice.');
					}
					++experience$count;
					this.experience = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
