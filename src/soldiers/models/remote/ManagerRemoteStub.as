/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/30/13
 * Time: 11:20 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.remote
{

import bwf.models.proxy.IManagerProxy;

import models.implementations.remote.ManagerRemoteBase;

public class ManagerRemoteStub extends ManagerRemoteBase
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
    public function ManagerRemoteStub(serverURL:String, proxy:IManagerProxy)
    {
        super("http://google.com", proxy);
    }

    public override function update(type:String, data:Object, onComplete:Function = null):void
    {
        if (onComplete != null)
            onComplete(null);
    }
}
}
