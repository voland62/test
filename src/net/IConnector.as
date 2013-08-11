package net
{
	import com.netease.protobuf.Message;
	import flash.events.IEventDispatcher;

	/**
	 * @author Design3d
	 */
	public interface IConnector extends IEventDispatcher
	{
		function connect(url : String, port : int) : void;

		function send(message : com.netease.protobuf.Message, ...args) : void;
	}
}
