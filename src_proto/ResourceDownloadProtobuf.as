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
	public dynamic final class ResourceDownloadProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RESOURCEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("ResourceDownloadProtobuf.resourceId", "resourceId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var resourceId:int;

		/**
		 *  @private
		 */
		public static const URLIPHONE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("ResourceDownloadProtobuf.urlIphone", "urlIphone", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var urlIphone$field:String;

		public function clearUrlIphone():void {
			urlIphone$field = null;
		}

		public function get hasUrlIphone():Boolean {
			return urlIphone$field != null;
		}

		public function set urlIphone(value:String):void {
			urlIphone$field = value;
		}

		public function get urlIphone():String {
			return urlIphone$field;
		}

		/**
		 *  @private
		 */
		public static const URLIPAD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("ResourceDownloadProtobuf.urlIpad", "urlIpad", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var urlIpad$field:String;

		public function clearUrlIpad():void {
			urlIpad$field = null;
		}

		public function get hasUrlIpad():Boolean {
			return urlIpad$field != null;
		}

		public function set urlIpad(value:String):void {
			urlIpad$field = value;
		}

		public function get urlIpad():String {
			return urlIpad$field;
		}

		/**
		 *  @private
		 */
		public static const URLIPADHD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("ResourceDownloadProtobuf.urlIpadhd", "urlIpadhd", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var urlIpadhd$field:String;

		public function clearUrlIpadhd():void {
			urlIpadhd$field = null;
		}

		public function get hasUrlIpadhd():Boolean {
			return urlIpadhd$field != null;
		}

		public function set urlIpadhd(value:String):void {
			urlIpadhd$field = value;
		}

		public function get urlIpadhd():String {
			return urlIpadhd$field;
		}

		/**
		 *  @private
		 */
		public static const VERSIONIPHONE:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("ResourceDownloadProtobuf.versionIphone", "versionIphone", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var versionIphone$field:Int64;

		public function clearVersionIphone():void {
			versionIphone$field = null;
		}

		public function get hasVersionIphone():Boolean {
			return versionIphone$field != null;
		}

		public function set versionIphone(value:Int64):void {
			versionIphone$field = value;
		}

		public function get versionIphone():Int64 {
			return versionIphone$field;
		}

		/**
		 *  @private
		 */
		public static const VERSIONIPAD:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("ResourceDownloadProtobuf.versionIpad", "versionIpad", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var versionIpad$field:Int64;

		public function clearVersionIpad():void {
			versionIpad$field = null;
		}

		public function get hasVersionIpad():Boolean {
			return versionIpad$field != null;
		}

		public function set versionIpad(value:Int64):void {
			versionIpad$field = value;
		}

		public function get versionIpad():Int64 {
			return versionIpad$field;
		}

		/**
		 *  @private
		 */
		public static const VERSIONIPADHD:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("ResourceDownloadProtobuf.versionIpadhd", "versionIpadhd", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var versionIpadhd$field:Int64;

		public function clearVersionIpadhd():void {
			versionIpadhd$field = null;
		}

		public function get hasVersionIpadhd():Boolean {
			return versionIpadhd$field != null;
		}

		public function set versionIpadhd(value:Int64):void {
			versionIpadhd$field = value;
		}

		public function get versionIpadhd():Int64 {
			return versionIpadhd$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.resourceId);
			if (hasUrlIphone) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, urlIphone$field);
			}
			if (hasUrlIpad) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, urlIpad$field);
			}
			if (hasUrlIpadhd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, urlIpadhd$field);
			}
			if (hasVersionIphone) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, versionIphone$field);
			}
			if (hasVersionIpad) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, versionIpad$field);
			}
			if (hasVersionIpadhd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, versionIpadhd$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var resourceId$count:uint = 0;
			var urlIphone$count:uint = 0;
			var urlIpad$count:uint = 0;
			var urlIpadhd$count:uint = 0;
			var versionIphone$count:uint = 0;
			var versionIpad$count:uint = 0;
			var versionIpadhd$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (resourceId$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResourceDownloadProtobuf.resourceId cannot be set twice.');
					}
					++resourceId$count;
					this.resourceId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (urlIphone$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResourceDownloadProtobuf.urlIphone cannot be set twice.');
					}
					++urlIphone$count;
					this.urlIphone = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (urlIpad$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResourceDownloadProtobuf.urlIpad cannot be set twice.');
					}
					++urlIpad$count;
					this.urlIpad = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (urlIpadhd$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResourceDownloadProtobuf.urlIpadhd cannot be set twice.');
					}
					++urlIpadhd$count;
					this.urlIpadhd = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (versionIphone$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResourceDownloadProtobuf.versionIphone cannot be set twice.');
					}
					++versionIphone$count;
					this.versionIphone = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 6:
					if (versionIpad$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResourceDownloadProtobuf.versionIpad cannot be set twice.');
					}
					++versionIpad$count;
					this.versionIpad = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 7:
					if (versionIpadhd$count != 0) {
						throw new flash.errors.IOError('Bad data format: ResourceDownloadProtobuf.versionIpadhd cannot be set twice.');
					}
					++versionIpadhd$count;
					this.versionIpadhd = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
