//
//  ViewController.swift
//  SwiftSimpleAUGraph
//
//  Created by Gene De Lisa on 6/8/14.
//  Copyright (c) 2014 Gene De Lisa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var soundGenerator: SoundGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.soundGenerator = SoundGenerator()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playNoteOn(_ b: UIButton) {
        let note = UInt32(b.tag)
        let velocity = UInt32(100)
        soundGenerator.playNoteOn(note, velocity: velocity)
    }
    
    @IBAction func playNoteOff(_ b: UIButton) {
        let note = UInt32(b.tag)
        soundGenerator.playNoteOff(note)
    }

}
