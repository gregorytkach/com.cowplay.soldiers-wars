/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 17.10.13
 * Time: 15:33
 * To change this template use File | Settings | File Templates.
 */
package controllers.popups.bakery
{
import controls.IControl;
import controls.IControlButton;
import controls.IControlScene;
import controls.implementations.ControlPopupBase;
import controls.implementations.buttons.ControlButtonBase;

import flash.events.MouseEvent;

public class PopupBuildHouse extends ControlPopupBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:gPopupBuildHouse

    private var _buttonBuild:IControlButton

    /*
     * Properties
     */


    /*
     * Methods
     */
    public function PopupBuildHouse(sceneOwner:IControlScene)
    {
        super(sceneOwner);
        init();
    }

    private function init():void
    {
        _sourceViewTyped = new  gPopupBuildHouse();
        setSourceView(_sourceViewTyped);

        var buttonClose:IControl = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonClose);
        setButtonClose(buttonClose);

        _buttonBuild = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonBuild);
        _buttonBuild.actionDelegate = this;
    }

    public override function onControlMouseClick(target:IControl, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onControlMouseClick(target, e);

        if (!result)
        {
            switch (target)
            {
                case _buttonBuild:
                {
                    result = true;
                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }
        }

        return result;

    }
}
}
