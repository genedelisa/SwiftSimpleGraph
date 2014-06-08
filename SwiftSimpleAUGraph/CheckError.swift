//
//  CheckError.swift
//  SwiftSimpleAUGraph
//
//  Created by Gene De Lisa on 6/8/14.
//  Copyright (c) 2014 Gene De Lisa. All rights reserved.
//

import Foundation
import AudioToolbox
import AVFoundation
import CoreAudio

func CheckError(error:OSStatus) {
    if error == 0 {return}
    
    switch(Int(error)) {
        // AudioToolbox
    case kAUGraphErr_NodeNotFound:
        println("Error:kAUGraphErr_NodeNotFound \n");
        
    case kAUGraphErr_OutputNodeErr:
        println( "Error:kAUGraphErr_OutputNodeErr \n");
        
    case kAUGraphErr_InvalidConnection:
        println("Error:kAUGraphErr_InvalidConnection \n");
        
    case kAUGraphErr_CannotDoInCurrentContext:
        println( "Error:kAUGraphErr_CannotDoInCurrentContext \n");
        
    case kAUGraphErr_InvalidAudioUnit:
        println( "Error:kAUGraphErr_InvalidAudioUnit \n");
        
        //    case kMIDIInvalidClient :
        //        println( "kMIDIInvalidClient ");
        //
        //
        //    case kMIDIInvalidPort :
        //        println( "kMIDIInvalidPort ");
        //
        //
        //    case kMIDIWrongEndpointType :
        //        println( "kMIDIWrongEndpointType");
        //
        //
        //    case kMIDINoConnection :
        //        println( "kMIDINoConnection ");
        //
        //
        //    case kMIDIUnknownEndpoint :
        //        println( "kMIDIUnknownEndpoint ");
        //
        //
        //    case kMIDIUnknownProperty :
        //        println( "kMIDIUnknownProperty ");
        //
        //
        //    case kMIDIWrongPropertyType :
        //        println( "kMIDIWrongPropertyType ");
        //
        //
        //    case kMIDINoCurrentSetup :
        //        println( "kMIDINoCurrentSetup ");
        //
        //
        //    case kMIDIMessageSendErr :
        //        println( "kMIDIMessageSendErr ");
        //
        //
        //    case kMIDIServerStartErr :
        //        println( "kMIDIServerStartErr ");
        //
        //
        //    case kMIDISetupFormatErr :
        //        println( "kMIDISetupFormatErr ");
        //
        //
        //    case kMIDIWrongThread :
        //        println( "kMIDIWrongThread ");
        //
        //
        //    case kMIDIObjectNotFound :
        //        println( "kMIDIObjectNotFound ");
        //
        //
        //    case kMIDIIDNotUnique :
        //        println( "kMIDIIDNotUnique ");
        
        
    case kAudioToolboxErr_InvalidSequenceType :
        println( " kAudioToolboxErr_InvalidSequenceType ");
        
    case kAudioToolboxErr_TrackIndexError :
        println( " kAudioToolboxErr_TrackIndexError ");
        
    case kAudioToolboxErr_TrackNotFound :
        println( " kAudioToolboxErr_TrackNotFound ");
        
    case kAudioToolboxErr_EndOfTrack :
        println( " kAudioToolboxErr_EndOfTrack ");
        
    case kAudioToolboxErr_StartOfTrack :
        println( " kAudioToolboxErr_StartOfTrack ");
        
    case kAudioToolboxErr_IllegalTrackDestination	:
        println( " kAudioToolboxErr_IllegalTrackDestination");
        
    case kAudioToolboxErr_NoSequence 		:
        println( " kAudioToolboxErr_NoSequence ");
        
    case kAudioToolboxErr_InvalidEventType		:
        println( " kAudioToolboxErr_InvalidEventType");
        
    case kAudioToolboxErr_InvalidPlayerState	:
        println( " kAudioToolboxErr_InvalidPlayerState");
        
    case kAudioUnitErr_InvalidProperty		:
        println( " kAudioUnitErr_InvalidProperty");
        
    case kAudioUnitErr_InvalidParameter		:
        println( " kAudioUnitErr_InvalidParameter");
        
    case kAudioUnitErr_InvalidElement		:
        println( " kAudioUnitErr_InvalidElement");
        
    case kAudioUnitErr_NoConnection			:
        println( " kAudioUnitErr_NoConnection");
        
    case kAudioUnitErr_FailedInitialization		:
        println( " kAudioUnitErr_FailedInitialization");
        
    case kAudioUnitErr_TooManyFramesToProcess	:
        println( " kAudioUnitErr_TooManyFramesToProcess");
        
    case kAudioUnitErr_InvalidFile			:
        println( " kAudioUnitErr_InvalidFile");
        
    case kAudioUnitErr_FormatNotSupported		:
        println( " kAudioUnitErr_FormatNotSupported");
        
    case kAudioUnitErr_Uninitialized		:
        println( " kAudioUnitErr_Uninitialized");
        
    case kAudioUnitErr_InvalidScope			:
        println( " kAudioUnitErr_InvalidScope");
        
    case kAudioUnitErr_PropertyNotWritable		:
        println( " kAudioUnitErr_PropertyNotWritable");
        
    case kAudioUnitErr_InvalidPropertyValue		:
        println( " kAudioUnitErr_InvalidPropertyValue");
        
    case kAudioUnitErr_PropertyNotInUse		:
        println( " kAudioUnitErr_PropertyNotInUse");
        
    case kAudioUnitErr_Initialized			:
        println( " kAudioUnitErr_Initialized");
        
    case kAudioUnitErr_InvalidOfflineRender		:
        println( " kAudioUnitErr_InvalidOfflineRender");
        
    case kAudioUnitErr_Unauthorized			:
        println( " kAudioUnitErr_Unauthorized");
        
    default:
        println("huh?")
    }
}
 