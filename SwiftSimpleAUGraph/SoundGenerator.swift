//
//  SoundGenerator.swift
//  SwiftSimpleAUGraph
//
//  Created by Gene De Lisa on 6/8/14.
//  Copyright (c) 2014 Gene De Lisa. All rights reserved.
//

import Foundation
import AudioToolbox
//import AVFoundation
//import CoreAudio

class SoundGenerator : NSObject {
    var processingGraph:AUGraph
    var samplerNode:AUNode
    var ioNode:AUNode
    var samplerUnit:AudioUnit
    var ioUnit:AudioUnit
    var isPlaying:Bool
    
    init() {
        self.processingGraph = AUGraph()
        self.samplerNode = AUNode()
        self.ioNode = AUNode()
        self.samplerUnit  = AudioUnit()
        self.ioUnit  = AudioUnit()
        self.isPlaying = false
        super.init()
        
        augraphSetup()
        graphStart()
    }
    
    
    func augraphSetup() {
        var status : OSStatus = 0
        status = NewAUGraph(&processingGraph)
        CheckError(status)
        
        // create the sampler
        // for now, just have it play the default sine tone
        //https://developer.apple.com/library/prerelease/ios/documentation/AudioUnit/Reference/AudioComponentServicesReference/index.html#//apple_ref/swift/struct/AudioComponentDescription
        
        
        var cd:AudioComponentDescription = AudioComponentDescription(componentType: OSType(kAudioUnitType_MusicDevice),componentSubType: OSType(kAudioUnitSubType_Sampler),componentManufacturer: OSType(kAudioUnitManufacturer_Apple),componentFlags: 0,componentFlagsMask: 0)
        status = AUGraphAddNode(self.processingGraph, &cd, &samplerNode)
        CheckError(status)
        
        var ioUnitDescription:AudioComponentDescription = AudioComponentDescription(componentType: OSType(kAudioUnitType_Output),componentSubType: OSType(kAudioUnitSubType_RemoteIO),componentManufacturer: OSType(kAudioUnitManufacturer_Apple),componentFlags: 0,componentFlagsMask: 0)
        status = AUGraphAddNode(self.processingGraph, &ioUnitDescription, &ioNode)
        CheckError(status)
        
        // now do the wiring. The graph needs to be open before you call AUGraphNodeInfo
        status = AUGraphOpen(self.processingGraph)
        CheckError(status)
        status = AUGraphNodeInfo(self.processingGraph, self.samplerNode, nil, &samplerUnit)
        CheckError(status)
        status = AUGraphNodeInfo(self.processingGraph, self.ioNode, nil, &ioUnit)
        CheckError(status)
        
        var ioUnitOutputElement:AudioUnitElement = 0
        var samplerOutputElement:AudioUnitElement = 0
        status = AUGraphConnectNodeInput(self.processingGraph,
            self.samplerNode, samplerOutputElement, // srcnode, inSourceOutputNumber
            self.ioNode, ioUnitOutputElement) // destnode, inDestInputNumber
        CheckError(status)
    }
    
    func graphStart() {
        //https://developer.apple.com/library/prerelease/ios/documentation/AudioToolbox/Reference/AUGraphServicesReference/index.html#//apple_ref/c/func/AUGraphIsInitialized
        
        var status : OSStatus = OSStatus(noErr)
        var outIsInitialized:Boolean = 0
        status = AUGraphIsInitialized(self.processingGraph, &outIsInitialized)
        println("isinit status is \(status)")
        println("bool is \(outIsInitialized)")
        if outIsInitialized == 0 {
            status = AUGraphInitialize(self.processingGraph)
            CheckError(status)
        }
        
        var isRunning:Boolean = 0
        AUGraphIsRunning(self.processingGraph, &isRunning)
        println("running bool is \(isRunning)")
        if isRunning == 0 {
            status = AUGraphStart(self.processingGraph)
            CheckError(status)
        }
        
        self.isPlaying = true;
    }
    
    func playNoteOn(noteNum:UInt32, velocity:UInt32)    {
        var noteCommand:UInt32 = 0x90 | 0;
        var status : OSStatus = OSStatus(noErr)
        status = MusicDeviceMIDIEvent(self.samplerUnit, noteCommand, noteNum, velocity, 0)
        CheckError(status)
        println("noteon status is \(status)")
    }
    
    func playNoteOff(noteNum:UInt32)    {
        var noteCommand:UInt32 = 0x80 | 0;
        var status : OSStatus = OSStatus(noErr)
        status = MusicDeviceMIDIEvent(self.samplerUnit, noteCommand, noteNum, 0, 0)
        CheckError(status)
        println("noteoff status is \(status)")
    }
}
