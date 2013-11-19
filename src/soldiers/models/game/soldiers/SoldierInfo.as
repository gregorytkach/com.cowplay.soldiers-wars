/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 5/29/13
 * Time: 7:02 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.soldiers
{
import com.greensock.TweenLite;
import com.greensock.TweenMax;

import controllers.IController;

import controls.IView;

import core.DisposableObject;

import models.interfaces.players.IPlayerInfo;

import soldiers.models.housesGame.base.HouseG;

public class SoldierInfo extends DisposableObject implements IDisposable
{
    private var _houseOwnerPlayer:IPlayerInfo;
    private var _houseOwnerType:String;
    private var _houseTarget:HouseG;

    private var _level:uint;
    private var _levelMax:uint;

    private var _soldierRotation:ESoldierRotation;
    private var _path:Array;

    private var _controller:IController;


    /*
     * Properties
     */
    public function get houseOwnerPlayer():IPlayerInfo
    {
        return _houseOwnerPlayer;
    }

    public function get houseOwnerType():String
    {
        return _houseOwnerType;
    }

    public function get houseTarget():HouseG
    {
        return _houseTarget;
    }

    public function get level():uint
    {
        return _level;
    }

    public function get soldierRotation():ESoldierRotation
    {
        return _soldierRotation;
    }


    public function set soldierRotation(value:ESoldierRotation):void
    {
        if (_soldierRotation == value)
            return;

        _soldierRotation = value;
    }

    public function get controller():IController
    {
        return _controller;
    }

    public function set controller(value:IController):void
    {
        if (_controller == value)
            return;

        _controller = value;
    }

    public function get damage():int
    {
        return 1;
    }


    public function get speed():Number
    {
        return 2;
    }


    public function get path():Array
    {
        return _path;
    }


    public function get levelMax():uint
    {
        return _levelMax;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function SoldierInfo(owner:HouseG, target:HouseG, path:Array)
    {
        Debug.assert(owner != null);
        Debug.assert(target != null);
        Debug.assert(target != owner);
        Debug.assert(path != null);
        Debug.assert(path.length > 1);

        _path = path;
        _houseOwnerType = owner.ownerType;
        _level = owner.level;
        _levelMax = owner.houseConfig.levelMax;
        _houseTarget = target;
        _houseOwnerPlayer = owner.owner;


    }


    /*
     *  IDisposable
     */

    public override function cleanup():void
    {
        _path.length = 0;
        _controller = null;

        super.cleanup();
    }
}
}
