//
//  SoundGenerator.swift
//  SwiftSimpleAUGraph
//
//  Created by Gene De Lisa on 6/8/14.
//  Copyright (c) 2014 Gene De Lisa. All rights reserved.
//

import Foundation
import AudioToolbox


class SoundGenerator : NSObject {
    var processingGraph:AUGraph
    var samplerNode:AUNode
    var ioNode:AUNode
    var samplerUnit:AudioUnit
    var ioUnit:AudioUnit
    var isPlaying:Bool
    
    override init() {
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
        var status = OSStatus(noErr)
        status = NewAUGraph(&processingGraph)
        CheckError(status)
        
        // create the sampler
        // for now, just have it play the default sine tone
        //https://developer.apple.com/library/prerelease/ios/documentation/AudioUnit/Reference/AudioComponentServicesReference/index.html#//apple_ref/swift/struct/AudioComponentDescription
        
        
        var cd = AudioComponentDescription(componentType: OSType(kAudioUnitType_MusicDevice),
            componentSubType: OSType(kAudioUnitSubType_Sampler),
            componentManufacturer: OSType(kAudioUnitManufacturer_Apple),
            componentFlags: 0,componentFlagsMask: 0)
        status = AUGraphAddNode(self.processingGraph, &cd, &samplerNode)
        CheckError(status)
        
        var ioUnitDescription = AudioComponentDescription(componentType: OSType(kAudioUnitType_Output),
            componentSubType: OSType(kAudioUnitSubType_RemoteIO),
            componentManufacturer: OSType(kAudioUnitManufacturer_Apple),
            componentFlags: 0,componentFlagsMask: 0)
        status = AUGraphAddNode(self.processingGraph, &ioUnitDescription, &ioNode)
        CheckError(status)
        
        // now do the wiring. The graph needs to be open before you call AUGraphNodeInfo
        status = AUGraphOpen(self.processingGraph)
        CheckError(status)
        status = AUGraphNodeInfo(self.processingGraph, self.samplerNode, nil, &samplerUnit)
        CheckError(status)
        status = AUGraphNodeInfo(self.processingGraph, self.ioNode, nil, &ioUnit)
        CheckError(status)
        
        let ioUnitOutputElement = AudioUnitElement(0)
        let samplerOutputElement = AudioUnitElement(0)
        status = AUGraphConnectNodeInput(self.processingGraph,
            self.samplerNode, samplerOutputElement, // srcnode, inSourceOutputNumber
            self.ioNode, ioUnitOutputElement) // destnode, inDestInputNumber
        CheckError(status)
    }
    
    func graphStart() {
        //https://developer.apple.com/library/prerelease/ios/documentation/AudioToolbox/Reference/AUGraphServicesReference/index.html#//apple_ref/c/func/AUGraphIsInitialized
        
        var status = OSStatus(noErr)
        var outIsInitialized = DarwinBoolean(false)
        status = AUGraphIsInitialized(self.processingGraph, &outIsInitialized)
        print("isinit status is \(status)")
        print("bool is \(outIsInitialized)")
        if !outIsInitialized  {
            status = AUGraphInitialize(self.processingGraph)
            CheckError(status)
        }
        

        var isRunning = DarwinBoolean(false)
        AUGraphIsRunning(self.processingGraph, &isRunning)
        print("running bool is \(isRunning)")
        if !isRunning  {
            status = AUGraphStart(self.processingGraph)
            CheckError(status)
        }
        
        self.isPlaying = true
    }
    
    func playNoteOn(noteNum:UInt32, velocity:UInt32)    {
        let noteCommand = UInt32(0x90 | 0)
        var status = OSStatus(noErr)
        status = MusicDeviceMIDIEvent(self.samplerUnit, noteCommand, noteNum, velocity, 0)
        CheckError(status)
        print("noteon status is \(status)")
    }
    
    func playNoteOff(noteNum:UInt32)    {
        let noteCommand = UInt32(0x80 | 0)
        var status = OSStatus(noErr)
        status = MusicDeviceMIDIEvent(self.samplerUnit, noteCommand, noteNum, 0, 0)
        CheckError(status)
        print("noteoff status is \(status)")
    }
}
