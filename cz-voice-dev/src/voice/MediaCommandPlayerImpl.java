package net.osmand.plus.voice;


import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import net.osmand.LogUtil;
import net.osmand.plus.OsmandSettings;

import org.apache.commons.logging.Log;

import android.content.Context;
import android.media.MediaPlayer;

/**
 * That class represents command player. 
 * It gets commands from input, analyze what files should be played and play 
 * them using media player 
 */
public class MediaCommandPlayerImpl extends AbstractPrologCommandPlayer {
	
	private static final String CONFIG_FILE = "_config.p";
	private static final int[] MEDIA_VOICE_VERSION = new int[] { 0 }; // MUST BE SORTED, list of supported versions

	private static final Log log = LogUtil.getLog(MediaCommandPlayerImpl.class);
	
	// playing media
	private MediaPlayer mediaPlayer;
	// indicates that player is ready to play first file
	private volatile boolean playNext = true;
	private List<String> filesToPlay = Collections.synchronizedList(new ArrayList<String>());
	private int streamType;

	
	public MediaCommandPlayerImpl(Context ctx, OsmandSettings settings, String voiceProvider)
		throws CommandPlayerException
	{
		super(ctx, settings, voiceProvider, CONFIG_FILE, MEDIA_VOICE_VERSION);
		mediaPlayer = new MediaPlayer();
		this.streamType = settings.AUDIO_STREAM_GUIDANCE.get();  
		mediaPlayer.setAudioStreamType(streamType);
	}
	
	@Override
	public void updateAudioStream(int streamType) {
		this.streamType = streamType;
	}
	
	@Override
	public void clear() {
		super.clear();
		mediaPlayer = null;
	}
	
	@Override
	public String[] getLibraries() {
		return new String[] { "alice.tuprolog.lib.BasicLibrary"};
	}
	
	@Override
	public void playCommands(CommandBuilder builder){
		filesToPlay.addAll(builder.execute());
		playQueue();
	}
	
	private synchronized void playQueue() {
		System.out.print("play: ");
		while (!filesToPlay.isEmpty() && playNext) {
			String f = filesToPlay.remove(0);
			if (f != null && voiceDir != null) {
				boolean exists = false;
//				if(voiceZipFile != null){
//					ZipEntry entry = voiceZipFile.getEntry(f);
//					exists = entry != null;
//					voiceZipFile.getInputStream(entry);
//					
//				} else {
					File file = new File(voiceDir, f);
					exists = file.exists();
//				}
				System.out.print(f + " ");
				/*
				if (exists) {
					log.debug("Playing file : " + f); //$NON-NLS-1$
					playNext = false;
					try {
						// Can't play sound file from zip it seams to be impossible only unpack and play!!!
						mediaPlayer.setDataSource(file.getAbsolutePath());
						mediaPlayer.prepare();
						mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
							@Override
							public void onCompletion(MediaPlayer mp) {
								mp.release();
								mediaPlayer = new MediaPlayer();
								mediaPlayer.setAudioStreamType(streamType);
								int sleep = 60;
								boolean delay = true;
								while (!filesToPlay.isEmpty() && delay) {
									delay = filesToPlay.get(0).startsWith(DELAY_CONST);
									if (delay) {
										String s = filesToPlay.remove(0).substring(DELAY_CONST.length());
										try {
											sleep += Integer.parseInt(s);
										} catch (NumberFormatException e) {
										}
									}
								}
								try {
									Thread.sleep(sleep);
								} catch (InterruptedException e) {
								}
								playNext = true;
								playQueue();
							}
						});
						
						mediaPlayer.start();
					} catch (Exception e) {
						log.error("Error while playing voice command", e); //$NON-NLS-1$
						playNext = true;
						
					}
				} else {
					log.info("Play file not found : " + f); //$NON-NLS-1$
				}*/
			} 
		}
		System.out.println("");
	}
	
	public static boolean isMyData(File voiceDir) {
		return new File(voiceDir, CONFIG_FILE).exists();
	}
}
