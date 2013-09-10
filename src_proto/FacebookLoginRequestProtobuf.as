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
	public dynamic final class FacebookLoginRequestProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FACEBOOKID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("FacebookLoginRequestProtobuf.facebookId", "facebookId", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var facebookId:String;

		/**
		 *  @private
		 */
		public static const FACEBOOKTOKEN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("FacebookLoginRequestProtobuf.facebookToken", "facebookToken", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const FACEBOOKNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("FacebookLoginRequestProtobuf.facebookName", "facebookName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var facebookName$field:String;

		public function clearFacebookName():void {
			facebookName$field = null;
		}

		public function get hasFacebookName():Boolean {
			return facebookName$field != null;
		}

		public function set facebookName(value:String):void {
			facebookName$field = value;
		}

		public function get facebookName():String {
			return facebookName$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.facebookId);
			if (hasFacebookToken) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, facebookToken$field);
			}
			if (hasFacebookName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, facebookName$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var facebookId$count:uint = 0;
			var facebookToken$count:uint = 0;
			var facebookName$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (facebookId$count != 0) {
						throw new flash.errors.IOError('Bad data format: FacebookLoginRequestProtobuf.facebookId cannot be set twice.');
					}
					++facebookId$count;
					this.facebookId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (facebookToken$count != 0) {
						throw new flash.errors.IOError('Bad data format: FacebookLoginRequestProtobuf.facebookToken cannot be set twice.');
					}
					++facebookToken$count;
					this.facebookToken = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (facebookName$count != 0) {
						throw new flash.errors.IOError('Bad data format: FacebookLoginRequestProtobuf.facebookName cannot be set twice.');
					}
					++facebookName$count;
					this.facebookName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
