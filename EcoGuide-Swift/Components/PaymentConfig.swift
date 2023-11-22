//
//  PaymentConfig.swift
//  EcoGuide-Swift
//
//  Created by Torkhani fara on 18/11/2023.
//

import Foundation

class PaymentConfig {
    
    var paymentIntentClientSecret : String?
    static var shared: PaymentConfig = PaymentConfig()
    private init(){
        
    }
}
