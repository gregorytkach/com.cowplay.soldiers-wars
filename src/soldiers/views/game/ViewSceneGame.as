/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/19/13
 * Time: 9:57 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game
{
import controllers.IController;

import flash.display.Bitmap;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Point;

import soldiers.GameInfo;
import soldiers.views.game.grid.ViewGrid;

import views.EViewPosition;
import views.IView;
import views.IViewScroll;
import views.implementations.ViewBase;
import views.implementations.ViewScroll;

public class ViewSceneGame extends ViewBase
{
    /*
     * Fields
     */
    private var _source:DisplayObjectContainer;
    private var _background:IView;

    private var _viewScrollGrid:IViewScroll;
    private var _viewGrid:ViewGrid;

    private var _needPlaceContainers:Boolean;

    /*
     * Properties
     */


    public function get viewScrollGrid():IViewScroll
    {
        return _viewScrollGrid;
    }

    public function get viewGrid():ViewGrid
    {
        return _viewGrid;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ViewSceneGame(controller:IController)
    {
        _source = new Sprite();
        super(controller, _source);

        init();
    }

    private function init():void
    {
        _needPlaceContainers = true;

        var bg:Bitmap = new Bitmap(new gLevelBackground1());
        var bgSource:Sprite = new Sprite();
        bgSource.addChild(bg);

        _background = new ViewBase(controller, bgSource);
        _source.addChild(_background.source);

        _background.position = EViewPosition.EVP_ABSOLUTE;

        _viewGrid = new ViewGrid(controller);
        _viewGrid.handleEvents(false);
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        if (_needPlaceContainers)
        {
            _needPlaceContainers = false;
            _viewGrid.placeViews(fullscreen);
        }

        var appSize:Point = GameInfo.instance.managerApp.applicationSize;

        _viewGrid.source.x = 0;
        _viewGrid.source.y = 0;

        _background.translate(0.5, 0.5);

        if (_viewScrollGrid != null)
        {
            _source.removeChild(_viewScrollGrid.source);
            _viewScrollGrid.cleanup();
            _viewScrollGrid = null;
        }

        if (_viewGrid.source.width > appSize.x || _viewGrid.source.height > appSize.y)
        {
            _viewScrollGrid = new ViewScroll(controller, _viewGrid.source, appSize);
            _source.addChild(_viewScrollGrid.source);

            _viewScrollGrid.scrollTo(0.5, 0.5);

            trace(_viewGrid.source.width);
            trace(_viewGrid.source.height);
        }
        else
        {
            _source.addChild(_viewGrid.source);

            _viewGrid.position = EViewPosition.EVP_ABSOLUTE;
            _viewGrid.translate(0.5, 0.5);
        }
    }

    public override function cleanup():void
    {
        if (_viewScrollGrid != null)
        {
            _viewScrollGrid.cleanup();
            _viewScrollGrid = null;
        }

        _background.cleanup();
        _background = null;

        super.cleanup();
    }
}
}
