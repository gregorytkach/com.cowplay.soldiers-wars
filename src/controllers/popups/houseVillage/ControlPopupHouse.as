/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/5/13
 * Time: 1:20 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.popups.houseVillage
{
import controllers.EPopupType;
import controllers.popups.houseVillage.content.ControlPopupHouseContentMilitary;

import controls.IControlScene;
import controls.implementations.ControlPopupBase;

public class ControlPopupHouse extends ControlPopupBase
{
    /*
     * Fields
     */

//    private var _sourceViewTyped:gPopupHouse;

    /*
     * Properties
     */

    public override function get type():String
    {
        return EPopupType.EPT_VILLAGE_HOUSE;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlPopupHouse(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
//        _sourceViewTyped = new gPopupHouse();
//        setSourceView(_sourceViewTyped);

//        _sourceViewTyped.buttonClose.addEventListener(MouseEvent.CLICK, onButtonCloseClicked);

//        _contentMilitary = new ControlPopupHouseContentMilitary(sceneOwner);
//        _sourceViewTyped.addChild(_contentMilitary);

//        _controlHeaderRow0 = new ControlHousePopupHeaderRow(_sceneOwner);
//        addChild(_controlHeaderRow0);
    }
}
}