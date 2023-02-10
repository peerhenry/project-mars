{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "room_skirmish",
  "creationCodeFile": "RoomCreationCode.gml",
  "inheritCode": true,
  "inheritCreationOrder": true,
  "inheritLayers": true,
  "instanceCreationOrder": [
    {"name":"inst_back_button","path":"rooms/room_skirmish/room_skirmish.yy",},
    {"name":"inst_start_button","path":"rooms/room_skirmish/room_skirmish.yy",},
    {"name":"inst_44976867","path":"rooms/room_skirmish/room_skirmish.yy",},
    {"name":"inst_3E600AC4","path":"rooms/room_skirmish/room_skirmish.yy",},
    {"name":"inst_label_astronauts","path":"rooms/room_skirmish/room_skirmish.yy",},
    {"name":"inst_label_mdu_count","path":"rooms/room_skirmish/room_skirmish.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Front","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_back_button","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"propertyId":{"name":"click_action","path":"objects/obj_button/obj_button.yy",},"value":"scr_action_back",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"propertyId":{"name":"text","path":"objects/obj_button/obj_button.yy",},"value":"back",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":800.0,"y":192.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_start_button","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"propertyId":{"name":"text","path":"objects/obj_button/obj_button.yy",},"value":"start",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_button","path":"objects/obj_button/obj_button.yy",},"propertyId":{"name":"click_action","path":"objects/obj_button/obj_button.yy",},"value":"scr_start_skirmish",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":800.0,"y":96.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_44976867","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_dropdown_astronauts","path":"objects/obj_dropdown_astronauts/obj_dropdown_astronauts.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":448.0,"y":96.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3E600AC4","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_dropdown_mdu_piles","path":"objects/obj_dropdown_mdu_piles/obj_dropdown_mdu_piles.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":448.0,"y":192.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_label_astronauts","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_label","path":"objects/obj_label/obj_label.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_label","path":"objects/obj_label/obj_label.yy",},"propertyId":{"name":"text","path":"objects/obj_label/obj_label.yy",},"value":"astronauts:",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":64.0,"y":96.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_label_mdu_count","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_label","path":"objects/obj_label/obj_label.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_label","path":"objects/obj_label/obj_label.yy",},"propertyId":{"name":"text","path":"objects/obj_label/obj_label.yy",},"value":"mdu piles:",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":64.0,"y":192.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "room_menu_base",
    "path": "folders/Rooms/MENU/room_menu_base.yy",
  },
  "parentRoom": {
    "name": "room_menu_base",
    "path": "rooms/room_menu_base/room_menu_base.yy",
  },
  "physicsSettings": {
    "inheritPhysicsSettings": true,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 1080,
    "inheritRoomSettings": true,
    "persistent": false,
    "Width": 1920,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":true,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1024,"wview":1024,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": true,
    "inheritViewSettings": true,
  },
  "volume": 1.0,
}