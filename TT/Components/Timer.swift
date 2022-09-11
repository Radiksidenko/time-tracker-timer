//
//  Timer.swift
//  TT
//
//  Created by Radomyr Sidenko on 20.07.2022.
//

import Foundation

protocol TimerDelegate {
    func tickHandler(timePast: Int)
    func resetHandler()
}

class TimerComponents {
 
    // MARK: Properties
    
    static let shared = TimerComponents()
    
    public var delegate : TimerDelegate?
    
    private var countTimer : Timer!
    
    private var timePast : Int = 0
    
    public private(set) var countList = [Int]()
    
    // MARK: Methods
    
    public func start() {
        if countTimer == nil {
            countTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer) in
                self.timePast += 1
                self.delegate?.tickHandler(timePast: self.timePast)
            })
            
            RunLoop.current.add(countTimer, forMode: RunLoop.Mode.common)
            countTimer.fire()
        } else {
            countTimer.fireDate = Date.distantPast
        }
    }
    
    public func stop() {
        if countTimer != nil {
            countTimer.fireDate = Date.distantFuture
        }
    }
    
    public func count() {
        countList.append(timePast)
        print(timePast.toFormatedTimeString())
    }
    
    public func reset() {
        if countTimer != nil {
            countTimer.invalidate()
            countTimer = nil
            timePast = 0
            countList = [Int]()
            delegate?.resetHandler()
        }
    }
}
