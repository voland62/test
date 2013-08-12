package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import ResponseStatus;
	import flash.utils.ByteArray;
	import DataChangesProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class Root extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIMESTAMP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Root.timestamp", "timestamp", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var timestamp:int;

		/**
		 *  @private
		 */
		public static const SESSIONKEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Root.sessionKey", "sessionKey", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var sessionKey:int;

		/**
		 *  @private
		 */
		public static const PACKAGEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Root.packageId", "packageId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var packageId:int;

		/**
		 *  @private
		 */
		public static const PACKAGEDATA:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("Root.packageData", "packageData", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var packageData:flash.utils.ByteArray;

		/**
		 *  @private
		 */
		public static const RESPONSESTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("Root.responseStatus", "responseStatus", (5 << 3) | com.netease.protobuf.WireType.VARINT, ResponseStatus);

		private var responseStatus$field:int;

		private var hasField$0:uint = 0;

		public function clearResponseStatus():void {
			hasField$0 &= 0xfffffffe;
			responseStatus$field = new int();
		}

		public function get hasResponseStatus():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set responseStatus(value:int):void {
			hasField$0 |= 0x1;
			responseStatus$field = value;
		}

		public function get responseStatus():int {
			return responseStatus$field;
		}

		/**
		 *  @private
		 */
		public static const CHANGES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("Root.changes", "changes", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return DataChangesProtobuf; });

		private var changes$field:DataChangesProtobuf;

		public function clearChanges():void {
			changes$field = null;
		}

		public function get hasChanges():Boolean {
			return changes$field != null;
		}

		public function set changes(value:DataChangesProtobuf):void {
			changes$field = value;
		}

		public function get changes():DataChangesProtobuf {
			return changes$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.timestamp);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.sessionKey);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.packageId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, this.packageData);
			if (hasResponseStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, responseStatus$field);
			}
			if (hasChanges) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, changes$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var timestamp$count:uint = 0;
			var sessionKey$count:uint = 0;
			var packageId$count:uint = 0;
			var packageData$count:uint = 0;
			var responseStatus$count:uint = 0;
			var changes$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (timestamp$count != 0) {
						throw new flash.errors.IOError('Bad data format: Root.timestamp cannot be set twice.');
					}
					++timestamp$count;
					this.timestamp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (sessionKey$count != 0) {
						throw new flash.errors.IOError('Bad data format: Root.sessionKey cannot be set twice.');
					}
					++sessionKey$count;
					this.sessionKey = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (packageId$count != 0) {
						throw new flash.errors.IOError('Bad data format: Root.packageId cannot be set twice.');
					}
					++packageId$count;
					this.packageId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (packageData$count != 0) {
						throw new flash.errors.IOError('Bad data format: Root.packageData cannot be set twice.');
					}
					++packageData$count;
					this.packageData = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 5:
					if (responseStatus$count != 0) {
						throw new flash.errors.IOError('Bad data format: Root.responseStatus cannot be set twice.');
					}
					++responseStatus$count;
					this.responseStatus = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 6:
					if (changes$count != 0) {
						throw new flash.errors.IOError('Bad data format: Root.changes cannot be set twice.');
					}
					++changes$count;
					this.changes = new DataChangesProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.changes);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
