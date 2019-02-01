//
//  SeatingCollectionCell.swift
//  SampleTesting
//
//  Created by Kuliza on 13/04/17.
//  Copyright © 2017 kuliza. All rights reserved.
//

import UIKit
//MARK: - SeatingCollectionCell
final class SeatingCollectionCell: UICollectionViewCell {
    
    //MARK: Member declarations
    var textLayer: CATextLayer!
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setInitalConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - SeatingCollectionCell: Custom Method Implementation
extension SeatingCollectionCell{
    func setInitalConfiguration(){
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        
        createTextLayer()
    }
    
    func configureCell(section: Int, row: Int, column: Int){
        
        if let SeatConfig: seatingArrangementTupleType = SeatingArrangement.shared.getSpecificSeatingPosition(section: section, row: row, column: column){
            
            backgroundColor = SeatConfig.type.backgroundColor
            //if SeatConfig.isBooked == true{
               textLayer.string = "\n\(SeatConfig.BookingNumber)"
            //}
        }
        
    }
    
    func createTextLayer() {
        textLayer = CATextLayer()
        textLayer.foregroundColor = UIColor.white.cgColor
        textLayer.font = UIFont(name: "AvenirNext-Bold", size: 15.0)
        textLayer.fontSize = 15.0
        textLayer.alignmentMode = kCAAlignmentCenter
        textLayer.backgroundColor = UIColor.clear.cgColor
        textLayer.frame = self.layer.bounds
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.position = CGPoint.init(x: contentView.bounds.width/2, y: contentView.bounds.height/2)
        self.layer.addSublayer(textLayer)
    }
}
