//
//  ViewController.swift
//  SwiftSimpleAUGraph
//
//  Created by Gene De Lisa on 6/8/14.
//  Copyright (c) 2014 Gene De Lisa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var soundGenerator:SoundGenerator
    
    init(coder aDecoder: NSCoder!) {
        self.soundGenerator = SoundGenerator()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playNoteOn(b:UIButton) {
        var note:UInt32 = UInt32(b.tag)
        var velocity:UInt32 = 100
        soundGenerator.playNoteOn(note, velocity: velocity)
    }
    
    @IBAction func playNoteOff(b:UIButton) {
        var note:UInt32 = UInt32(b.tag)
        soundGenerator.playNoteOff(note)
    }

}

