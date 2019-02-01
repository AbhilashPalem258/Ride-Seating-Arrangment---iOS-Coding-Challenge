//
//  Matrix.swift
//  SampleTesting
//
//  Created by Kuliza on 14/04/17.
//  Copyright © 2017 kuliza. All rights reserved.
//

import UIKit

//MARK: - Matrix
final class Matrix {
    
    //MARK: Member declarations
    var numberOfRows: Int! = 0
    var numberOfColumns: Int! = 0
    
    //MARK: Initialization
    init(rows: Int?, columns: Int?) {
        self.numberOfRows = rows ?? 0
        self.numberOfColumns = columns ?? 0
    }
}
//MARK: - Matrix: Custom Method Implementation
extension Matrix{
    func convertRowintoMatrixPosition(row: Int) -> (Int, Int){
        
        var arr = [Int]()
        
        for i in 1...numberOfColumns{
            arr.append(i * numberOfRows)
        }
        
        var column: Int! = 1
        for (index,obj) in arr.enumerated(){
            if (row + 1) > obj{
                column = index + 2
                
            }
        }
        
        var Row : Int = row - ((column - 1) * numberOfRows)
        Row += 1
        
        return (Row, column)
    }

}
