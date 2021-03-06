/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/19/13
 * Time: 8:52 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesGame.base
{
import core.DisposableObject;

import flash.geom.Point;

import serialization.ISerializable;

public class HouseGLevelInfo extends DisposableObject implements ISerializable
{
    /*
     * Fields
     */
    private var _level:uint;
    private var _soldiersMax:uint;

    /*
     * Properties
     */


    public function get level():uint
    {
        return _level;
    }

    public function get soldiersMax():uint
    {
        return _soldiersMax;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseGLevelInfo()
    {
        super(false);

        init();
    }

    private function init():void
    {

    }

    /*
     *  ISerializable
     */


    public function serialize():Object
    {
        return null;
    }

    public function deserialize(data:Object):void
    {
        Debug.assert(data.hasOwnProperty("soldiers_max"));
        Debug.assert(data.hasOwnProperty("level"));

        _level = data["level"];
        _soldiersMax = data["soldiers_max"];
    }

}
}
