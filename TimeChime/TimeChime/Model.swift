//
//  Model.swift
//  TimeChime
//
//  Created by Student on 5/12/15.
//  Copyright (c) 2015 SCC. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation



class Model {
    
    func timeDisplay(hourHand: UIImageView, minuteHand: UIImageView, secondHand: UIImageView) {
        
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
    
    func playSound(hours: Int?, minutes: Int?) {
        
        var player = AVAudioPlayer()
        var dingPlayer = AVAudioPlayer()
        var dingDongPlayer = AVAudioPlayer()
        var dongPlayer = AVAudioPlayer()
        
        let dingCount = hours
        let dongCount = minutes! / 15
        let dingDongCount = minutes! % 15
        var interval: NSTimeInterval = 0.8
        
        
        // Dong
        if dongCount > 0 {
            let dongURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Dong", ofType:"aif")!)
            dongPlayer = try! AVAudioPlayer(contentsOfURL: dongURL)
            dongPlayer.numberOfLoops = dongCount - 1
            dongPlayer.play()
            interval = 0.68 * Double(dongCount)
            NSThread.sleepForTimeInterval(interval)
        }
        
        
        
        
        // Ding-dong
        if dingDongCount > 0 {
            let dingDongURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ding-dong", ofType:"aif")!)
            dingDongPlayer = try! AVAudioPlayer(contentsOfURL: dingDongURL)
            dingDongPlayer.numberOfLoops = dingDongCount - 1
            dingDongPlayer.play()
            interval = 0.87 * Double(dingDongCount)
            NSThread.sleepForTimeInterval(interval)
        }
        
        
        
        // Ding
        if dingCount > 0 {
            let dingURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ding", ofType:"aif")!)
            dingPlayer = try! AVAudioPlayer(contentsOfURL: dingURL)
            dingPlayer.numberOfLoops = dingCount! - 1
            interval = 0.7 * Double(dingCount!)
            dingPlayer.play()
            NSThread.sleepForTimeInterval(interval)
        }
        
    }

}