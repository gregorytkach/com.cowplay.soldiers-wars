package core.socialApi.ok.odnoklassniki.sdk.errors
{
	/**
	 * ...
	 * @author Igor Nemenonok
	 */
	public class Errors 
	{
		
		public static function showError(s:String):void 
		{
			throw new Error(s);
		}
		
	}

}