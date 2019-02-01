//
//  BaseTableViewDataLayer.swift
//  SampleTesting
//
//  Created by Kuliza on 13/04/17.
//  Copyright © 2017 kuliza. All rights reserved.
//

import UIKit

//MARK: - BaseTableViewDataLayer
class BaseTableViewDataLayer<T>{
    
    //MARK: Member declartions
    var DataArray : [T]?
    var selectedTblCellData : T?
    
    //MARK: Computed property implementaions
    var getTotalRowCount : Int{
        get{
            var rowCount = 0
            
            if let tblArr = DataArray{
              rowCount = tblArr.count
            }
            
            return rowCount
        }
    }
    var selectedIndex = 0 {
        didSet{
            if let tblArr = DataArray{
               selectedTblCellData = tblArr[selectedIndex]
            }
        }
    }

   
    //MARK: Initialization
    init() {
       getDataArray()
    }
    
    func getDataArray(){
        
    }

}
