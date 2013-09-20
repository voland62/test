package  {
	import com.netease.protobuf.*;
	use namespace used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import DailyBonusesProtobuf;
	import PlayerGiftsProtobuf;
	import PlayerStatisticProtobuf;
	import TopProtobuf;
	import BoostersProtobuf;
	import PlayerProtobuf;
	import RoomProtobuf;
	import RatingProtobuf;
	import AchievementsProtobuf;
	import IslandsProtobuf;
	import BoosterProtobuf;
	import AmuletProtobuf;
	import LocationProtobuf;
	import IslandProtobuf;
	import AchievementProtobuf;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DataChangesProtobuf extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HASCHANGES:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.hasChanges", "hasChanges", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var hasChanges:Boolean;

		/**
		 *  @private
		 */
		public static const PLAYERCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.playerChanged", "playerChanged", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var playerChanged$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearPlayerChanged():void {
			hasField$0 &= 0xfffffffe;
			playerChanged$field = new Boolean();
		}

		public function get hasPlayerChanged():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set playerChanged(value:Boolean):void {
			hasField$0 |= 0x1;
			playerChanged$field = value;
		}

		public function get playerChanged():Boolean {
			return playerChanged$field;
		}

		/**
		 *  @private
		 */
		public static const ISLANDSCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.islandsChanged", "islandsChanged", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var islandsChanged$field:Boolean;

		public function clearIslandsChanged():void {
			hasField$0 &= 0xfffffffd;
			islandsChanged$field = new Boolean();
		}

		public function get hasIslandsChanged():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set islandsChanged(value:Boolean):void {
			hasField$0 |= 0x2;
			islandsChanged$field = value;
		}

		public function get islandsChanged():Boolean {
			return islandsChanged$field;
		}

		/**
		 *  @private
		 */
		public static const ISLANDCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.islandChanged", "islandChanged", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var islandChanged$field:Boolean;

		public function clearIslandChanged():void {
			hasField$0 &= 0xfffffffb;
			islandChanged$field = new Boolean();
		}

		public function get hasIslandChanged():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set islandChanged(value:Boolean):void {
			hasField$0 |= 0x4;
			islandChanged$field = value;
		}

		public function get islandChanged():Boolean {
			return islandChanged$field;
		}

		/**
		 *  @private
		 */
		public static const LOCATIONCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.locationChanged", "locationChanged", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var locationChanged$field:Boolean;

		public function clearLocationChanged():void {
			hasField$0 &= 0xfffffff7;
			locationChanged$field = new Boolean();
		}

		public function get hasLocationChanged():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set locationChanged(value:Boolean):void {
			hasField$0 |= 0x8;
			locationChanged$field = value;
		}

		public function get locationChanged():Boolean {
			return locationChanged$field;
		}

		/**
		 *  @private
		 */
		public static const AMULETCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.amuletChanged", "amuletChanged", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var amuletChanged$field:Boolean;

		public function clearAmuletChanged():void {
			hasField$0 &= 0xffffffef;
			amuletChanged$field = new Boolean();
		}

		public function get hasAmuletChanged():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set amuletChanged(value:Boolean):void {
			hasField$0 |= 0x10;
			amuletChanged$field = value;
		}

		public function get amuletChanged():Boolean {
			return amuletChanged$field;
		}

		/**
		 *  @private
		 */
		public static const BOOSTERSCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.boostersChanged", "boostersChanged", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var boostersChanged$field:Boolean;

		public function clearBoostersChanged():void {
			hasField$0 &= 0xffffffdf;
			boostersChanged$field = new Boolean();
		}

		public function get hasBoostersChanged():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set boostersChanged(value:Boolean):void {
			hasField$0 |= 0x20;
			boostersChanged$field = value;
		}

		public function get boostersChanged():Boolean {
			return boostersChanged$field;
		}

		/**
		 *  @private
		 */
		public static const BOOSTERCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.boosterChanged", "boosterChanged", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var boosterChanged$field:Boolean;

		public function clearBoosterChanged():void {
			hasField$0 &= 0xffffffbf;
			boosterChanged$field = new Boolean();
		}

		public function get hasBoosterChanged():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set boosterChanged(value:Boolean):void {
			hasField$0 |= 0x40;
			boosterChanged$field = value;
		}

		public function get boosterChanged():Boolean {
			return boosterChanged$field;
		}

		/**
		 *  @private
		 */
		public static const STATISTICCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.statisticChanged", "statisticChanged", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var statisticChanged$field:Boolean;

		public function clearStatisticChanged():void {
			hasField$0 &= 0xffffff7f;
			statisticChanged$field = new Boolean();
		}

		public function get hasStatisticChanged():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set statisticChanged(value:Boolean):void {
			hasField$0 |= 0x80;
			statisticChanged$field = value;
		}

		public function get statisticChanged():Boolean {
			return statisticChanged$field;
		}

		/**
		 *  @private
		 */
		public static const ACHIEVEMENTSCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.achievementsChanged", "achievementsChanged", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var achievementsChanged$field:Boolean;

		public function clearAchievementsChanged():void {
			hasField$0 &= 0xfffffeff;
			achievementsChanged$field = new Boolean();
		}

		public function get hasAchievementsChanged():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set achievementsChanged(value:Boolean):void {
			hasField$0 |= 0x100;
			achievementsChanged$field = value;
		}

		public function get achievementsChanged():Boolean {
			return achievementsChanged$field;
		}

		/**
		 *  @private
		 */
		public static const ACHIEVEMENTCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.achievementChanged", "achievementChanged", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var achievementChanged$field:Boolean;

		public function clearAchievementChanged():void {
			hasField$0 &= 0xfffffdff;
			achievementChanged$field = new Boolean();
		}

		public function get hasAchievementChanged():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set achievementChanged(value:Boolean):void {
			hasField$0 |= 0x200;
			achievementChanged$field = value;
		}

		public function get achievementChanged():Boolean {
			return achievementChanged$field;
		}

		/**
		 *  @private
		 */
		public static const GIFTSCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.giftsChanged", "giftsChanged", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var giftsChanged$field:Boolean;

		public function clearGiftsChanged():void {
			hasField$0 &= 0xfffffbff;
			giftsChanged$field = new Boolean();
		}

		public function get hasGiftsChanged():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set giftsChanged(value:Boolean):void {
			hasField$0 |= 0x400;
			giftsChanged$field = value;
		}

		public function get giftsChanged():Boolean {
			return giftsChanged$field;
		}

		/**
		 *  @private
		 */
		public static const RATINGCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.ratingChanged", "ratingChanged", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ratingChanged$field:Boolean;

		public function clearRatingChanged():void {
			hasField$0 &= 0xfffff7ff;
			ratingChanged$field = new Boolean();
		}

		public function get hasRatingChanged():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set ratingChanged(value:Boolean):void {
			hasField$0 |= 0x800;
			ratingChanged$field = value;
		}

		public function get ratingChanged():Boolean {
			return ratingChanged$field;
		}

		/**
		 *  @private
		 */
		public static const FRIENDSTOPCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.friendsTopChanged", "friendsTopChanged", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var friendsTopChanged$field:Boolean;

		public function clearFriendsTopChanged():void {
			hasField$0 &= 0xffffefff;
			friendsTopChanged$field = new Boolean();
		}

		public function get hasFriendsTopChanged():Boolean {
			return (hasField$0 & 0x1000) != 0;
		}

		public function set friendsTopChanged(value:Boolean):void {
			hasField$0 |= 0x1000;
			friendsTopChanged$field = value;
		}

		public function get friendsTopChanged():Boolean {
			return friendsTopChanged$field;
		}

		/**
		 *  @private
		 */
		public static const DAILYBONUSESCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.dailyBonusesChanged", "dailyBonusesChanged", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dailyBonusesChanged$field:Boolean;

		public function clearDailyBonusesChanged():void {
			hasField$0 &= 0xffffdfff;
			dailyBonusesChanged$field = new Boolean();
		}

		public function get hasDailyBonusesChanged():Boolean {
			return (hasField$0 & 0x2000) != 0;
		}

		public function set dailyBonusesChanged(value:Boolean):void {
			hasField$0 |= 0x2000;
			dailyBonusesChanged$field = value;
		}

		public function get dailyBonusesChanged():Boolean {
			return dailyBonusesChanged$field;
		}

		/**
		 *  @private
		 */
		public static const ROOMCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("DataChangesProtobuf.roomChanged", "roomChanged", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var roomChanged$field:Boolean;

		public function clearRoomChanged():void {
			hasField$0 &= 0xffffbfff;
			roomChanged$field = new Boolean();
		}

		public function get hasRoomChanged():Boolean {
			return (hasField$0 & 0x4000) != 0;
		}

		public function set roomChanged(value:Boolean):void {
			hasField$0 |= 0x4000;
			roomChanged$field = value;
		}

		public function get roomChanged():Boolean {
			return roomChanged$field;
		}

		/**
		 *  @private
		 */
		public static const PLAYER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.player", "player", (17 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerProtobuf; });

		private var player$field:PlayerProtobuf;

		public function clearPlayer():void {
			player$field = null;
		}

		public function get hasPlayer():Boolean {
			return player$field != null;
		}

		public function set player(value:PlayerProtobuf):void {
			player$field = value;
		}

		public function get player():PlayerProtobuf {
			return player$field;
		}

		/**
		 *  @private
		 */
		public static const ISLANDS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.islands", "islands", (18 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return IslandsProtobuf; });

		private var islands$field:IslandsProtobuf;

		public function clearIslands():void {
			islands$field = null;
		}

		public function get hasIslands():Boolean {
			return islands$field != null;
		}

		public function set islands(value:IslandsProtobuf):void {
			islands$field = value;
		}

		public function get islands():IslandsProtobuf {
			return islands$field;
		}

		/**
		 *  @private
		 */
		public static const ISLAND:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.island", "island", (19 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return IslandProtobuf; });

		private var island$field:IslandProtobuf;

		public function clearIsland():void {
			island$field = null;
		}

		public function get hasIsland():Boolean {
			return island$field != null;
		}

		public function set island(value:IslandProtobuf):void {
			island$field = value;
		}

		public function get island():IslandProtobuf {
			return island$field;
		}

		/**
		 *  @private
		 */
		public static const LOCATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.location", "location", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return LocationProtobuf; });

		private var location$field:LocationProtobuf;

		public function clearLocation():void {
			location$field = null;
		}

		public function get hasLocation():Boolean {
			return location$field != null;
		}

		public function set location(value:LocationProtobuf):void {
			location$field = value;
		}

		public function get location():LocationProtobuf {
			return location$field;
		}

		/**
		 *  @private
		 */
		public static const AMULET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.amulet", "amulet", (21 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return AmuletProtobuf; });

		private var amulet$field:AmuletProtobuf;

		public function clearAmulet():void {
			amulet$field = null;
		}

		public function get hasAmulet():Boolean {
			return amulet$field != null;
		}

		public function set amulet(value:AmuletProtobuf):void {
			amulet$field = value;
		}

		public function get amulet():AmuletProtobuf {
			return amulet$field;
		}

		/**
		 *  @private
		 */
		public static const BOOSTERS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.boosters", "boosters", (22 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return BoostersProtobuf; });

		private var boosters$field:BoostersProtobuf;

		public function clearBoosters():void {
			boosters$field = null;
		}

		public function get hasBoosters():Boolean {
			return boosters$field != null;
		}

		public function set boosters(value:BoostersProtobuf):void {
			boosters$field = value;
		}

		public function get boosters():BoostersProtobuf {
			return boosters$field;
		}

		/**
		 *  @private
		 */
		public static const BOOSTER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.booster", "booster", (23 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return BoosterProtobuf; });

		private var booster$field:BoosterProtobuf;

		public function clearBooster():void {
			booster$field = null;
		}

		public function get hasBooster():Boolean {
			return booster$field != null;
		}

		public function set booster(value:BoosterProtobuf):void {
			booster$field = value;
		}

		public function get booster():BoosterProtobuf {
			return booster$field;
		}

		/**
		 *  @private
		 */
		public static const STATISTIC:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.statistic", "statistic", (24 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerStatisticProtobuf; });

		private var statistic$field:PlayerStatisticProtobuf;

		public function clearStatistic():void {
			statistic$field = null;
		}

		public function get hasStatistic():Boolean {
			return statistic$field != null;
		}

		public function set statistic(value:PlayerStatisticProtobuf):void {
			statistic$field = value;
		}

		public function get statistic():PlayerStatisticProtobuf {
			return statistic$field;
		}

		/**
		 *  @private
		 */
		public static const ACHIEVEMENTS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.achievements", "achievements", (25 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return AchievementsProtobuf; });

		private var achievements$field:AchievementsProtobuf;

		public function clearAchievements():void {
			achievements$field = null;
		}

		public function get hasAchievements():Boolean {
			return achievements$field != null;
		}

		public function set achievements(value:AchievementsProtobuf):void {
			achievements$field = value;
		}

		public function get achievements():AchievementsProtobuf {
			return achievements$field;
		}

		/**
		 *  @private
		 */
		public static const ACHIEVEMENT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.achievement", "achievement", (26 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return AchievementProtobuf; });

		private var achievement$field:AchievementProtobuf;

		public function clearAchievement():void {
			achievement$field = null;
		}

		public function get hasAchievement():Boolean {
			return achievement$field != null;
		}

		public function set achievement(value:AchievementProtobuf):void {
			achievement$field = value;
		}

		public function get achievement():AchievementProtobuf {
			return achievement$field;
		}

		/**
		 *  @private
		 */
		public static const GIFTS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.gifts", "gifts", (27 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return PlayerGiftsProtobuf; });

		private var gifts$field:PlayerGiftsProtobuf;

		public function clearGifts():void {
			gifts$field = null;
		}

		public function get hasGifts():Boolean {
			return gifts$field != null;
		}

		public function set gifts(value:PlayerGiftsProtobuf):void {
			gifts$field = value;
		}

		public function get gifts():PlayerGiftsProtobuf {
			return gifts$field;
		}

		/**
		 *  @private
		 */
		public static const RATING:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.rating", "rating", (28 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return RatingProtobuf; });

		private var rating$field:RatingProtobuf;

		public function clearRating():void {
			rating$field = null;
		}

		public function get hasRating():Boolean {
			return rating$field != null;
		}

		public function set rating(value:RatingProtobuf):void {
			rating$field = value;
		}

		public function get rating():RatingProtobuf {
			return rating$field;
		}

		/**
		 *  @private
		 */
		public static const FRIENDSTOP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.friendsTop", "friendsTop", (29 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return TopProtobuf; });

		private var friendsTop$field:TopProtobuf;

		public function clearFriendsTop():void {
			friendsTop$field = null;
		}

		public function get hasFriendsTop():Boolean {
			return friendsTop$field != null;
		}

		public function set friendsTop(value:TopProtobuf):void {
			friendsTop$field = value;
		}

		public function get friendsTop():TopProtobuf {
			return friendsTop$field;
		}

		/**
		 *  @private
		 */
		public static const DAILYBONUSES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.dailyBonuses", "dailyBonuses", (30 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return DailyBonusesProtobuf; });

		private var dailyBonuses$field:DailyBonusesProtobuf;

		public function clearDailyBonuses():void {
			dailyBonuses$field = null;
		}

		public function get hasDailyBonuses():Boolean {
			return dailyBonuses$field != null;
		}

		public function set dailyBonuses(value:DailyBonusesProtobuf):void {
			dailyBonuses$field = value;
		}

		public function get dailyBonuses():DailyBonusesProtobuf {
			return dailyBonuses$field;
		}

		/**
		 *  @private
		 */
		public static const ROOM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("DataChangesProtobuf.room", "room", (31 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return RoomProtobuf; });

		private var room$field:RoomProtobuf;

		public function clearRoom():void {
			room$field = null;
		}

		public function get hasRoom():Boolean {
			return room$field != null;
		}

		public function set room(value:RoomProtobuf):void {
			room$field = value;
		}

		public function get room():RoomProtobuf {
			return room$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.hasChanges);
			if (hasPlayerChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, playerChanged$field);
			}
			if (hasIslandsChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, islandsChanged$field);
			}
			if (hasIslandChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, islandChanged$field);
			}
			if (hasLocationChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, locationChanged$field);
			}
			if (hasAmuletChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, amuletChanged$field);
			}
			if (hasBoostersChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, boostersChanged$field);
			}
			if (hasBoosterChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, boosterChanged$field);
			}
			if (hasStatisticChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, statisticChanged$field);
			}
			if (hasAchievementsChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, achievementsChanged$field);
			}
			if (hasAchievementChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, achievementChanged$field);
			}
			if (hasGiftsChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, giftsChanged$field);
			}
			if (hasRatingChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, ratingChanged$field);
			}
			if (hasFriendsTopChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, friendsTopChanged$field);
			}
			if (hasDailyBonusesChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, dailyBonusesChanged$field);
			}
			if (hasRoomChanged) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, roomChanged$field);
			}
			if (hasPlayer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, player$field);
			}
			if (hasIslands) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, islands$field);
			}
			if (hasIsland) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, island$field);
			}
			if (hasLocation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, location$field);
			}
			if (hasAmulet) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, amulet$field);
			}
			if (hasBoosters) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, boosters$field);
			}
			if (hasBooster) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, booster$field);
			}
			if (hasStatistic) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, statistic$field);
			}
			if (hasAchievements) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 25);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, achievements$field);
			}
			if (hasAchievement) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 26);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, achievement$field);
			}
			if (hasGifts) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 27);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, gifts$field);
			}
			if (hasRating) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 28);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, rating$field);
			}
			if (hasFriendsTop) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 29);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, friendsTop$field);
			}
			if (hasDailyBonuses) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 30);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, dailyBonuses$field);
			}
			if (hasRoom) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 31);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, room$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var hasChanges$count:uint = 0;
			var playerChanged$count:uint = 0;
			var islandsChanged$count:uint = 0;
			var islandChanged$count:uint = 0;
			var locationChanged$count:uint = 0;
			var amuletChanged$count:uint = 0;
			var boostersChanged$count:uint = 0;
			var boosterChanged$count:uint = 0;
			var statisticChanged$count:uint = 0;
			var achievementsChanged$count:uint = 0;
			var achievementChanged$count:uint = 0;
			var giftsChanged$count:uint = 0;
			var ratingChanged$count:uint = 0;
			var friendsTopChanged$count:uint = 0;
			var dailyBonusesChanged$count:uint = 0;
			var roomChanged$count:uint = 0;
			var player$count:uint = 0;
			var islands$count:uint = 0;
			var island$count:uint = 0;
			var location$count:uint = 0;
			var amulet$count:uint = 0;
			var boosters$count:uint = 0;
			var booster$count:uint = 0;
			var statistic$count:uint = 0;
			var achievements$count:uint = 0;
			var achievement$count:uint = 0;
			var gifts$count:uint = 0;
			var rating$count:uint = 0;
			var friendsTop$count:uint = 0;
			var dailyBonuses$count:uint = 0;
			var room$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (hasChanges$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.hasChanges cannot be set twice.');
					}
					++hasChanges$count;
					this.hasChanges = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					if (playerChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.playerChanged cannot be set twice.');
					}
					++playerChanged$count;
					this.playerChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 3:
					if (islandsChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.islandsChanged cannot be set twice.');
					}
					++islandsChanged$count;
					this.islandsChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 4:
					if (islandChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.islandChanged cannot be set twice.');
					}
					++islandChanged$count;
					this.islandChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 5:
					if (locationChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.locationChanged cannot be set twice.');
					}
					++locationChanged$count;
					this.locationChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 6:
					if (amuletChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.amuletChanged cannot be set twice.');
					}
					++amuletChanged$count;
					this.amuletChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 7:
					if (boostersChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.boostersChanged cannot be set twice.');
					}
					++boostersChanged$count;
					this.boostersChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 8:
					if (boosterChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.boosterChanged cannot be set twice.');
					}
					++boosterChanged$count;
					this.boosterChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 9:
					if (statisticChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.statisticChanged cannot be set twice.');
					}
					++statisticChanged$count;
					this.statisticChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 10:
					if (achievementsChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.achievementsChanged cannot be set twice.');
					}
					++achievementsChanged$count;
					this.achievementsChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 11:
					if (achievementChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.achievementChanged cannot be set twice.');
					}
					++achievementChanged$count;
					this.achievementChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 12:
					if (giftsChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.giftsChanged cannot be set twice.');
					}
					++giftsChanged$count;
					this.giftsChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 13:
					if (ratingChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.ratingChanged cannot be set twice.');
					}
					++ratingChanged$count;
					this.ratingChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 14:
					if (friendsTopChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.friendsTopChanged cannot be set twice.');
					}
					++friendsTopChanged$count;
					this.friendsTopChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 15:
					if (dailyBonusesChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.dailyBonusesChanged cannot be set twice.');
					}
					++dailyBonusesChanged$count;
					this.dailyBonusesChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 16:
					if (roomChanged$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.roomChanged cannot be set twice.');
					}
					++roomChanged$count;
					this.roomChanged = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 17:
					if (player$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.player cannot be set twice.');
					}
					++player$count;
					this.player = new PlayerProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.player);
					break;
				case 18:
					if (islands$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.islands cannot be set twice.');
					}
					++islands$count;
					this.islands = new IslandsProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.islands);
					break;
				case 19:
					if (island$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.island cannot be set twice.');
					}
					++island$count;
					this.island = new IslandProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.island);
					break;
				case 20:
					if (location$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.location cannot be set twice.');
					}
					++location$count;
					this.location = new LocationProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.location);
					break;
				case 21:
					if (amulet$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.amulet cannot be set twice.');
					}
					++amulet$count;
					this.amulet = new AmuletProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.amulet);
					break;
				case 22:
					if (boosters$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.boosters cannot be set twice.');
					}
					++boosters$count;
					this.boosters = new BoostersProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.boosters);
					break;
				case 23:
					if (booster$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.booster cannot be set twice.');
					}
					++booster$count;
					this.booster = new BoosterProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.booster);
					break;
				case 24:
					if (statistic$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.statistic cannot be set twice.');
					}
					++statistic$count;
					this.statistic = new PlayerStatisticProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.statistic);
					break;
				case 25:
					if (achievements$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.achievements cannot be set twice.');
					}
					++achievements$count;
					this.achievements = new AchievementsProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.achievements);
					break;
				case 26:
					if (achievement$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.achievement cannot be set twice.');
					}
					++achievement$count;
					this.achievement = new AchievementProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.achievement);
					break;
				case 27:
					if (gifts$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.gifts cannot be set twice.');
					}
					++gifts$count;
					this.gifts = new PlayerGiftsProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.gifts);
					break;
				case 28:
					if (rating$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.rating cannot be set twice.');
					}
					++rating$count;
					this.rating = new RatingProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.rating);
					break;
				case 29:
					if (friendsTop$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.friendsTop cannot be set twice.');
					}
					++friendsTop$count;
					this.friendsTop = new TopProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.friendsTop);
					break;
				case 30:
					if (dailyBonuses$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.dailyBonuses cannot be set twice.');
					}
					++dailyBonuses$count;
					this.dailyBonuses = new DailyBonusesProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.dailyBonuses);
					break;
				case 31:
					if (room$count != 0) {
						throw new flash.errors.IOError('Bad data format: DataChangesProtobuf.room cannot be set twice.');
					}
					++room$count;
					this.room = new RoomProtobuf();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.room);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
