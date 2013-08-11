package com.onlyplay.slotmatch3.components.games.match
{
	import com.onlyplay.slotmatch3.components.games.Util;

	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * @author Andrew
	 * 
	 * TODO: написать юнит тесты по каждой функции
	 * 
	 */
	public class Matcher_v2
	{
		private static var _w : int ;
		private static var _h : int ;
		private static var type_num : int = 6;
		private static var matchNum : int = 3;
		private static var bonusNum : int = 5;
		private static var idCounter : int;
		private static var _fildPattern : Array;

		// --- API -----------------------------------------
		
		public static function shuffle3 ( field:Array ):Array
		{
			var f : Array = clone(field);

			var _container : Array = [];
			for each (var currentPlace : Object  in _fildPattern)
			{
				var farNeighbours : Array = _container.filter(farNeigbourFilter);
				
				function farNeigbourFilter(place : Object, ..._) : Boolean
				{
					return _isFarNeighbour(place, currentPlace);
				}

				var itemFromField : ItemModel = getMostPossibleItem(farNeighbours, f);//getRandomFromField(neighboursTypes, f);
																
				itemFromField.x = currentPlace.x;
				itemFromField.y = currentPlace.y;
				_container.push(itemFromField);
			}
			
			
			function getMostPossibleItem( farNeighbourss:Array , fieldContainer:Array):ItemModel 
			{
				var excludeGroups:Array = []; 
				partition(excludeGroups, farNeighbourss, foo_);
				excludeGroups = excludeGroups.filter(function (group:Array, ..._):Boolean{ return group.length >= 2;});
				//log ( excludeGroups );
				
				if (excludeGroups.length > 0)
				{
					// как альтернатива, мы можем строить гистограмму
					var excludeTypes:Array = excludeGroups.map(function (excludeGroup:Array, ..._):*{ return excludeGroup[0].type});
					var types:Array = Util.range(type_num);
					var variants:Array = substruct(types, excludeTypes);
					//log(variants);
					
					// сейчас делаем самый примитивный подход. Самый првильный - по-моему на базе гистограмм.
					for (var i : int = 0; i < fieldContainer.length ; i++) {
						var currentItem:ItemModel = fieldContainer[i];
						if ( variants.indexOf(currentItem.type ) != -1 )
						{
							return fieldContainer.splice(i, 1)[0];
						}
					}
					
					
					//var goodType:int = variants[Util.randInt(variants.length)];
					return fieldContainer.splice(Util.randInt(fieldContainer.length), 1)[0];//goodType; 
					
				}
				else
				{
					log("any");
					// Возвращаем любой из всего спектра
					// return  Util.randInt(type_num);
					return fieldContainer.splice(Util.randInt(fieldContainer.length), 1)[0];
				}
			}
			
			function foo_(a:ItemModel, b:ItemModel  ):Boolean
			{
				var dX:int = a.x - b.x;
				var dY:int = a.y - b.y;
				return a.type == b.type && ((dX <= 2 && dY == 0) || (dY <= 2 && dX == 0)) && !(dX == 0 && dY == 0);				
			}

//			function getRandomFromField(neighboursTypes : Array, container : Array) : ItemModel
//			{
//				for (var i : int = 0; i < container.length; i++)
//				{
//					var item : ItemModel = container[i];
//					if (  neighboursTypes.indexOf(item.type) == -1 ) return container.splice(i, 1)[0];
//				}
//				return container.splice(Util.randInt(container.length), 1)[0];
//			}

			return _container;

		}
		
		
		public static function genField3(fieldShape : int, ...options) : Array
		{
			initFieldShape(fieldShape, options);

			var _container : Array = [];
			for each (var currentPlace : Object  in _fildPattern)
			{
				var farNeighbours : Array = _container.filter(farNeigbourFilter);
				//log(farNeighbours.length);
				var possibleType : int = getMostPossibleType(farNeighbours);

				_container.push(new ItemModel(currentPlace.x, currentPlace.y, possibleType, (++idCounter).toString()));

				function farNeigbourFilter(place : Object, ..._) : Boolean
				{
					return _isFarNeighbour(place, currentPlace);
				}
			}
			
			function getMostPossibleType( farNeighbourss:Array ):int
			{
				var excludeGroups:Array = []; 
				partition(excludeGroups, farNeighbourss, foo);
				excludeGroups = excludeGroups.filter(function (group:Array, ..._):Boolean{ return group.length >= 2;});
				//log ( excludeGroups );
				
				if (excludeGroups.length > 0)
				{
					// как альтернатива, мы можем строить гистограмму
					var excludeTypes:Array = excludeGroups.map(function (excludeGroup:Array, ..._):*{ return excludeGroup[0].type});
					var types:Array = Util.range(type_num);
					var variants:Array = substruct(types, excludeTypes);
					log(variants);
					
					var goodType:int = variants[Util.randInt(variants.length)];
					return goodType;
					
				}
				else
				{
					log("any");
					// Возвращаем любой из всего спектра
					return Util.randInt(type_num);
				}
			}
			
			function foo(a:ItemModel, b:ItemModel  ):Boolean
			{
				var dX:int = a.x - b.x;
				var dY:int = a.y - b.y;
				return a.type == b.type && ((dX <= 2 && dY == 0) || (dY <= 2 && dX == 0)) && !(dX == 0 && dY == 0);				
			}
			

			return _container;
		}
		
		private static function _isFarNeighbour(a:Object , b:Object):Boolean
		{
			var dX : int = Math.abs(a.x - b.x);
			var dY : int = Math.abs(a.y - b.y);
			return dX <= 2 && dY <= 2 && dX != dY && !(dX == 0 && dY == 0);
		}

		private static function initFieldShape(fieldShape : int, options : Array)
		{
			// TODO: Вынести в init pattern ???
			_fildPattern = FieldShapes.getFieldPattern(fieldShape, options);

			for each (var el : Object in _fildPattern)
			{
				_w = Math.max(_w, el.x + 1);
				_h = Math.max(_h, el.y + 1);
			}
		}

//		public static function genField2(fieldShape : int, ...options) : Array
//		{
//			// var currentPlace:Object  = fieldShape[0];
//
//			initFieldShape(fieldShape, options);
//
//			// делаем самый простой случай
//			var _container : Array = [];
//			for each (var currentPlace : Object  in _fildPattern)
//			{
//				var neighboursTypes : Array = _container.filter(foo).map(function(item : ItemModel, ..._) : *
//				{
//					return item.type;
//				});
//				var possibleType : int = getMostPossibleType(neighboursTypes);
//
//				_container.push(new ItemModel(currentPlace.x, currentPlace.y, possibleType, (++idCounter).toString()));
//
//				function foo(place : Object, ..._) : Boolean
//				{
//					return _isNeigbour(place, currentPlace);
//				}
//			}
//
//			function getMostPossibleType(neighboursTypes : Array) : int
//			{
//				var types : Array = Util.range(type_num);
//				var possType : int;
//
//				var possibleTypes : Array = substruct(types, neighboursTypes);
//				if (possibleTypes.length > 0)
//				{
//					possType = possibleTypes[Util.randInt(possibleTypes.length)];
//				}
//				else
//				{
//					log("we come into the branche ,where we make current item's type as neibour's one");
//					// Здесь я предлагаю смотреть на клетку дальше от соседа и смотреть чтобы не было матча
//					for each (var nType : int in neighboursTypes)
//					{
//						var farNeighbourType : int = getFarNeighbour();
//						// if ()
//					}
//				}
//				return possType;
//			}
//
//			function getFarNeighbour() : *
//			{
//				// TODO
//			}
//
//			return _container;
//		}

//		public static function shuffle(field : Array) : Array
//		{
//			var f : Array = clone(field);
//
//			// делаем самый простой случай
//			// TODO: вынести  генерацию гистограмм в утильный метод типа group-by или group-all
//			// var histogramm : Array = [];
//			// var histogramm_ : Array = Util.partition(field, function(a : ItemModel, b : ItemModel) : Boolean
//			// {
//			// return a.type == b.type;
//			// });
//			// for each (var group : Array in histogramm_)
//			// {
//			//				//  check for existance !!! ???
//			// var index : int = group[0].type;
//			// histogramm[ index ] = group;
//			// }
//
//			var _container : Array = [];
//			for each (var currentPlace : Object  in _fildPattern)
//			{
//				var neighboursTypes : Array = _container.filter(foo).map(function(item : ItemModel, ..._) : *
//				{
//					return item.type;
//				});
//				// var possibleType : int = getMostPossibleType(neighboursTypes);
//
//				// _container.push(new ItemModel(currentPlace.x, currentPlace.y, possibleType, (++idCounter).toString()));
//				var itemFromField : ItemModel = getRandomFromField(neighboursTypes, f);
//				// getGoodItemFromField(neighboursTypes, histogramm);
//				itemFromField.x = currentPlace.x;
//				itemFromField.y = currentPlace.y;
//				_container.push(itemFromField);
//
//				function foo(place : Object, ..._) : Boolean
//				{
//					return _isNeigbour(place, currentPlace);
//				}
//			}
//
//			function getRandomFromField(neighboursTypes : Array, container : Array) : ItemModel
//			{
//				for (var i : int = 0; i < container.length; i++)
//				{
//					var item : ItemModel = container[i];
//					if (  neighboursTypes.indexOf(item.type) == -1 ) return container.splice(i, 1)[0];
//				}
//				return container.splice(Util.randInt(container.length), 1)[0];
//			}
//
//			function getGoodItemFromField(neighboursTypes : Array, histogramm : Array) : ItemModel
//			{
//				// здесь мы подбирамем новый item из гистограммы и модифицируем гистограмму
//				// TODO: переписать более элегантно
//				var types : Array = Util.range(type_num);
//				var possibleTypes : Array = substruct(types, neighboursTypes);
//				var possibleGroups : Array = [];
//
//				for each (var itemType : int in possibleTypes)
//				{
//					var group : Array = histogramm[itemType];
//					if ( group && group.length > 0)
//					{
//						possibleGroups.push(group);
//					}
//				}
//
//				possibleGroups.sortOn("length", Array.NUMERIC);
//
//				// var lastGroup : Array = possibleGroups[possibleGroups.length - 1];
//				var randGroup : Array = possibleGroups[Util.randInt(possibleGroups.length)];
//				var index : int = Util.randInt(randGroup.length);
//				var goodItem : ItemModel = randGroup.splice(index, 1)[0];
//
//				if ( !goodItem)
//				{
//					log("something bad");
//				}
//
//				return goodItem;
//			}
//
//			// function getMostPossibleType(neighboursTypes : Array) : int
//			// {
//			// var types : Array = Util.range(type_num);
//			// var possType : int;
//			//
//			// var possibleTypes : Array = substruct(types, neighboursTypes);
//			// if (possibleTypes.length > 0)
//			// {
//			// possType = possibleTypes[Util.randInt(possibleTypes.length)];
//			// }
//			// else
//			// {
//			// log("we come into the branche ,where we make current item's type as neibour's one");
//			//					//  Здесь я предлагаю смотреть на клетку дальше от соседа и смотреть чтобы не было матча
//			// for each (var nType : int in neighboursTypes)
//			// {
//			// var farNeighbourType : int = getFarNeighbour();
//			//
//			//						//  if ()
//			// }p
//			// }
//			// return possType;
//			// }
//			//
//			// function getFarNeighbour() : *
//			// {
//			//				//  TODO
//			// }
//
//			return _container;
//		}

//		public static function genField(fieldShape : int, ...options) : Array
//		{
//			var attempts : int = 0;
//
//			_fildPattern = FieldShapes.getFieldPattern(fieldShape, options);
//
//			do
//			{
//				var _container : Array = [];
//
//				for each (var el : Object in _fildPattern)
//				{
//					_container.push(new ItemModel(el.x, el.y, getRandInt(type_num), (++idCounter).toString()));
//					// this is for speed now
//					// bring it to separate code
//					_w = Math.max(_w, el.x + 1);
//					_h = Math.max(_h, el.y + 1);
//				}
//
//				var part : Array = [];
//				partition(part, _container, _isNeigbour);
//				var groups : Array = getValidGroups(part);
//				log(groups.length);
//			}
//			while ( groups.length > 0 && attempts++ < 30);
//			log("attemptions:" + attempts);
//			return _container;
//		}


		//--- end generate and shuffle methods ------------------------------------------------------------------

		public static function getPossibleSwaps(field : Array) : Array
		{
			var swaps : Array = [];

			// var horSiblingPattern : Array = [[-2, 0], [-1, -1], [-1, 1], [2, -1], [2, 1], [3, 0]];
			var horSiblingLeftPattern : Array = [[-2, 0], [-1, -1], [-1, 1]];
			var horSiblingRightPattern : Array = [[2, -1], [2, 1], [3, 0]];

			var horCenterPattern : Array = [[1, -1], [1, 1]];

			// var vertSiblingPattern : Array = [[0, -2], [-1, -1], [1, -1], [-1, 2], [1, 2], [0, 3]];
			var vertSiblingUpperPattern : Array = [[0, -2], [-1, -1], [1, -1]];
			var vertSiblingDownPattern : Array = [[-1, 2], [1, 2], [0, 3]];

			var vertCenterPattern : Array = [[-1, 1], [1, 1]];

			for each (var item : ItemModel in field)
			{
				// hor possibles, sibling
				var nextHor : ItemModel = getItemByCoords(field, item.x + 1, item.y) as ItemModel;
				if (nextHor && item.type == nextHor.type)
				{
					// тогда провераяем
					// lookForPattern(item, nextHor, horSiblingPattern);
					var leftVacant : ItemModel = getItemByCoords(field, item.x - 1, item.y) as ItemModel;
					if (leftVacant)
					{
						lookForPattern(item, nextHor, horSiblingLeftPattern);
					}
					var rightVacant : ItemModel = getItemByCoords(field, item.x + 2, item.y) as ItemModel;
					if (rightVacant)
					{
						lookForPattern(item, nextHor, horSiblingRightPattern);
					}
				}
				else
				{
					var nextHorFromOne : ItemModel = getItemByCoords(field, item.x + 2, item.y) as ItemModel;
					var centerVacant : ItemModel = getItemByCoords(field, item.x + 1, item.y) as ItemModel;
					if (nextHorFromOne && centerVacant && nextHorFromOne.type == item.type)
					{
						lookForPattern(item, nextHorFromOne, horCenterPattern);
					}
				}

				// ver possibles, sibling
				var nextVer : ItemModel = getItemByCoords(field, item.x, item.y + 1) as ItemModel;
				if (nextVer && item.type == nextVer.type)
				{
					// тогда провераяем
					// lookForPattern(item, nextVer, vertSiblingPattern);
					var upperVacant : ItemModel = getItemByCoords(field, item.x, item.y - 1) as ItemModel;
					if (upperVacant)
					{
						lookForPattern(item, nextVer, vertSiblingUpperPattern);
					}
					var downVacant : ItemModel = getItemByCoords(field, item.x, item.y + 2) as ItemModel;
					if (downVacant)
					{
						lookForPattern(item, nextVer, vertSiblingDownPattern);
					}
				}
				else
				{
					var nextVerFromOne : ItemModel = getItemByCoords(field, item.x, item.y + 2) as ItemModel;
					var centerVacant_ : ItemModel = getItemByCoords(field, item.x, item.y + 1) as ItemModel;
					if (nextVerFromOne && centerVacant_ && nextVerFromOne.type == item.type)
					{
						lookForPattern(item, nextVerFromOne, vertCenterPattern);
					}
				}
			}

			function lookForPattern(currnetItem : ItemModel, next : ItemModel, pattern : Array) : void
			{
				for each (var i : Array in pattern)
				{
					var candidate : ItemModel = getItemByCoords(field, currnetItem.x + i[0], item.y + i[1]) as ItemModel;
					if ( candidate && candidate.type == item.type)
					{
						swaps.push([item, next, candidate]);
					}
				}
			}

			// здесь делаем в лоб. Потом придумаем что-то более интеллектуальное
			// var indexedField:Array  = [];
			//
			//			//  индексируем
			// for each (var item : ItemModel in field)
			// {
			// if ( !indexedField[item.x] )
			// {
			// indexedField[item.x] = [];

			// }
			// indexedField[item.x][item.y] = item;

			// }

			// Здесь по сути нам требуется получить список всех правильных
			// пар.
			// Прямая реализация через цикл - плоха потому что зависит от _w и _h,
			// и не подходит для не квадратых полей

			// Эта реализация - подходит для полей любой формы
			// но медленнее
			// function getSwapPairs( field:Array ):Array
			// {
			// if (field.length == 0) return [];
			// var firstItem:ItemModel = field[0];
			// var neighbours:Array = field.filter( function (item:ItemModel, ..._):Boolean { return _isNeigbour(firstItem, item); });
			// var swaps:Array = [];
			// for each (var neighbour : ItemModel in neighbour)
			// {

			// swaps.push( [firstItem, neighbour]);

			// }
			// return swaps.concat( getSwapPairs( substruct( field, firstItem ) ) );// это красиво но очень не эффективно
			// }

			// var swapPairs:Array = getSwapPairs(field);
			// swapPairs = swapPairs.filter(
			// function (pair:Array, ..._):Boolean
			// {
			// var hSwapedState : Array = swap(pair[0], pair[1], field);
			// var hresults : Object = resolve(hSwapedState);
			// return (hresults.groups as Array).length > 0;
			//
			// });

			// for (var y : int = 0; y < maxCols; y++)
			// {
			// for (var x : int = 0; x < maxRaws; x++)
			// {
			// var item1 : ItemModel = getItemByCoords(field, x, y) as ItemModel;
			// var item2 : ItemModel = getItemByCoords(field, x + 1, y) as ItemModel;
			// var item3 : ItemModel = getItemByCoords(field, x, y + 1) as ItemModel;
			//
			// if (item1 && item2 && item1.type != item2.type )
			// {
			// var hSwapedState : Array = swap(item1, item2, field);
			// var hresults : Object = resolve(hSwapedState);
			// if ((hresults.groups as Array).length > 0)
			// {
			//							//  swaps.push([item1, item2]);
			// swaps.push( hresults.groups );
			// }
			// }
			// if (item1 && item3 && item1.type != item3.type)
			// {
			// var vSwapState : Array = swap(item1, item3, field);
			// var vresults : Object = resolve(vSwapState);
			// if ((vresults.groups as Array).length > 0)
			// {
			//							//  swaps.push([item1, item3]);
			// swaps.push( vresults.groups );
			// }
			// }
			// }
			// }
			return swaps;
		}

		public static function getItemByCoords(field : Array, x : int, y : int) : Object
		{
			for each (var item : Object in field)
			{
				if ( item.x == x && item.y == y) return item;
			}
			return null;
		}

		public static function resolve(field : Array) : Object
		{
			var newState : Array = clone(field);
			// var part : Array = [];

			// my "grouping variant"
			// partition(part, newState, _isNeigbour);

			var hGroups : Array = [];
			partition(hGroups, newState, _rawNeibour);
			var vGroups : Array = [];
			partition(vGroups, newState, _colNeibour);

			var hValidGroups : Array = getValidGroups(hGroups);
			var vValidGroups : Array = getValidGroups(vGroups);
			var validGroups : Array = hValidGroups.concat(vValidGroups);

			var bonuses : Object = getBonusGroups(vValidGroups, hValidGroups);

			return {groups:validGroups, newState:newState, bonuses:bonuses};
		}

		private static function getBonusGroups(vGroups : Array, hGroups : Array) : Object
		{
			var crosses : Array = [];
			var vCrosses : Array = [];
			var hCrosses : Array = [];
			for each (var vGroup : Array in vGroups)
			{
				for each (var hGroup : Array in hGroups)
				{
					if (hGroup[0].type == vGroup[0].type)
					{
						var n : Array = intersect(vGroup, hGroup);
						if (n.length > 0 )
						{
							vCrosses.push(vGroup);
							hCrosses.push(hGroup);
							crosses.push([vGroup, hGroup]);
						}
					}
				}
			}

			var vBonuses : Array = substruct(vGroups, vCrosses).filter(filterFunction);
			var hBonuses : Array = substruct(hGroups, hCrosses).filter(filterFunction);

			function filterFunction(group : Array, ..._) : Boolean
			{
				return group.length > 3;
			}

			// log('vBonuses.length: ' + (vBonuses.length));
			// log('crosses.length: ' + (crosses.length));

			return {crosses:crosses, vBonuses:vBonuses, hBonuses:hBonuses};
		}

		public static function swap(item1 : Object, item2 : Object, field : Array) : Array
		{
			var newState : Array = clone(field);
			var newItem1 : Object = getItemById(item1.id, newState);
			var newItem2 : Object = getItemById(item2.id, newState);

			newItem1.x = item2.x;
			newItem1.y = item2.y;
			newItem2.x = item1.x;
			newItem2.y = item1.y;

			return newState;
		}

		// ----------------------------------------
		public static function getNewStateAfterDeletionAndPopulation(groups : Array, newSwapedState : Array, bonuses : Object) : Object
		{
			// TODO: consider bring calling getBonusGroups() here instead of inside resolve()...
			// this may encrease effictiveness a very little bit.

			// bonuses --- wihout bonuses yet
			// var bonuses : Array = [];
			// for each (var group : Array in groups)
			// {
			// if (group.length >= bonusNum)
			// {
			// var groupWithoutSupers:Array = group.filter(function (i:Object, ..._):Boolean{return i.type != "super";});
			// var randItem : Object = groupWithoutSupers[getRandInt(groupWithoutSupers.length)];
			// bonuses.push({x:randItem.x, y:randItem.y, type:"super", id:(++idCounter).toString()});
			// }
			// }

			var groupsFlat : Array = [].concat.apply(null, groups);
			var newField : Array = substruct(newSwapedState, groupsFlat);

			// мы здесь считаем ещё и удаления по взрывам
			var charged_ : Array = groupsFlat.filter(function(item : ItemModel, ..._) : Boolean
			{
				return item.charge
			});
			var allBlastedItems : Array = getBlastedItems(newField, charged_);
			newField = substruct(newField, allBlastedItems);
			log("allBlastedItems.length:" + allBlastedItems.length);

			// bonuses
			var bons : Array = [];
			var crosses : Array = bonuses.crosses;
			var vBonuses : Array = bonuses.vBonuses;
			var hBonuses : Array = bonuses.hBonuses;

			for each (var crossPair : Array in crosses)
			{
				var cross : Array = crossPair[0].concat(crossPair[1]);
				var bomb : ItemModel = cross[Util.randInt(cross.length)];
				bomb.charge = ItemModel.BOMB;
				bons.push(bomb);
			}

			for each (var vGroup : Array in vBonuses)
			{
				var vCharge : ItemModel = vGroup[Util.randInt(vGroup.length)];
				vCharge.charge = ItemModel.VER;
				bons.push(vCharge);
			}

			for each (var hGroup : Array in hBonuses)
			{
				var hCharge : ItemModel = hGroup[Util.randInt(hGroup.length)];
				hCharge.charge = ItemModel.HOR;
				bons.push(hCharge);
			}

			// for anim
			var forAnim : Array = groupsFlat.concat(allBlastedItems).filter(function(item : ItemModel, ..._) : Boolean
			{
				return item.microbonus || item.charge;
			});

			newField = newField.concat(bons);

			// population
			var newItems : Array = [];

			for (var i : int = 0; i < _w; i++)
			{
				var col : Array = newField.filter(colomnFilter);
				var patternCol : Array = _fildPattern.filter(colomnFilter);
				// patternCol.sortOn("y", Array.NUMERIC);

				function colomnFilter(item : Object, ..._) : Boolean
				{
					return item.x == i;
				}

				if (col.length < patternCol.length )
				{
					var newItemsInColomn : Array = [];

					while ( col.length + newItemsInColomn.length < patternCol.length)
					{
						// var newItem : Object = {x:i, y:-(newItemsInColomn.length + 1), type:getRandInt(type_num), id:(++idCounter).toString()};
						var newItem : ItemModel = new ItemModel(i, -(newItemsInColomn.length + 1), getRandInt(type_num), (++idCounter).toString());
						// --- microbonuses ----
						if (Math.random() < 0.5)// XXX: magic number bring to conf
						{
							newItem.microbonus = Util.randInt(3) + 1;
						}
						// newItem.charge = ItemModel.
						newItemsInColomn.push(newItem);
					}
					newItems.push(newItemsInColomn);
				}
			}

			newField = newField.concat.apply(null, newItems);

			return {newField:newField, forAnim:forAnim};
		}

		private static function getBlastedItems(field : Array, onDelationItems : Array) : Array
		{
			if (field.length == 0 || onDelationItems.length == 0) return [];

			var charged : Array = onDelationItems.filter(function(item : ItemModel, ..._) : Boolean
			{
				return item.charge;
			});

			var onDelete : Array = [];
			for each (var chargedItem : ItemModel in charged)
			{
				var newItemsOnDelete : Array = getBlasted(field, chargedItem);
				onDelete = onDelete.concat(newItemsOnDelete);
			}

			return onDelete.concat(getBlastedItems(substruct(field, onDelete), onDelete));

			// return null;
		}

		private static function getBlasted(field : Array, chargedItem : ItemModel) : Array
		{
			log('chargedItem.charge: ' + (chargedItem.charge));
			var filterFunctions : Dictionary = new Dictionary(true);
			filterFunctions[ ItemModel.BOMB ] = function(item : ItemModel, ..._) : Boolean
			{
				return _isNeigbour(chargedItem, item);
			};
			filterFunctions[ ItemModel.VER ] = function(item : ItemModel, ..._) : Boolean
			{
				return item.x == chargedItem.x;
			};
			filterFunctions[ ItemModel.HOR ] = function(item : ItemModel, ..._) : Boolean
			{
				return item.y == chargedItem.y;
			};

			var blasted : Array = field.filter(filterFunctions[chargedItem.charge]);
			return blasted;
		}

		public static function getNewDensityState(newFieldState : Array) : Array
		{
			for (var j : int = 0; j < _w; j++)
			{
				var patternCol : Array = _fildPattern.filter(colomnFilter);
				patternCol.sortOn("y", Array.NUMERIC);

				function colomnFilter(item : Object, ..._) : Boolean
				{
					return item.x == j;
				}

				var col : Array = newFieldState.filter(colomnFilter);
				col = col.sortOn("y", Array.NUMERIC);

				var i : int = 0;
				for each (var place : Object in patternCol)
				{
					col[i++].y = place.y;
				}

				// for (var i : int = 0; i < col.length; i++)
				// {
				//					//  col[i].y = i;
				// col[i].y = patternCol[i][1];
				// }
			}
			return newFieldState;
		}

		// --- validator -------------------------------------------
		private static function getValidGroups(part : Array) : Array
		{
			var groups : Array = part.filter(function(group : Array, ..._) : Boolean
			{
				return validateGroup(group);
			});

			return groups;
		}

		private static function _rawNeibour(a : Object, b : Object) : Boolean
		{
			return a.y == b.y && Math.abs(a.x - b.x) == 1;
		}

		private static function _colNeibour(a : Object, b : Object) : Boolean
		{
			return a.x == b.x && Math.abs(a.y - b.y) == 1;
		}

		private static function validateGroup(group : Array) : Boolean
		{
			if (group.length < matchNum) return false;

			var raws : Array = [];
			var cols : Array = [];

			partition(raws, group, _rawNeibour);
			partition(cols, group, _colNeibour);

			var lines : Array = raws.concat(cols);
			var validLines : Array = lines.filter(function(line : Array, ..._) : Boolean
			{
				return line.length >= matchNum;
			});
			return validLines.length > 0;
		}

		// --- algorithm ----------------------------
		public static function partition(accum : Array, container : Array, neibourFunction : Function) : void
		{
			// uncomment, pls,  for "supers" support

			// var supers : Array = container.filter(function(i : Object, ..._) : Boolean
			// {
			// return i.type == "super";
			// });
			// var containerWithoutSupers : Array = substruct(container, supers);
			// if (containerWithoutSupers.length == 0 ) return ;
			if ( container.length == 0) return;

			var group : Array = [];
			// getGroup(group, container, containerWithoutSupers[0], containerWithoutSupers[0].type, neibourFunction);
			getGroup(group, container, container[0], container[0].type, neibourFunction);
			accum.push(group);

			// var rest : Array = substruct(container, substruct(group, supers));
			var rest : Array = substruct(container, group);
			partition(accum, rest, neibourFunction);
		}

		private static function getGroup(group : Array, rest : Array, item : Object, groupType : *, neibourFunction : Function) : void
		{
			group.push(item);
			var neibours : Array = rest.filter(function(i : Object, ..._) : Boolean
			{
				return neibourFunction(i, item);
				// _isNeigbour(i, item);
			});

			for each (var neibour : Object in neibours)
			{
				if (neibour.type == groupType || neibour.type == "super")
				{
					getGroup(group, substruct(rest, neibours, group), neibour, groupType, neibourFunction);
				}
			}
		}

		// Кстати, правила соседства. Можно сделать, например, и диагонали тоже...
		public static function _isNeigbour(a : Object, b : Object) : Boolean
		{
			var dX : int = Math.abs(a.x - b.x);
			var dY : int = Math.abs(a.y - b.y);
			return dX < 2 && dY < 2 && dX != dY && !(dX == 0 && dY == 0);
		}

		// --- utils ----------------------------------------------------------
		public static function substruct(a : Array, ...ar) : Array
		{
			var r : Array = [];
			var b : Array = [].concat.apply(null, ar);
			for each (var o : Object in a)
			{
				if ( b.indexOf(o) == -1) r.push(o);
			}
			return r;
		}

		private static function intersect(a : Array, b : Array) : Array
		{
			var r : Array = [];
			var is_a_shorter_than_b : Boolean = (a.length < b.length);
			var _a : Array = is_a_shorter_than_b ? a : b;
			var _b : Array = is_a_shorter_than_b ? b : a;
			for each (var o : Object in _a)
			{
				if ( _b.indexOf(o) != -1) r.push(o);
			}
			return r;
		}

		private static function getRandInt(n : int) : int
		{
			return int(Math.random() * n);
		}

		public static function getItemById(id : String, field : Array) : Object
		{
			for each (var item : Object in field)
			{
				if (item.id == id) return item;
			}
			return null;
		}

		// --------------------------------------------------------------
		private static function clone(a : Array) : Array
		{
			var r : Array = [];
			for each (var o : Object in a)
			{
				// r.push(cloneObject(o));
				r.push((o as ItemModel).clone());
			}
			return r;
		}

		private static function cloneObject(o : Object) : Object
		{
			// var newObject : Object = {};
			// for (var prop : String in o)
			// {
			// newObject[prop] = o[prop];
			// }
			// return newObject;

			var buffer : ByteArray = new ByteArray();
			buffer.writeObject(o);
			buffer.position = 0;
			var result : Object = buffer.readObject();
			return result;
		}
	}
}
