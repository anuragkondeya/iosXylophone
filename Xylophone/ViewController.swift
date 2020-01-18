//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    var lock: Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func playSound(_ sender: UIButton) {
        if(!lock){
            lock = true
        let key = sender.titleLabel?.text ?? "Nothing"
        sender.alpha = 0.5
        playSoundFile(soundFile: key)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
            self.lock = false
        }
        }
    }
    
    func playSoundFile(soundFile : String) {
       let url = Bundle.main.url(forResource: soundFile, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()

    }

}

