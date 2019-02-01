//
//  ViewController.swift
//  SampleTesting
//
//  Created by Kuliza on 12/04/17.
//  Copyright © 2017 kuliza. All rights reserved.
//

import UIKit

//MARK: - ViewController
class ViewController: UIViewController {
    
    //MARK: Member declarations
    var CollectionView: UICollectionView!
    var dataLayerObject = ViewControllerDataLayer()

    //MARK: viewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        SeatingArrangement.shared.calculateSeatingPositionArray(SeatCapacityArr: SeatingArrangementContsnats.seatsCapacityArr)
        configureCollectionView()
    }
}
//MARK: - ViewController: Private Method Implementation
extension ViewController{
    
    fileprivate func configureCollectionView(){
        let collectionlayout = UICollectionViewFlowLayout()
        collectionlayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        collectionlayout.minimumInteritemSpacing = 0
        collectionlayout.scrollDirection = .horizontal
        collectionlayout.minimumLineSpacing = 0
        
        CollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: collectionlayout)
        CollectionView.translatesAutoresizingMaskIntoConstraints = false
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.register(SeatingArrCollectionCell.self, forCellWithReuseIdentifier: SeatingViewControllerConstants.SeatingArrCollectionCell.identifier)
        CollectionView.backgroundColor = UIColor.clear
        self.view.addSubview(CollectionView)
        CollectionView.reloadData()
        
        
        NSLayoutConstraint.init(item: CollectionView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint.init(item: CollectionView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -8).isActive = true
        NSLayoutConstraint.init(item: CollectionView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint.init(item: CollectionView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -8).isActive = true
        
    }
    
    fileprivate func configureSeatingArrCollectionCellwithcellModel(_ cellModel: Matrix!, cell: SeatingArrCollectionCell, rowIndex: Int){
        cell.matrix = cellModel
        cell.indexOfArrBlock = rowIndex
    }
}

//MARK: - ViewController: UICollectionViewDataSource Method Implementation
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        if dataLayerObject.getTotalRowCount > 0{
            return dataLayerObject.getTotalRowCount
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        dataLayerObject.selectedIndex = indexPath.row
        let cell : SeatingArrCollectionCell! = collectionView.dequeueReusableCell(withReuseIdentifier: SeatingViewControllerConstants.SeatingArrCollectionCell.identifier, for: indexPath) as! SeatingArrCollectionCell
        configureSeatingArrCollectionCellwithcellModel(dataLayerObject.selectedTblCellData, cell: cell as SeatingArrCollectionCell, rowIndex: indexPath.row)
        return cell
        
    }
}

//MARK: - ViewController: UICollectionViewDelegateFlowLayout Method Implementation
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        dataLayerObject.selectedIndex = indexPath.row
        let cellSize: CGSize! = CGSize(width: CGFloat(dataLayerObject.selectedTblCellData!.numberOfRows!) * SeatingViewControllerConstants.seatSize.width + 18, height: self.CollectionView.frame.size.height)
        return cellSize
        
    }
    
}

//MARK: - ViewControllerDataLayer
class ViewControllerDataLayer: BaseTableViewDataLayer<Matrix>{
    
    override func getDataArray() {
        DataArray = [Matrix]()
        let arr = SeatingArrangementContsnats.seatsCapacityArr
        
        for obj in arr{
            DataArray?.append(Matrix.init(rows: obj.0, columns: obj.1))
        }
    }
    
}


