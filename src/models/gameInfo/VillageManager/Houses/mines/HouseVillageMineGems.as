/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/4/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package models.gameInfo.VillageManager.Houses.mines
{
import models.gameInfo.GameInfo;
import models.gameInfo.VillageManager.Houses.*;
import models.gameInfo.VillageManager.Houses.base.EHouseVillageState;
import models.gameInfo.VillageManager.Houses.base.EHouseVillageType;
import models.gameInfo.VillageManager.Houses.base.HouseVillageBase;

public class HouseVillageMineGems extends HouseVillageBase
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    public override function get type():EHouseVillageType
    {
        return EHouseVillageType.EHVT_MINE_GEMS;
    }


    /*
     * Methods
     */

    //! Default constructor
    public function HouseVillageMineGems(state:EHouseVillageState, level:int)
    {
        super(state, level);
    }

    protected override function canBuild():Boolean
    {
        return GameInfo.Instance.moneyManager.moneyGems > 5;
    }

}
}
