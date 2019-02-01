//
//  SeatingArrangement.swift
//  SampleTesting
//
//  Created by Kuliza on 12/04/17.
//  Copyright © 2017 kuliza. All rights reserved.
//

import UIKit

typealias seatingArrangementTupleType = (type: SeatingType,blockindex: Int, SeatRow: Int, SeatColumn: Int,isBooked: Bool, BookingNumber: Int)

//MARK: - SeatingArrangement
class SeatingArrangement {
    
    //MARK: Member declarations
    static let shared = SeatingArrangement()
    
    var seatingArrangementarr : [seatingArrangementTupleType]?
    
    var numberOfPassengersBooked: Int = 0
    
    
    //MARK: Custom Method Implementations
    func calculateSeatingPositionArray(SeatCapacityArr: [(Int, Int)]){
        
        numberOfPassengersBooked = 0
        
        var filteredSeatCapacityArr = [(Int, Int)]()
        for obj in SeatCapacityArr{
            if obj.0 != 0 && obj.1 != 0{
                filteredSeatCapacityArr.append(obj)
            }
        }
        
        var aislePositionArr = [(SeatingType, Int, Int, Int)]()
        var WindowPositionArr = [(SeatingType, Int, Int, Int)]()
        var MiddlePositionArr = [(SeatingType, Int, Int, Int)]()
        
        for (index,positionArr) in filteredSeatCapacityArr.enumerated(){
            
            let noofColumns = positionArr.1
            let noofRows = positionArr.0
            
            for j in 1...noofColumns{
                
                for i in 1...noofRows{
                    
                    if (index == 0){
                        if i == 1{
                            WindowPositionArr.append((SeatingType.window,index,i,j))
                        }
                    }
                    else if(index == (SeatCapacityArr.count - 1)){
                        if i == noofRows{
                            WindowPositionArr.append((SeatingType.window,index,i,j))
                        }
                    }
                    
                    if !(index == 0 && i == 1) && !(index == (SeatCapacityArr.count - 1) && i == noofRows){
                        if i == noofRows || i == 1{
                            aislePositionArr.append((SeatingType.aisle,index,i,j))
                        }
                        else{
                            MiddlePositionArr.append((SeatingType.middle,index,i,j))
                        }
                    }
                }
                
            }
        }
        print(aislePositionArr, WindowPositionArr, MiddlePositionArr)
        configureSeatingCapacityArrangement(tuple: (aislePositionArr,WindowPositionArr,MiddlePositionArr))
        
    }
    
    func configureSeatingCapacityArrangement(tuple: (aislePositionArr: [(SeatingType, Int, Int, Int)], WindowPositionArr: [(SeatingType, Int, Int, Int)], MiddlePositionArr: [(SeatingType, Int, Int, Int)])?){
        
        var seatingCapacityArr = [(SeatingType, Int, Int, Int)]()
        
        var finalSeatingCapacityArr = [seatingArrangementTupleType]()
        
        print("Seating Capacity Arrangement")
        
        let arr = [tuple?.aislePositionArr, tuple?.WindowPositionArr, tuple?.MiddlePositionArr]
        
        for array in arr{
            seatingCapacityArr.append(contentsOf: getSpecificArrinSeatingArrangementmanner(array: array!))
        }
        
        for (index, value) in seatingCapacityArr.enumerated(){
            
            
            finalSeatingCapacityArr.append((value.0, value.1, value.2, value.3, false, (index + 1)))
            print("\(index + 1) : \((value.0, value.1, value.2 * value.3, false, (index + 1)))")
        }
        
        
        
        seatingArrangementarr = finalSeatingCapacityArr
        
    }
    
    func getSpecificArrinSeatingArrangementmanner(array: [(SeatingType, Int, Int, Int)]) -> [(SeatingType, Int, Int, Int)]{
        var seatingArr = [(SeatingType, Int, Int, Int)]()
        for i in 0...SeatingArrangementContsnats.highestNumberOfColumns{
            
            for obj in array{
                
                if obj.3 == i{
                    seatingArr.append(obj)
                }
            }
            
        }
        return seatingArr
    }
    
    func BookASeat(){
        seatingArrangementarr?[numberOfPassengersBooked].4 = true
        numberOfPassengersBooked += 1
    }
    
    func getSpecificSeatingPosition(section: Int, row: Int, column: Int) -> seatingArrangementTupleType?{
        
        for tuple in seatingArrangementarr!{
            if tuple.blockindex == section && tuple.SeatRow == row && tuple.SeatColumn == column {
                return tuple
            }
        }
        
        return nil
    }
}
