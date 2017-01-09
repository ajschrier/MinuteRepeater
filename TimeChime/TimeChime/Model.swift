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
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}




class Model {
    
    func timeDisplay(_ hourHand: UIImageView, minuteHand: UIImageView, secondHand: UIImageView) {
        
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
    
    func playSound(_ hours: Int?, minutes: Int?) {
        
        var player = AVAudioPlayer()
        var dingPlayer = AVAudioPlayer()
        var dingDongPlayer = AVAudioPlayer()
        var dongPlayer = AVAudioPlayer()
        
        let dingCount = hours
        let dongCount = minutes! / 15
        let dingDongCount = minutes! % 15
        var interval: TimeInterval = 0.8
        
        
        // Dong
        if dongCount > 0 {
            let dongURL = URL(fileURLWithPath: Bundle.main.path(forResource: "Dong", ofType:"aif")!)
            dongPlayer = try! AVAudioPlayer(contentsOf: dongURL)
            dongPlayer.numberOfLoops = dongCount - 1
            dongPlayer.play()
            interval = 0.68 * Double(dongCount)
            Thread.sleep(forTimeInterval: interval)
        }
        
        
        
        
        // Ding-dong
        if dingDongCount > 0 {
            let dingDongURL = URL(fileURLWithPath: Bundle.main.path(forResource: "Ding-dong", ofType:"aif")!)
            dingDongPlayer = try! AVAudioPlayer(contentsOf: dingDongURL)
            dingDongPlayer.numberOfLoops = dingDongCount - 1
            dingDongPlayer.play()
            interval = 0.87 * Double(dingDongCount)
            Thread.sleep(forTimeInterval: interval)
        }
        
        
        
        // Ding
        if dingCount > 0 {
            let dingURL = URL(fileURLWithPath: Bundle.main.path(forResource: "Ding", ofType:"aif")!)
            dingPlayer = try! AVAudioPlayer(contentsOf: dingURL)
            dingPlayer.numberOfLoops = dingCount! - 1
            interval = 0.7 * Double(dingCount!)
            dingPlayer.play()
            Thread.sleep(forTimeInterval: interval)
        }
        
    }

}
