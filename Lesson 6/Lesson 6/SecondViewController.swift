//
//  SecondViewController.swift
//  Lesson 6
//
//  Created by T1GER on 26.06.2021.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    var timerMain: Timer?

    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var musicNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var musicVolumeLabel: UISlider!
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var firstSongTime: UILabel!
    @IBOutlet weak var secondSongTime: UILabel!
    
    @IBOutlet weak var curentMucisSlider: UISlider!
    @IBOutlet weak var playButtonOutlet: UIButton!
    
    @IBOutlet weak var currentTimeMusic: UILabel!
    @IBOutlet weak var lastTimeMusic: UILabel!
    
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
        playSong(songName: songFileName)
        startTimer()
        updateTime()
        curentMucisSlider.addTarget(self, action: #selector(changeDuration), for: .allEditingEvents)
        
    }
    
    @IBAction func playButton() {
        
        if player.isPlaying {
            player.pause()
            playButtonOutlet.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
            playButtonOutlet.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
        
    }
    @IBAction func sliderAction(_ sender: Any) {
        player.currentTime = TimeInterval(curentMucisSlider.value)
    }
    
    @IBAction func nextTrackAction(_ sender: Any) {
        proverocka()
    }
    
    @IBAction func previewTrackAction(_ sender: Any) {
        proverocka()
        
    }
 
    @IBAction func volumeSlider(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    
    func proverocka() {
        if songFileName == "Vnas" {
            artistNameLabel.text = "Ches Karce"
            songImageView.image = UIImage(named: "Diana1")
            playSong(songName: "Ches")
            musicNameLabel.text = "Ches Karce (Hard Remix)"
            songFileName = "Ches"

        } else if songFileName == "Ches" {
            artistNameLabel.text = "Kar"
            songImageView.image = UIImage(named: "Diana2")
            playSong(songName: "Vnas")
            musicNameLabel.text = "Huys"
            songFileName = "Vnas"
        }
    }
}

extension SecondViewController {
    
    func playSong(songName: String) {

        do {
            if let audioPath = Bundle.main.path(forResource: songName, ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch  {
            print("eRRoR")
        }
    }
    
    @objc func updateTime() {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        curentMucisSlider.maximumValue = Float(player.duration)
        currentTimeMusic.text = stringFormatter(interval: TimeInterval(curentMucisSlider.value)) as String
    }
    
    func stringFormatter(interval: TimeInterval) -> NSString {
        let time = NSInteger(interval)
        let second = time % 60
        let minute = (time / 60) % 60
        return NSString(format: "%0.2d:%0.2d", minute, second)
    }
    
    @objc func update(_timer: Timer) {
        curentMucisSlider.value = Float(player.currentTime)
        currentTimeMusic.text = stringFormatter(interval: TimeInterval(curentMucisSlider.value)) as String
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.curentMucisSlider.value = Float(self.player.currentTime)
        }
    }
    
    @objc func changeDuration(_ sender: UISlider) {
        if player.isPlaying {
            player.stop()
            player.currentTime = TimeInterval(curentMucisSlider.value)
            player.play()
        } else {

player.currentTime = TimeInterval(curentMucisSlider.value)
        }
    }
}
