//
//  ViewController.swift
//  Lesson 6
//
//  Created by T1GER on 26.06.2021.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {
    
    var songName = String()
    var artisc = String()
    var songImage = UIImage()
    var curTime = String()
    var songFileName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    @IBAction func firstButtonAction(_ sender: Any) {
        songName = "Ches Karce (Hard Remix)"
        artisc = "Kar"
        songImage = UIImage(named: "Diana1") ?? UIImage()
        songFileName = "Ches"
        self.performSegue(withIdentifier: "pass", sender: nil)

    }
    
    @IBAction func secondButtonAction(_ sender: Any) {
        songName = "Huys"
        artisc = "Vnas"
        songImage = UIImage(named: "Diana2") ?? UIImage()
        songFileName = "Vnas"
        self.performSegue(withIdentifier: "pass", sender: nil)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if case let vc as SecondViewController = segue.destination, segue.identifier == "pass" {
            vc.songName = songName
            vc.artiscName = artisc
            vc.songImage = songImage
            vc.curTime = curTime
            vc.songFileName = songFileName
        }
    }
}
