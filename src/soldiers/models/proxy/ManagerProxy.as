/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/30/13
 * Time: 10:07 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.proxy
{
import bwf.models.proxy.IManagerProxy;

import models.interfaces.social.IManagerSocial;

import soldiers.models.housesGame.base.EHouseTypeG;

public class ManagerProxy implements IManagerProxy
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ManagerProxy(managerSocial:IManagerSocial)
    {
    }


    public function getAdData(data:Object):Object
    {
        return null;
    }

    public function getTutorialData(data:Object):Object
    {
        return null;
    }


    /*
     * IManagerProxy
     */

    public function toRemoteRequestParams(type:String, data:Object):Object
    {
        return null;
    }

    public function getBonusData(data:Object):Object
    {
        return null;
    }

    public function getPurchasesData(data:Object):Object
    {
        return null;
    }

    public function getLevelsData(data:Object):Object
    {
        var houseData0:Object =
        {
            type: EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 4,
            position_y: 4,

            soldiers: 100
        };


        var houseData1:Object =
        {
            type: EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_player",
            level: 1,

            position_x: 14,
            position_y: 14,

            soldiers: 100
        };


        var houseData2:Object =
        {
            type: EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_player",
            level: 1,

            position_x: 14,
            position_y: 4,

            soldiers: 100
        };

        var level0Data:Object =
        {
            id: "0",
            name: "",
            description: "",
            number: 0,
            complete: false,
            reward_currency_soft: 0,
            reward_points: 0,
            grid_width: 20,
            grid_height: 20,

            houses: [houseData0, houseData1, houseData2]
        };

        var levelContainer:Object =
        {
            id: "",
            number: 0,
            name: "name",
            description: "",
            requirements: [],
            levels: [level0Data]
        };

        var result:Object =
        {
            level_containers: [levelContainer],
            level_progress: null,
            level_complete_ids: []
        };

        return result;
    }

    public function getHousesGame(dataObj:Object):Object
    {
        var result:Object =
        {
            barracks: getBarracksData()
        };

        return result;
    }

    private static function getBarracksData():Object
    {
        var housesData:Array = [];

        var barracksLevel1:Object =
        {
            level: 1,

            soldiers_max: 200,
            soldiers_generation: 1,

            position_exit_offset_x: 3,
            position_exit_offset_y: 3,

            foundation_width: 2,
            foundation_height: 2
        };

        housesData.push(barracksLevel1);

        var barracksLevel2:Object =
        {
            level: 2,

            soldiers_max: 20,
            soldiers_generation: 2,

            position_exit_offset_x: 3,
            position_exit_offset_y: 3,

            foundation_width: 2,
            foundation_height: 2
        };

        housesData.push(barracksLevel2);

        var result:Object =
        {
            levels_info: housesData,
            level_max: 2
        };

        return result;
    }

    public function getHousesVillage(dataObj:Object):Object
    {
        var bakeryData:Object = getBakeryData();
        var mineGoldData:Object = getMineGoldData();

        var housesData:Object =
        {
            bakery: bakeryData,
            mineGold: mineGoldData
        };

        var result:Object =
        {
            houses: housesData
        };

        return result;
    }

    private static function getBakeryData():Object
    {
        var bakeryLevel1:Object =
        {
            level: 1,
            time: 5,
            count: 5
        };

        var bakeryLevel2:Object =
        {
            level: 2,
            time: 100,
            count: 20
        };

        var bakeryLevel3:Object =
        {
            level: 3,
            time: 300,
            count: 50
        };

        var result:Object =
        {
            level: 2,

            levels_info: [bakeryLevel1, bakeryLevel2, bakeryLevel3]
        };

        return result;
    }

    private static function getMineGoldData():Object
    {
        var mineGoldConfigLevel1:Object =
        {
            level: 1,
            time: 5,
            count: 5
        };

        var mineGoldConfigLevel2:Object =
        {
            level: 2,
            time: 100,
            count: 20
        };

        var mineGoldConfigLevel3:Object =
        {
            level: 3,
            time: 300,
            count: 50
        };

        var result:Object =
        {
            level: 1,
            levels_info: [mineGoldConfigLevel1, mineGoldConfigLevel2, mineGoldConfigLevel3]
        };

        return result;
    }


    public function getPlayersData(dataObj:Object):Object
    {
        return null;
    }

    public function getPlayersTopPageData(data:Object):Array
    {
        return null;
    }

    public function getPlayerInfoData(dataObj:Object):Object
    {
        return null;
    }

    public function getPlayerPositionData(data:Object):Object
    {
        return null;
    }
}
}
