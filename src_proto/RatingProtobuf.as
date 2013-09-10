package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import TopProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class RatingProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SERVER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("RatingProtobuf.server", "server", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return TopProtobuf; });

		private var server$field:TopProtobuf;

		public function clearServer():void {
			server$field = null;
		}

		public function get hasServer():Boolean {
			return server$field != null;
		}

		public function set server(value:TopProtobuf):void {
			server$field = value;
		}

		public function get server():TopProtobuf {
			return server$field;
		}

		/**
		 *  @private
		 */
		public static const FRIENDS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("RatingProtobuf.friends", "friends", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return TopProtobuf; });

		private var friends$field:TopProtobuf;

		public function clearFriends():void {
			friends$field = null;
		}

		public function get hasFriends():Boolean {
			return friends$field != null;
		}

		public function set friends(value:TopProtobuf):void {
			friends$field = value;
		}

		public function get friends():TopProtobuf {
			return friends$field;
		}

		/**
		 *  @private
		 */
		public static const WEEK:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("RatingProtobuf.week", "week", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return TopProtobuf; });

		private var week$field:TopProtobuf;

		public function clearWeek():void {
			week$field = null;
		}

		public function get hasWeek():Boolean {
			return week$field != null;
		}

		public function set week(value:TopProtobuf):void {
			week$field = value;
		}

		public function get week():TopProtobuf {
			return week$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasServer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, server$field);
			}
			if (hasFriends) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, friends$field);
			}
			if (hasWeek) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, week$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var server$count:uint = 0;
			var friends$count:uint = 0;
			var week$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (server$count != 0) {
						throw new flash.errors.IOError('Bad data format: RatingProtobuf.server cannot be set twice.');
					}
					++server$count;
					this.server = new TopProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.server);
					break;
				case 2:
					if (friends$count != 0) {
						throw new flash.errors.IOError('Bad data format: RatingProtobuf.friends cannot be set twice.');
					}
					++friends$count;
					this.friends = new TopProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.friends);
					break;
				case 3:
					if (week$count != 0) {
						throw new flash.errors.IOError('Bad data format: RatingProtobuf.week cannot be set twice.');
					}
					++week$count;
					this.week = new TopProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.week);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
