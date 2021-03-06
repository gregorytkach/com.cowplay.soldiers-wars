/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/13/13
 * Time: 4:01 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game
{
import controllers.IController;
import controllers.implementations.Controller;

import soldiers.GameInfo;
import soldiers.controllers.EControllerUpdate;
import soldiers.controllers.game.arrow.ControllerArrowContainer;
import soldiers.controllers.game.decor.ControllerDecorContainer;
import soldiers.controllers.game.grid.ControllerGrid;
import soldiers.controllers.game.houses.ControllerHousesGContainer;
import soldiers.controllers.game.soldiers.ControllerSoldiersContainer;
import soldiers.popups.EPopupType;
import soldiers.views.game.ViewSceneGame;

import views.EControllerUpdateBase;

public class ControllerSceneGame extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewSceneGame;


    /*
     * Properties
     */

    private var _controllerArrow:IController;
    private var _controllerSoldiers:IController;
    private var _controllerHouses:IController;
    private var _controllerDecor:IController;
    private var _controllerGrid:IController;


    /*
     * Methods
     */

    //! Default constructor
    public function ControllerSceneGame()
    {
        _view = new ViewSceneGame(this);
        super(_view);
        init();
    }

    private function init():void
    {
        _controllerGrid = new ControllerGrid(_view.viewGrid);

        _controllerHouses = new ControllerHousesGContainer(_view.viewGrid.viewHousesContainer);
        _controllerSoldiers = new ControllerSoldiersContainer(_view.viewGrid.viewSoldiersContainer);
        _controllerDecor = new ControllerDecorContainer(_view.viewGrid.viewDecorContainer);
        _controllerArrow = new ControllerArrowContainer(_view.viewGrid.viewArrowsContainer);
    }

    public override function update(type:String):void
    {
        switch (type)
        {
            case EControllerUpdate.ECU_HOUSE_SELECTION:
            {
                _controllerArrow.update(type);

                if (_view.viewScrollGrid != null)
                {
                    _view.viewScrollGrid.enableDragging = !GameInfo.instance.managerGame.isAnyHouseSelected(GameInfo.instance.managerGame.gameOwner);
                }

                break;
            }
            case EControllerUpdate.ECU_SOLDIER_STATE:
            {
                _controllerSoldiers.update(type);
                break;
            }
            case EControllerUpdateBase.ECUT_GAME_FINISHED:
            {
                _controllerHouses.update(type);

                GameInfo.instance.managerStates.currentState.showPopup(EPopupType.EPT_LEVEL_END);

                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }

    public override function cleanup():void
    {
        _controllerArrow.cleanup();
        _controllerSoldiers.cleanup();
        _controllerHouses.cleanup();
        _controllerDecor.cleanup();
        _controllerGrid.cleanup();

        super.cleanup();
    }
}
}
