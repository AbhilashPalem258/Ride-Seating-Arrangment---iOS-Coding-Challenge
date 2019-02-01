//
//  SeatingType.swift
//  SampleTesting
//
//  Created by Kuliza on 13/04/17.
//  Copyright © 2017 kuliza. All rights reserved.
//

import UIKit
//MARK: - SeatingType
enum SeatingType {
    case aisle
    case window
    case middle
    
    //MARK: Computed property implementations
    var backgroundColor: UIColor{
        switch self {
        case .aisle:
            return SeatingViewControllerConstants.colors.aisle
        case .window:
            return SeatingViewControllerConstants.colors.window
        case .middle:
            return SeatingViewControllerConstants.colors.middle
        }
    }
}
