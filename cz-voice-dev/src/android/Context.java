package android.content;

import net.osmand.plus.OsmandApplication;


public class Context{
	public String getString(int s){
		return "UNKNOW STRING " + s;
	}
	public OsmandApplication getApplicationContext(){
		return new OsmandApplication();
	}

	public Resources getResources(){
		return new Resources();
	}

	public class Resources {
		public String getString(int s){
		        return "UNKNOW STRING " + s;
		}

	}
}
