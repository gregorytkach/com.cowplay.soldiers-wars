/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/23/13
 * Time: 10:45 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.grab
{
import soldiers.GameInfo;
import soldiers.models.game.managerProgress.targets.base.LTBase;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

public class LTGrabAll extends LTBase
{
    /*
     * Fields
     */
    private var _housesRest:uint;
    private var _houses:Array;

    /*
     * Properties
     */


    public function get housesRest():uint
    {
        return _housesRest;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LTGrabAll()
    {
    }


    override public function onGameStart():void
    {

        _houses = GameInfo.instance.managerGame.houses;

        super.onGameStart();
    }

    public override function update():void
    {
        var isComplete:Boolean = true;

        _housesRest = 0;

        for each(var house:HouseG in _houses)
        {
            if (house.ownerType != EHouseOwner.EHO_PLAYER)
            {
                isComplete = false;
                _housesRest++;
            }
        }

        setIsComplete(isComplete);
    }


}
}
