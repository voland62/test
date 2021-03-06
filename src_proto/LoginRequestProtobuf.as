package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import DeviceInfoProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class LoginRequestProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GAMEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("LoginRequestProtobuf.gameId", "gameId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var gameId:int;

		/**
		 *  @private
		 */
		public static const DEVICEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("LoginRequestProtobuf.deviceInfo", "deviceInfo", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return DeviceInfoProtobuf; });

		public var deviceInfo:DeviceInfoProtobuf;

		/**
		 *  @private
		 */
		public static const FACEBOOKTOKEN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("LoginRequestProtobuf.facebookToken", "facebookToken", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var facebookToken$field:String;

		public function clearFacebookToken():void {
			facebookToken$field = null;
		}

		public function get hasFacebookToken():Boolean {
			return facebookToken$field != null;
		}

		public function set facebookToken(value:String):void {
			facebookToken$field = value;
		}

		public function get facebookToken():String {
			return facebookToken$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.gameId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.deviceInfo);
			if (hasFacebookToken) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, facebookToken$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var gameId$count:uint = 0;
			var deviceInfo$count:uint = 0;
			var facebookToken$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gameId$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginRequestProtobuf.gameId cannot be set twice.');
					}
					++gameId$count;
					this.gameId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (deviceInfo$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginRequestProtobuf.deviceInfo cannot be set twice.');
					}
					++deviceInfo$count;
					this.deviceInfo = new DeviceInfoProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.deviceInfo);
					break;
				case 3:
					if (facebookToken$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginRequestProtobuf.facebookToken cannot be set twice.');
					}
					++facebookToken$count;
					this.facebookToken = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
