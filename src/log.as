package
{
	import flash.utils.getTimer;
	/**
	 * @author Andrew  
	 */
	public function log(...args) : void
	{
		var time : String = (getTimer() / 1000).toFixed(2);
		args.unshift("[" + time + "]");
		//trace.apply(null, args);
	}

}
