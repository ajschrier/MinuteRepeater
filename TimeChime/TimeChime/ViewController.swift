//
//  ViewController.swift
//  TimeChime
//
//  Created by Student on 5/12/15.
//  Copyright (c) 2015 SCC. All rights reserved.
//

import UIKit
import AVFoundation
import Dispatch


class ViewController: UIViewController {
    
    @IBOutlet var subview: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
//    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
//        subview = UIView()
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    convenience override init() {
//        self.init(nibName: nil, bundle: nil)
//    }

    var timer: Timer?
    
    let queue: DispatchQueue?
    
    //let soundOperationPointer = { soundOperation() }

    
    @IBOutlet weak var hourHand: UIImageView!
    @IBOutlet weak var minuteHand: UIImageView!
    @IBOutlet weak var secondHand: UIImageView!
    @IBOutlet var tap: UITapGestureRecognizer!
    @IBOutlet weak var aboutButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeDisplay()
        
        let timerDeclaration = { self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timeDisplay), userInfo: nil, repeats: true)}
        
        DispatchQueue(label: nil, attributes: DispatchQueue.Attributes.concurrent).sync(execute: timerDeclaration)
     
        
        
    }
    
    func timeDisplay() {
        
        //Pull current time from NSDate
        let currentTime = Date()
        
        //Extract hours, minutes, seconds from currentTime
        let time = DateFormatter.localizedString(from: currentTime, dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.long)
        let separators = CharacterSet(charactersIn: ": ,")
        let timeSeparated = time.components(separatedBy: separators)
        
        NSLog(time) //Print time to NSLog for testing purposes
        
        //Set to individual variables
        let hours = CGFloat(((timeSeparated[0] as NSString).floatValue))
        let minutes = CGFloat((timeSeparated[1] as NSString).floatValue)
        let seconds = CGFloat((timeSeparated[2] as NSString).floatValue)
        
        
        //Perform rotations
        
        hourHand.transform = CGAffineTransform(rotationAngle: (hours + (minutes/60)) * 2 * CGFloat(M_PI) / 12)
        minuteHand.transform = CGAffineTransform(rotationAngle: minutes * 2 * CGFloat(M_PI) / 60)
        secondHand.transform = CGAffineTransform(rotationAngle: seconds * 2 * CGFloat(M_PI) / 60)
        
    }
    
   
    @IBAction func playSound(_ sender: AnyObject) {
        
        DispatchQueue(label: "chime", attributes: []).asyncAfter(deadline: 0) {self.soundOperation()}
    }
    
    
    func soundOperation() {
        
        //Pull current time from NSDate
        let currentTime = Date()
        
        //Extract hours, minutes, seconds from currentTime
        let time = DateFormatter.localizedString(from: currentTime, dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.long)
        let separators = CharacterSet(charactersIn: ": ,")
        let timeSeparated = time.components(separatedBy: separators)
        
        NSLog(time) //Print time to NSLog for testing purposes
        
        //Set to individual variables
        let hours = ((timeSeparated[0] as NSString).floatValue)
        let minutes = (timeSeparated[1] as NSString).floatValue
        
        _ = "hours: "
        _ = ", minutes: "
        
        
        //Initialize AVAudioPlayer vars
        var player = AVAudioPlayer()
        var dingPlayer = AVAudioPlayer()
        var dingDongPlayer = AVAudioPlayer()
        var dongPlayer = AVAudioPlayer()
        
        //Set counts for each sound
        let dongCount = hours
        let dingDongCount = Int(minutes / 15)
        let dingCount = minutes.truncatingRemainder(dividingBy: 15)
        var interval: TimeInterval = 0.8
        
        
        
        NSLog(dongCount.description)
        NSLog(dingDongCount.description)
        NSLog(dingCount.description)
        
        
        
        
        // Dong
        if dongCount > 0 {
            let dongURL = URL(fileURLWithPath: Bundle.main.path(forResource: "Dong", ofType:"aif")!)
            dongPlayer = try! AVAudioPlayer(contentsOf: dongURL)
            dongPlayer.numberOfLoops = Int(dongCount) - 1
            dongPlayer.play()
            interval = 0.68 * Double(dongCount)
            Thread.sleep(forTimeInterval: interval)
        }
        
        
        
        
        // Ding-dong
        if dingDongCount > 0 {
            let dingDongURL = URL(fileURLWithPath: Bundle.main.path(forResource: "Ding-dong", ofType:"aif")!)
            dingDongPlayer = try! AVAudioPlayer(contentsOf: dingDongURL)
            dingDongPlayer.numberOfLoops = Int(dingDongCount) - 1
            dingDongPlayer.play()
            interval = 0.87 * Double(dingDongCount)
            Thread.sleep(forTimeInterval: interval)
        }
        
        
        
        // Ding
        if dingCount > 0 {
            let dingURL = URL(fileURLWithPath: Bundle.main.path(forResource: "Ding", ofType:"aif")!)
            dingPlayer = try! AVAudioPlayer(contentsOf: dingURL)
            dingPlayer.numberOfLoops =  Int(dingCount) - 1
            interval = 0.7 * Double(dingCount)
            dingPlayer.play()
            Thread.sleep(forTimeInterval: interval)
        }
    }
    
    
    @IBAction func aboutThisApp(_ sender: AnyObject) {
        let alert = UIAlertController(title: "TimeChime" , message: "Designed by AJ Schrier\n\nThis app uses chimes to designate the current time\nLow chimes = hours\nLow-high chime = Quarter-hours\nHigh chime = Minutes after quarter-hour ", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }



}

