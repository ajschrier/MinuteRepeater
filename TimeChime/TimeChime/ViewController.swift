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

    var timer: NSTimer?
    
    let queue: dispatch_queue_t?
    
    //let soundOperationPointer = { soundOperation() }

    
    @IBOutlet weak var hourHand: UIImageView!
    @IBOutlet weak var minuteHand: UIImageView!
    @IBOutlet weak var secondHand: UIImageView!
    @IBOutlet var tap: UITapGestureRecognizer!
    @IBOutlet weak var aboutButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeDisplay()
        
        let timerDeclaration = { self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timeDisplay"), userInfo: nil, repeats: true)}
        
        dispatch_sync(dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT), timerDeclaration)
     
        
        
    }
    
    func timeDisplay() {
        
        //Pull current time from NSDate
        let currentTime = NSDate()
        
        //Extract hours, minutes, seconds from currentTime
        let time = NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.LongStyle)
        let separators = NSCharacterSet(charactersInString: ": ,")
        let timeSeparated = time.componentsSeparatedByCharactersInSet(separators)
        
        NSLog(time) //Print time to NSLog for testing purposes
        
        //Set to individual variables
        let hours = CGFloat(((timeSeparated[0] as NSString).floatValue))
        let minutes = CGFloat((timeSeparated[1] as NSString).floatValue)
        let seconds = CGFloat((timeSeparated[2] as NSString).floatValue)
        
        
        //Perform rotations
        
        hourHand.transform = CGAffineTransformMakeRotation((hours + (minutes/60)) * 2 * CGFloat(M_PI) / 12)
        minuteHand.transform = CGAffineTransformMakeRotation(minutes * 2 * CGFloat(M_PI) / 60)
        secondHand.transform = CGAffineTransformMakeRotation(seconds * 2 * CGFloat(M_PI) / 60)
        
    }
    
   
    @IBAction func playSound(sender: AnyObject) {
        
        dispatch_after(0, dispatch_queue_create("chime", nil)) {self.soundOperation()}
    }
    
    
    func soundOperation() {
        
        //Pull current time from NSDate
        let currentTime = NSDate()
        
        //Extract hours, minutes, seconds from currentTime
        let time = NSDateFormatter.localizedStringFromDate(currentTime, dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.LongStyle)
        let separators = NSCharacterSet(charactersInString: ": ,")
        let timeSeparated = time.componentsSeparatedByCharactersInSet(separators)
        
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
        let dingCount = minutes % 15
        var interval: NSTimeInterval = 0.8
        
        
        
        NSLog(dongCount.description)
        NSLog(dingDongCount.description)
        NSLog(dingCount.description)
        
        
        
        
        // Dong
        if dongCount > 0 {
            let dongURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Dong", ofType:"aif")!)
            dongPlayer = try! AVAudioPlayer(contentsOfURL: dongURL)
            dongPlayer.numberOfLoops = Int(dongCount) - 1
            dongPlayer.play()
            interval = 0.68 * Double(dongCount)
            NSThread.sleepForTimeInterval(interval)
        }
        
        
        
        
        // Ding-dong
        if dingDongCount > 0 {
            let dingDongURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ding-dong", ofType:"aif")!)
            dingDongPlayer = try! AVAudioPlayer(contentsOfURL: dingDongURL)
            dingDongPlayer.numberOfLoops = Int(dingDongCount) - 1
            dingDongPlayer.play()
            interval = 0.87 * Double(dingDongCount)
            NSThread.sleepForTimeInterval(interval)
        }
        
        
        
        // Ding
        if dingCount > 0 {
            let dingURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ding", ofType:"aif")!)
            dingPlayer = try! AVAudioPlayer(contentsOfURL: dingURL)
            dingPlayer.numberOfLoops =  Int(dingCount) - 1
            interval = 0.7 * Double(dingCount)
            dingPlayer.play()
            NSThread.sleepForTimeInterval(interval)
        }
    }
    
    
    @IBAction func aboutThisApp(sender: AnyObject) {
        let alert = UIAlertController(title: "TimeChime" , message: "Designed by AJ Schrier\n\nThis app uses chimes to designate the current time\nLow chimes = hours\nLow-high chime = Quarter-hours\nHigh chime = Minutes after quarter-hour ", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }



}

