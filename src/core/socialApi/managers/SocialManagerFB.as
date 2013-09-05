package core.socialApi.managers
{
import core.socialApi.*;

import com.facebook.graph.Facebook;

import core.Debug;
import core.socialApi.info.SocialUserInfo;

import flash.events.TimerEvent;
import flash.utils.Timer;

import mx.utils.StringUtil;

/**
 * ...
 * @author me
 */
public class SocialManagerFB extends SocialManagerBase
{

    private var _callback:Function;
    private var _callbackError:Function;

    private var _timerLogin:Timer;
    private var _needLoginAgain:Boolean;

    /*
     * Properties
     */

    public override function get type():ESocialNetworkType
    {
        return ESocialNetworkType.ESNT_FB;
    }

    /*
     * Methods
     */


    //! Default constructor
    public function SocialManagerFB(onComplete:Function, onError:Function)
    {
        super(onComplete, onError);

        _callback = onComplete;
        _callbackError = onError;

        Facebook.init(ConstantsSocial.FB_APP_ID, onInitComplete);
    }

    private function onInitComplete(response:Object, fail:Object):void
    {
        if (response)
        { //already logged in because of existing session

            getMyInfo();
        }
        else
        {

//                var options:Object = {perms:"publish_stream"};

            _needLoginAgain = true;

            _timerLogin = new Timer(1000);
            _timerLogin.addEventListener(TimerEvent.TIMER, tryLogin);
            _timerLogin.start();
        }
    }

    private function tryLogin(e:TimerEvent):void
    {
        if (!_needLoginAgain)
            return;

        _needLoginAgain = false;

        Facebook.login(onLoginComplete, null);
    }

    private function onLoginComplete(response:Object, fail:Object):void
    {
        if (response)
        {
            _needLoginAgain = false;

            _timerLogin.stop();
            _timerLogin.removeEventListener(TimerEvent.TIMER, tryLogin);
            _timerLogin = null;

            getMyInfo();
        }
        else
        {
            _needLoginAgain = true;
        }
    }

    private function getMyInfo():void
    {
        Facebook.api('/me', onMyInfoComplete, {fields: "id, first_name, last_name, picture"});
    }


    private function onMyInfoComplete(response:Object, fail:Object):void
    {
        if (!response || !(response is Object))
        {
            callErrorFunction();
            return;
        }

        _userInfo = parseUserInfo(response);

        if (!_userInfo)
        {
            callErrorFunction();
            return;
        }

//        _userId = _userInfo.id;


        {//get friends info
            Facebook.api('/me/friends', onFriendsInfoComplete, {fields: "id, first_name, last_name, picture, installed"});
        }
    }

    private function onFriendsInfoComplete(response:Object, fail:Object):void
    {
        var list:Array = parseFriendsInfo(response as Object);

        if (!list)
        {
            callErrorFunction();
            return;
        }

        _friendsListAll = [];

        for (var i:int = 0; i < list.length; i++)
        {
            if ((list[i] as SocialUserInfo).installed)
                _friendsListAll.push(list[i]);

            list[i].loadPicture();
        }

        _friendsListAll = _friendsListAll.slice(0, 100);

        callCompleteFunction();
    }

    private function parseFriendsInfo(friendsInfoObj:Object):Array
    {
        var result:Array = null;

        if (!friendsInfoObj || !(friendsInfoObj is Array))
            return result;

        var friendsInfo:Array = friendsInfoObj as Array;

        result = [];

        for (var i:int = 0; i < friendsInfo.length; i++)
            result.push(parseUserInfo(friendsInfo[i]));

        return result;
    }


    private static function parseUserInfo(info:Object):SocialUserInfo
    {
        var result:SocialUserInfo = null;

        if (info)
        {
            result = new SocialUserInfo();
            result.firstName = info.first_name as String;
            result.id = info.id as String;
            result.lastName = info.last_name as String;
            result.urlPicture = info.picture ? (info.picture.data ? info.picture.data.url as String : null) : null;
            result.installed = info.installed ? true : false;
        }

        return result;
    }

    private function callCompleteFunction():void
    {
        if (_callback != null)
            _callback();
    }

    private function callErrorFunction():void
    {
        if (_callbackError != null)
            _callbackError();
    }


    public function socialUserInfo():SocialUserInfo
    {
        return _userInfo;
    }


    public override function inviteFriends(callback:Function):void
    {
        Facebook.ui("apprequests", { message: "Invite friends" }, onShowInviteFriendsWindowComplete);
    }

    private function onShowInviteFriendsWindowComplete(resp:*):void
    {
    }

    public function getTotalFriends(uid:String = "", count:int = 0, offset:int = 0):void
    {
        Facebook.api('/me/friends', totalFriendsComplete, {fields: "id, first_name, last_name, picture"});
    }

    private function totalFriendsComplete(response:Object, fail:Object):void
    {
        var arrFriends:Array;
        var event:APIEvent;

        arrFriends = parseFriendsInfo(response as Object);
        if (!arrFriends)
        {
            Debug.assert(false, "TODO: implement");
//            _apiConnector.dispatchEvent(new APIEvent(APIEvent.GET_FRIENDS_FAIL));
            return;
        }

        event = new APIEvent(APIEvent.GET_FRIENDS_SUCCESS);
        event.users = arrFriends;

        //TODO: implement
        Debug.assert(false, "TODO: implement");
//        dispatchEvent(event);
    }

    public override function postToWall(callback:Function, text:String, urlPic:String, title:String = "", urlLink:String = ""):void
    {
        var param:Object =
        {
            link: urlLink,
            picture: urlPic,
            name: ConstantsSocial.SOCIAL_APPLICATION_NAME,
            caption: title,
            description: text
        };

        Facebook.ui("feed", param, onPostToWallComplete);
    }

    private function onPostToWallComplete(response:*):void
    {
    }

    public override function transferVotes(money:Number, votes:Number, onComplete:Function, onError:Function):void
    {
        var productLink:String = StringUtil.substitute("http://www.tolenica.com/gremlins/og/currency_euro_pack_{0}.html", money);

        var param:Object =
        {
            action: "purchaseitem",
            product: productLink
        };

        _callback = onComplete;
        _callbackError = onError;

        Facebook.ui("pay", param, onTransferVoteComplete);
    }

    private function onTransferVoteComplete(response:*):void
    {
        if (response.error_code)
        {
            if (_callbackError != null)
                _callbackError();
        }
        else  //purchasing success
        {
            if (_callback != null)
                _callback();
        }
    }
}
}