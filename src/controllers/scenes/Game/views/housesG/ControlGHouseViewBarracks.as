/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/23/13
 * Time: 9:43 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.game.views.housesG
{
import controllers.scenes.game.views.housesG.base.ControlGHouseView;

import controls.IControlScene;

import models.data.housesG.base.EHouseGType;
import models.data.housesG.base.HouseInfoG;

public class ControlGHouseViewBarracks extends ControlGHouseView
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
    public function ControlGHouseViewBarracks(sceneOwner:IControlScene, entry:HouseInfoG)
    {
        super(sceneOwner, entry);

        Debug.assert(entry.type == EHouseGType.EHGT_BARRACKS);

        init();
    }

    private function init():void
    {
        setHouseView(new gHouseBarracks());
    }
}
}