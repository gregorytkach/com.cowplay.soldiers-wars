package core.socialApi.Info
{
import core.Debug;

import flash.display.Loader;
import flash.events.IOErrorEvent;
import flash.net.URLRequest;

public class SocialUserInfo
{
    /*
     * Fields
     */

    public var id:String;
    public var lastName:String;
    public var firstName:String;
    public var picUrl:String;
    public var installed:Boolean;
    public var pic:Loader;

    /*
     * Methods
     */

    //! Default constructor
    public function SocialUserInfo()
    {

    }

    public function loadPicture():void
    {
        if (!picUrl || picUrl == "")
            return;

        pic = new Loader();
        pic.load(new URLRequest(picUrl));
        pic.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadPicError);
    }

    private static function onLoadPicError(e:IOErrorEvent):void
    {
        Debug.assert(false, e.toString());
    }
}

}