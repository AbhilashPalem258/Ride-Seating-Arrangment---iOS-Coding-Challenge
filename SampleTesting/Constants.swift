//
//  Constants.swift
//  SampleTesting
//
//  Created by Kuliza on 14/04/17.
//  Copyright © 2017 kuliza. All rights reserved.
//

import UIKit

//MARK: - SeatingViewControllerConstants
struct SeatingViewControllerConstants {
    
    struct SeatingArrCollectionCell {
        static let identifier = "SeatingArrCollectionCell"
    }
    
    struct SeatingCollectionCell {
        static let identifier = "SeatingCollectionCell"
    }
    
    static let seatSize: CGSize = CGSize.init(width: 80, height: 80)
    
    struct colors{
        static let aisle = UIColor.init(colorLiteralRed: 79/255, green: 129/255, blue: 189/255, alpha: 1.0)
        static let window = UIColor.init(colorLiteralRed: 155/255, green: 187/255, blue: 89/255, alpha: 1.0)
        static let middle = UIColor.init(colorLiteralRed: 192/255, green: 80/255, blue: 77/255, alpha: 1.0)
    }
}

//MARK: - SeatingArrangementContsnats
struct SeatingArrangementContsnats{
    static let seatsCapacityArr: [(Int, Int)] = [(3,2),(4,3), (2,3), (3,4)]
    
    static var highestNumberOfColumns: Int{
        var highest: Int = 0
        for obj in SeatingArrangementContsnats.seatsCapacityArr{
            if highest < obj.1{
                highest = obj.1
            }
        }
        return highest
    }
}

