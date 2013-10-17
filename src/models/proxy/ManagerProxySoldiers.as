/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/30/13
 * Time: 10:07 AM
 * To change this template use File | Settings | File Templates.
 */
package models.proxy
{
import bwf.models.proxy.IManagerProxy;

import models.data.housesV.base.EHouseVType;
import models.interfaces.social.IManagerSocial;

public class ManagerProxySoldiers implements IManagerProxy
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
    public function ManagerProxySoldiers(managerSocial:IManagerSocial)
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

    public function getHousesVillageData(data:Object):Object
    {
        var houseAltarData:Object =
        {
            level: 1,
            level_max: 2,
            type: EHouseVType.EHVT_ALTAR
        };

        var housesData:Array = [houseAltarData];

        var result:Object =
        {
            houses: housesData
        };

        return result;
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
            type: "ehgt_barracks",
            owner: "eho_enemy",
            level: 1,
            level_max: 1,
            position_x: 4,
            position_y: 4,
            position_exit_offset_x: 3,
            position_exit_offset_y: 3,
            foundation_width: 2,
            foundation_height: 2,
            soldiers: 100,
            soldiers_max: 200
        };


        var houseData1:Object =
        {
            type: "ehgt_barracks",
            owner: "eho_player",
            level: 1,
            level_max: 1,
            position_x: 14,
            position_y: 14,
            position_exit_offset_x: 3,
            position_exit_offset_y: 3,
            foundation_width: 2,
            foundation_height: 2,
            soldiers: 100,
            soldiers_max: 200
        };


        var houseData2:Object =
        {
            type: "ehgt_barracks",
            owner: "eho_player",
            level: 1,
            level_max: 1,
            position_x: 14,
            position_y: 4,
            position_exit_offset_x: 3,
            position_exit_offset_y: 3,
            foundation_width: 2,
            foundation_height: 2,
            soldiers: 100,
            soldiers_max: 200
        };

        var level0Data:Object =
        {
            id: "",
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
            description: "",
            requirements: [],
            levels: [level0Data]
        };

        var result:Object =
        {
            level_containers: [levelContainer],
            last_level_progress: null
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