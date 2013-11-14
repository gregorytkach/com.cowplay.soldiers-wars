/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/19/13
 * Time: 8:54 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesGame.barracks
{
import soldiers.models.housesGame.base.HouseGLevelInfo;

public class HouseGLevelInfoBarracks extends HouseGLevelInfo
{
    /*
     * Fields
     */
    private var _soldierGeneration:uint;

    /*
     * Properties
     */


    public function get soldierGeneration():uint
    {
        return _soldierGeneration;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseGLevelInfoBarracks()
    {
        init();
    }

    private function init():void
    {

    }

    /*
     * ISerializable
     */

    public override function deserialize(data:Object):void
    {
        super.deserialize(data);

        Debug.assert(data.hasOwnProperty("soldiers_generation"));

        _soldierGeneration = data["soldiers_generation"];
    }
}
}
