//
//  SecondViewController.swift
//  Lesson 6
//
//  Created by T1GER on 26.06.2021.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var musicNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var musicVolumeLabel: UISlider!
    @IBOutlet weak var firstSongTime: UILabel!
    @IBOutlet weak var secondSongTime: UILabel!
    
    
    var songName = String()
    var artiscName = String()
    var songImage = UIImage()
    var curTime = String()
    var player = AVAudioPlayer()
    var songFileName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songImageView.image = songImage
        musicNameLabel.text = songName
        artistNameLabel.text = artiscName
      
    }
    @IBAction func playButton() {
        playSong(songName: songFileName)
        player.play()
        
    }
    
    func playSong(songName: String) {
        
        do {
            if let audioPath = Bundle.main.path(forResource: songName, ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch  {
            print("eRRoR")
        }
    }
}

