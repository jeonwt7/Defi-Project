//
//  Double+Extension.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/20.
//

import Foundation

extension Double {
    func stringWithCommas(decimalPlaces: Int = 0) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if decimalPlaces == 0 {
            return numberFormatter.string(from: NSNumber(value: self)) ?? ""
        }
        let decimalNumber = self.truncatingRemainder(dividingBy: 1)
        let decimalInt = Int(decimalNumber * pow(10, Double(decimalPlaces)).rounded())
        var decimalString = String(decimalInt)
        while decimalString.count < decimalPlaces {
            decimalString = "0" + decimalString
        }
        return (numberFormatter.string(from: NSNumber(value: self.rounded())) ?? "") + "." + decimalString
    }
}
