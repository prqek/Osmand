package net.osmand.plus;

import java.io.File;
import android.content.Context;

import net.osmand.LogUtil;
import org.apache.commons.logging.Log;


public class OsmandSettings {

	private static final Log log = LogUtil
		            .getLog(OsmandSettings.class);

	public File extendOsmandPath(String s){
		return new File(s);
	}
/*
	public final OsmandPreference<MetricsConstants> METRIC_SYSTEM = new EnumIntPreference<MetricsConstants>(
			            "default_metric_system", MetricsConstants.KILOMETERS_AND_METERS, MetricsConstants.values()).makeGlobal().cache();
*/

	public class METRIC_SYSTEM_class{
		public MetricsConstants get(){
			return MetricsConstants.KILOMETERS_AND_METERS;
		}
	}
	
	public METRIC_SYSTEM_class METRIC_SYSTEM = new METRIC_SYSTEM_class();

	public class AUDIO_STREAM_GUIDANCE_class{
		public int get(){
			return -1;
		}
	}

	public AUDIO_STREAM_GUIDANCE_class AUDIO_STREAM_GUIDANCE = new AUDIO_STREAM_GUIDANCE_class();


	public enum MetricsConstants {
		KILOMETERS_AND_METERS(R.string.si_km_m,"km-m"),
		MILES_AND_FOOTS(R.string.si_mi_foots,"mi-f"),
		MILES_AND_YARDS(R.string.si_mi_yard,"mi-y");

		private final int key;
		private final String ttsString;

		MetricsConstants(int key, String ttsString) {
			this.key = key;
			this.ttsString = ttsString;
		}

		public String toHumanString(Context ctx){
			return ctx.getResources().getString(key);
		}

		public String toTTSString(){
			return ttsString;
		}

	}
}
