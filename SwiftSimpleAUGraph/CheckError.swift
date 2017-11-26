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

// swiftlint:disable function_body_length

func CheckError(_ error: OSStatus) {
    if error == 0 {return}
    
    switch error {
        // AudioToolbox
    case kAUGraphErr_NodeNotFound:
        print("Error:kAUGraphErr_NodeNotFound")
        
    case kAUGraphErr_OutputNodeErr:
        print( "Error:kAUGraphErr_OutputNodeErr")
        
    case kAUGraphErr_InvalidConnection:
        print("Error:kAUGraphErr_InvalidConnection")
        
    case kAUGraphErr_CannotDoInCurrentContext:
        print( "Error:kAUGraphErr_CannotDoInCurrentContext")
        
    case kAUGraphErr_InvalidAudioUnit:
        print( "Error:kAUGraphErr_InvalidAudioUnit")
        
        //    case kMIDIInvalidClient :
        //        print( "kMIDIInvalidClient ")
        //
        //
        //    case kMIDIInvalidPort :
        //        print( "kMIDIInvalidPort ")
        //
        //
        //    case kMIDIWrongEndpointType :
        //        print( "kMIDIWrongEndpointType")
        //
        //
        //    case kMIDINoConnection :
        //        print( "kMIDINoConnection ")
        //
        //
        //    case kMIDIUnknownEndpoint :
        //        print( "kMIDIUnknownEndpoint ")
        //
        //
        //    case kMIDIUnknownProperty :
        //        print( "kMIDIUnknownProperty ")
        //
        //
        //    case kMIDIWrongPropertyType :
        //        print( "kMIDIWrongPropertyType ")
        //
        //
        //    case kMIDINoCurrentSetup :
        //        print( "kMIDINoCurrentSetup ")
        //
        //
        //    case kMIDIMessageSendErr :
        //        print( "kMIDIMessageSendErr ")
        //
        //
        //    case kMIDIServerStartErr :
        //        print( "kMIDIServerStartErr ")
        //
        //
        //    case kMIDISetupFormatErr :
        //        print( "kMIDISetupFormatErr ")
        //
        //
        //    case kMIDIWrongThread :
        //        print( "kMIDIWrongThread ")
        //
        //
        //    case kMIDIObjectNotFound :
        //        print( "kMIDIObjectNotFound ")
        //
        //
        //    case kMIDIIDNotUnique :
        //        print( "kMIDIIDNotUnique ")
        
        
    case kAudioToolboxErr_InvalidSequenceType :
        print( " kAudioToolboxErr_InvalidSequenceType")
        
    case kAudioToolboxErr_TrackIndexError :
        print( " kAudioToolboxErr_TrackIndexError")
        
    case kAudioToolboxErr_TrackNotFound :
        print( " kAudioToolboxErr_TrackNotFound")
        
    case kAudioToolboxErr_EndOfTrack :
        print( " kAudioToolboxErr_EndOfTrack")
        
    case kAudioToolboxErr_StartOfTrack :
        print( " kAudioToolboxErr_StartOfTrack")
        
    case kAudioToolboxErr_IllegalTrackDestination	:
        print( " kAudioToolboxErr_IllegalTrackDestination")
        
    case kAudioToolboxErr_NoSequence 		:
        print( " kAudioToolboxErr_NoSequence")
        
    case kAudioToolboxErr_InvalidEventType		:
        print( " kAudioToolboxErr_InvalidEventType")
        
    case kAudioToolboxErr_InvalidPlayerState	:
        print( " kAudioToolboxErr_InvalidPlayerState")
        
    case kAudioUnitErr_InvalidProperty		:
        print( " kAudioUnitErr_InvalidProperty")
        
    case kAudioUnitErr_InvalidParameter		:
        print( " kAudioUnitErr_InvalidParameter")
        
    case kAudioUnitErr_InvalidElement		:
        print( " kAudioUnitErr_InvalidElement")
        
    case kAudioUnitErr_NoConnection			:
        print( " kAudioUnitErr_NoConnection")
        
    case kAudioUnitErr_FailedInitialization		:
        print( " kAudioUnitErr_FailedInitialization")
        
    case kAudioUnitErr_TooManyFramesToProcess	:
        print( " kAudioUnitErr_TooManyFramesToProcess")
        
    case kAudioUnitErr_InvalidFile			:
        print( " kAudioUnitErr_InvalidFile")
        
    case kAudioUnitErr_FormatNotSupported		:
        print( " kAudioUnitErr_FormatNotSupported")
        
    case kAudioUnitErr_Uninitialized		:
        print( " kAudioUnitErr_Uninitialized")
        
    case kAudioUnitErr_InvalidScope			:
        print( " kAudioUnitErr_InvalidScope")
        
    case kAudioUnitErr_PropertyNotWritable		:
        print( " kAudioUnitErr_PropertyNotWritable")
        
    case kAudioUnitErr_InvalidPropertyValue		:
        print( " kAudioUnitErr_InvalidPropertyValue")
        
    case kAudioUnitErr_PropertyNotInUse		:
        print( " kAudioUnitErr_PropertyNotInUse")
        
    case kAudioUnitErr_Initialized			:
        print( " kAudioUnitErr_Initialized")
        
    case kAudioUnitErr_InvalidOfflineRender		:
        print( " kAudioUnitErr_InvalidOfflineRender")
        
    case kAudioUnitErr_Unauthorized			:
        print( " kAudioUnitErr_Unauthorized")
        
    default:
        print("huh?")
    }
}
 
