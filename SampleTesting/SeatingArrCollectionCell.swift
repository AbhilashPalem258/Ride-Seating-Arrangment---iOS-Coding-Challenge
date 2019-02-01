//
//  SeatingArrCollectionCell.swift
//  SampleTesting
//
//  Created by Kuliza on 13/04/17.
//  Copyright © 2017 kuliza. All rights reserved.
//

import UIKit
//MARK: - SeatingArrCollectionCell
class SeatingArrCollectionCell: UICollectionViewCell {
    
    //MARK: Member declarations
    var indexOfArrBlock: Int?
    
    //MARK: Computed Property Implementations
    var matrix: Matrix?{
        didSet{
            self.collectionview.reloadData()
        }
    }
    
    lazy var collectionview: UICollectionView = {
        
        let collectionlayout = UICollectionViewFlowLayout()
        collectionlayout.minimumInteritemSpacing = 0
        collectionlayout.minimumLineSpacing = 0
        
        let collectionview = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: collectionlayout)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.backgroundColor = UIColor.clear
        collectionview.register(SeatingCollectionCell.self, forCellWithReuseIdentifier: SeatingViewControllerConstants.SeatingCollectionCell.identifier)
        self.contentView.addSubview(collectionview)
        
        
        NSLayoutConstraint.init(item: collectionview, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint.init(item: collectionview, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: -8).isActive = true
        NSLayoutConstraint.init(item: collectionview, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint.init(item: collectionview, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        
        return collectionview
    }()
    
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        _ = collectionview
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - SeatingArrCollectionCell: UICollectionViewDataSource Method Implementation
extension SeatingArrCollectionCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
       return matrix!.numberOfRows * matrix!.numberOfColumns
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell : SeatingCollectionCell! = collectionView.dequeueReusableCell(withReuseIdentifier: SeatingViewControllerConstants.SeatingCollectionCell.identifier, for: indexPath) as! SeatingCollectionCell
        let positionTuple = matrix?.convertRowintoMatrixPosition(row: indexPath.row)
        cell.configureCell(section: indexOfArrBlock ?? 0, row: positionTuple!.0, column: positionTuple!.1)
        return cell
        
    }
}

//MARK: - SeatingArrCollectionCell: UICollectionViewDelegate Method Implementation
extension SeatingArrCollectionCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    
        return SeatingViewControllerConstants.seatSize
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

