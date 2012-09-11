package net.osmand;

import net.osmand.plus.voice.CommandBuilder;
import net.osmand.plus.voice.CommandPlayer;

import net.osmand.plus.voice.*;
import net.osmand.plus.*;
import android.content.*;


public class ovid{

 public static void main(String[] args) throws net.osmand.plus.voice.CommandPlayerException{
	 String delim = "";
	 CommandPlayer p = new MediaCommandPlayerImpl(new Context(), new OsmandSettings(), "cz");
	 CommandBuilder builder;// = p.newCommandBuilder();
	 /*
	 builder.newRouteCalculated(15350);
	 builder.play();
*/


    builder = p.newCommandBuilder(); print( "New route was calculated (15350m)"); builder.newRouteCalculated(15350); builder.play(); print(delim); 

    builder = p.newCommandBuilder(); print( "After 1050m turn slightly left"); builder.turn(AbstractPrologCommandPlayer.A_LEFT_SL, 1050); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Turn left"); builder.turn(AbstractPrologCommandPlayer.A_LEFT); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Prepare to turn right after 320m"); builder.prepareTurn(AbstractPrologCommandPlayer.A_RIGHT, 320); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "After 370m turn sharply right"); builder.turn(AbstractPrologCommandPlayer.A_RIGHT_SH, 370); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Prepare to turn slighlty left after 850m then bear right"); builder.prepareTurn(AbstractPrologCommandPlayer.A_LEFT_SL, 850).then().bearRight(); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Turn sharply right then bear left"); builder.turn(AbstractPrologCommandPlayer.A_RIGHT_SH).then().bearLeft(); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Prepare to make a U-turn after 400m"); builder.prepareMakeUT(400); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "After 640m make a U-turn"); builder.makeUT(640); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Prepare to keep left after 370m"); builder.prepareTurn(AbstractPrologCommandPlayer.A_LEFT_KEEP, 370); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Keep left then after 400m keep right"); builder.turn(AbstractPrologCommandPlayer.A_LEFT_KEEP).then().turn(AbstractPrologCommandPlayer.A_RIGHT_KEEP, 400); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Make a U-turn"); builder.makeUT(); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "When possible, make a U-turn"); builder.makeUTwp(); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Prepare to enter a roundabout after 750m"); builder.prepareRoundAbout(750); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "After 450m enter the roundabout and take the 1st exit"); builder.roundAbout(450, 0, 1); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Roundabout: Take the 3rd exit"); builder.roundAbout(0, 3); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "GPS signal lost"); builder.gpsLocationLost(); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Route recalculated (23150m)"); builder.routeRecalculated(23150); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Continue straight ahead"); builder.goAhead(); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Follow the road for 2350m"); builder.goAhead(2350); builder.play(); print(delim);

    builder = p.newCommandBuilder(); print( "Follow the road for 800m and arrive at destination"); builder.goAhead(800).andArriveAtDestination(); builder.play(); print(delim);

/***************************************/
 }

 private static void print(String s){
	 System.out.println(s);
 }


}
