protoc --plugin=protoc-gen-as3="D:/Temp/protoc-gen-as3/protoc-gen-as3.bat" --as3_out=D:/work/workspaces/fdt_ws/slotmatch/src_proto GameRequests.proto GameData.proto GameResponses.proto GameRoot.proto

scp MainFlash.swf andrew@10.0.1.118:/home/andrew/www/

scp MainFlash.swf onlyplay@onlyplay.game-insight.com:/var/www/puzzleslots/flash/
scp /cygdrive/d/work/workspaces/fdt_ws/slotmatch/bin/MainFlash.swf onlyplay@onlyplay.game-insight.com:/var/www/puzzleslots/flash/

https://apps.facebook.com/puzzleslots/
http://onlyplay.game-insight.com/puzzleslots/flash/