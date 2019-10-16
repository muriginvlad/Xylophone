//
//  ViewController.swift
//  Dicee
//
//  Created by Владислав on 25/06/2019.
//  Copyright © 2019 Murygin Vladislav. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var audioPlayer: AVAudioPlayer!
    let note = ["note1","note2","note3","note4","note5","note6","note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        
        playSound(note[sender.tag - 1])
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        sender.alpha = 1
        }

        }
    
    func playSound(_ sound: String) {
        
        let soundURL = Bundle.main.url(forResource: "\(sound)", withExtension: "wav")
        
        do {try audioPlayer =  AVAudioPlayer(contentsOf: soundURL!)}catch{print(error)}
    
        audioPlayer.play()
    }
}
