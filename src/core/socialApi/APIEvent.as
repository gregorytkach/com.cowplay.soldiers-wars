package core.socialApi
{
	import flash.events.Event;
	/**
	 * ...
	 * @author me
	 */
	public class APIEvent extends Event
	{
		public static const GET_FRIENDS_SUCCESS		: String = "getFriendsSuccess";
		public static const GET_FRIENDS_FAIL		: String = "getFriendsFail";
		
		public var users		: Array;
		
		public function APIEvent(type: String, bubbles: Boolean = false, cancelable: Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}