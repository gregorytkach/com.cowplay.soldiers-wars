/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 6/14/13
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.housesG.smithy
{
public class HouseGSmithy extends HouseInfoG
{
    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseGType.EHGT_SMITHY;
    }

    /*
     * Methods
     */

    public function HouseGSmithy()
    {
    }
}
}