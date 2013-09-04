package core.socialApi.mailru.api
{

import flash.events.*;
import flash.net.*;

import mailru.api.serialization.json.*;

public class DataProvider
{

    //! идентификатор приложения;
    private var _api_id:Number;
    private var _api_secret:String;
    private var _viewer_id:String;
    private var _api_url:String = "http://www.appsmail.ru/platform/api?";
    private var _global_options:Object;


    public function DataProvider(url:String, api_id:Number, api_secret:String, viewer_id:String)
    {
        /**
         * method - имя метода API который нужно вызвать;
         * sig - подпись запроса;
         */
        _api_id = api_id;
        _api_secret = api_secret;
        _viewer_id = viewer_id;
        _api_url = url;
    }

    public function setup(options:Object):void
    {
        _global_options = options;
    }

    public function request(method:String, options:Object = null):void
    {
        var onComplete:Function, onError:Function;

        if (options == null)
        {
            options = {};
        }

        options.onComplete = options.onComplete ? options.onComplete : (_global_options.onComplete ? _global_options.onComplete : null);
        options.onError = options.onError ? options.onError : (_global_options.onError ? _global_options.onError : null);
        _sendRequest(method, options);
    }


    /********************
     * Private methods
     ********************/

    private function _sendRequest(method:String, options:Object):void
    {
        var self:Object = this;

        var request_params:Object = {method: method};
        request_params.api_id = _api_id;

        //request_params.format = "json";
        if (options.params)
        {
            for (var i:String in options.params)
            {
                request_params[i] = options.params[i];
            }
        }

        var variables:URLVariables = new URLVariables();

        for (var j:String in request_params)
        {
            variables[j] = request_params[j];
        }
        variables['sig'] = _generate_signature(request_params);

        var request:URLRequest = new URLRequest();
        request.url = _api_url;
        request.method = URLRequestMethod.GET;
        request.data = variables;
        trace(variables);
        var loader:URLLoader = new URLLoader();
        loader.dataFormat = URLLoaderDataFormat.TEXT;
        if (options.onError)
        {
            loader.addEventListener(IOErrorEvent.IO_ERROR, function ():void
            {
                options.onError("Connection error occured");
            });
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function ():void
            {
                options.onError("Security error occured");
            });
        }

        loader.addEventListener(Event.COMPLETE, function (e:Event):void
        {
            var loader:URLLoader = URLLoader(e.target);
            trace(loader.data);
            var data:Object = JSON.decode(loader.data);
            if (data.error)
            {
                options.onError(data.error);
            }
            else if (options.onComplete && data)
            {
                options.onComplete(data);
            }
        });
        trace(request.url);
        try
        {

            loader.load(request);
        }
        catch (error:Error)
        {
            options.onError(error);
        }
    }

    /**
     * Generates signature
     *
     */
    private function _generate_signature(request_params:Object):String
    {
        var signature:String = "";

        var sorted_array:Array = [];
        for (var key:String in request_params)
        {
            sorted_array.push(key + "=" + request_params.[key]);
        }
        sorted_array.sort();

        // Note: make sure that the signature parameter is not already included in
        //       request_params array.
        for (key in sorted_array)
        {
            signature += sorted_array[key];
        }
        if (_viewer_id.length > 0) signature = _viewer_id.toString() + signature;
        signature += _api_secret;

        return MD5.encrypt(signature);
    }
}
}