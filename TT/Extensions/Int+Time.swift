//
//  Int+Time.swift
//  TT
//
//  Created by Radomyr Sidenko on 20.07.2022.
//

extension Int {
    func toFormatedTimeString() -> String{
        let milSec = self % 100
        let sec = (self / 100) % 60
        let min = (self / 6000) % 60
        
        let formatString = String(format: "%02d:%02d.%02d", min, sec, milSec)
       
        return formatString
    }
}
