/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 17.10.13
 * Time: 12:02
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.popups.houses.bakery
{
import com.greensock.TweenLite;
import com.greensock.TweenMax;

import controllers.IControllerPopup;

import controls.IView;
import controls.IViewButton;
import controls.implementations.ViewPopup;
import controls.implementations.buttons.ViewButton;
import controls.implementations.buttons.ViewButtonLabeled;

import flash.geom.Point;

public class ViewPopupBakery extends ViewPopup
{

    /*
     * Fields
     */

    private var _items:Array;

    private var _sourceView:gPopupBakery;

    private var _buttonImprove:IViewButton;
    private var _buttonLeft:IViewButton;
    private var _buttonRight:IViewButton;


    /*
     * Properties
     */

    public function get buttonImprove():IViewButton
    {
        return _buttonImprove;
    }

    public function get buttonLeft():IViewButton
    {
        return _buttonLeft;
    }

    public function get buttonRight():IViewButton
    {
        return _buttonRight;
    }

    /*
     * Methods
     */
    public function ViewPopupBakery(controller:IControllerPopup)
    {
        _sourceView = new gPopupBakery();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        _items = [];

        var buttonClose:IView = new ViewButton(controller, _sourceView.buttonClose);
        setButtonClose(buttonClose);

        _buttonImprove = new ViewButtonLabeled(controller, _sourceView.buttonImprove);
        _buttonLeft = new ViewButton(controller, _sourceView.buttonLeft);
        _buttonRight = new ViewButton(controller, _sourceView.buttonRight);
    }

    override public function addSubView(view:IView):void
    {
        _sourceView.itemsView.placeholder.addChild(view.sourceView);
        _items.push(view);
    }

    public override function placeViews(isFullscreen:Boolean):void
    {
        super.placeViews(isFullscreen);

        var itemStandard:IView = _items[0];

        var startPosition:Point = new Point(_sourceView.itemsView.width / 2 - itemStandard.sourceView.width / 2,
                _sourceView.itemsView.height / 2 - itemStandard.sourceView.height / 2);

        for each(var item:IView in _items)
        {
            item.placeViews(isFullscreen);

            item.sourceView.x = startPosition.x;
            item.sourceView.y = startPosition.y;

            startPosition.x += item.sourceView.width + 20;
        }
    }


    public function scrollLeft(onComplete:Function, count:uint = 1):void
    {
        var itemStandard:IView = _items[0];

        var params:Object =
        {
            x: _sourceView.itemsView.placeholder.x + (itemStandard.sourceView.width + 20) * count,
            onComplete: onComplete
        };

        TweenMax.to(_sourceView.itemsView.placeholder, 2, params);
    }


    public function scrollRight(onComplete:Function, count:uint = 1):void
    {
        var itemStandard:IView = _items[0];

        var params:Object =
        {
            x: _sourceView.itemsView.placeholder.x - (itemStandard.sourceView.width + 20) * count,
            onComplete: onComplete
        };

        TweenMax.to(_sourceView.itemsView.placeholder, 2, params);
    }


    public override function cleanup():void
    {
        _buttonImprove.cleanup();
        _buttonImprove = null;

        _buttonLeft.cleanup();
        _buttonLeft = null;

        _buttonRight.cleanup();
        _buttonRight = null;

        for each(var item:IView in _items)
        {
            item.cleanup();
            item = null;
        }
        _items = null;

        _sourceView = null;

        super.cleanup();
    }
}
}