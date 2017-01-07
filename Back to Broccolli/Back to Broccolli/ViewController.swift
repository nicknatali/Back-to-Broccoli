//
//  ViewController.swift
//  Back to Broccolli
//
//  Created by Nick Natali on 12/30/16.
//  Copyright © 2016 Make It Appen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var timer = Timer()
    
    let audioPath = Bundle.main.path(forResource: "Broccoli", ofType: "mp3")
    
    
    func updateScrubber() {
        
        scrubber.value = Float(player.currentTime)
        
    }
    
    @IBOutlet var image: UIImageView!
    
    @IBAction func play(_ sender: Any) {
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
        
 
    }
    
    @IBAction func volumeChanged(_ sender: Any) {
        
        player.volume = volumeSlider.value
        
    }
    
    @IBOutlet var volumeSlider: UISlider!
    
    @IBAction func scrubberMoved(_ sender: Any) {
        
        player.currentTime = TimeInterval(scrubber.value)
        
    }
    
    @IBOutlet var scrubber: UISlider!
    
    
    @IBAction func stop(_ sender: Any) {
        scrubber.value = 0
        timer.invalidate()
        player.pause()
        
        do
        {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        } catch {
            
        }

        
        
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
        
        timer.invalidate()
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do
        {
        
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))                
            scrubber.maximumValue = Float(player.duration)
            
        
        } catch {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

