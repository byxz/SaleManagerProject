//
//  Status.swift
//  SaleManager
//
//  Created by Mac on 09.12.2018.
//  Copyright © 2018 com.sales.my. All rights reserved.
//

import Foundation
import Firebase

class Status {
    static let shared = Status()
    
    var loginStatus = false
    
    private init() {}
    
}
