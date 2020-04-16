//
//  HomeCustomTableViewCell.swift
//  Kiraanacart
//
//  Created by CHINNA on 14/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class HomeCustomTableViewCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
        @IBOutlet weak var collectionView: UICollectionView!
       
        var imageArray = [String] ()
      
     var Scrollinftimer = Timer()
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            collectionView.delegate = self
            collectionView.dataSource = self
            imageArray = ["1","2","3","4"]
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            // Configure the view for the selected state
        }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return imageArray.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomListCollectionViewCell1", for: indexPath) as? CustomListCollectionViewCell1
            {
                let randomNumber = Int(arc4random_uniform(UInt32(imageArray.count)))
                cell.itemImage1.image = UIImage(named: imageArray[indexPath.row])
                let image = imageArray[indexPath.row]
//                cell.itemImage.layer.cornerRadius =  cell.itemImage.bounds.height / 2
//                cell.itemImage.clipsToBounds = true
//                cell.itemImage.backgroundColor = .green
//                cell.itemImage.backgroundColor = self.colorsArray[randomNumber]
//                let doubleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
//                doubleTap.numberOfTapsRequired = 1
//                self.collectionView.addGestureRecognizer(doubleTap)
                 var rowIndex = indexPath.row
                
                let Numberofrecords : Int = imageArray.count - 1
                   if (rowIndex < Numberofrecords)
                   {
                       rowIndex = (rowIndex + 0) // 1
                   }
                   else
                   {
                       rowIndex = 0
                   }

                   Scrollinftimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(startTimer(timersset:)), userInfo: rowIndex, repeats: true)
//
                return cell
                
            }
            return UICollectionViewCell()
        }
        
      
    
    @objc func startTimer(timersset : Timer)
    {
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations:
        {
            self.collectionView.scrollToItem(at: IndexPath(row: timersset.userInfo! as! Int,section:0), at: .centeredHorizontally, animated: false)
        }, completion: nil)
    }
            
          
    }
        

class HomeCustomTableViewCell1: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

class HomeCustomTableViewCell2: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    var imageArray = [String] ()
    var imageArraytitle = [String] ()
    var colorsArray: [UIColor] = [UIColor]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        imageArray = ["Dairy _ Milk","Groceries","Vegetables-1","meat-&-sea-food-con","Organic-1","Fruits _ Juices"]
        imageArraytitle = ["Milk","Groceries","Vegetables","meat &seafood","Organic","Fruits&Juices"]
        getRandomColorsArray()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageArray.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomListCollectionViewCell", for: indexPath) as? CustomListCollectionViewCell
        {
            let randomNumber = Int(arc4random_uniform(UInt32(imageArray.count)))
            cell.itemImage.image = UIImage(named: imageArray[indexPath.row])
            let image = imageArray[indexPath.row]
            cell.ItemNameLabel.text = imageArraytitle[indexPath.row]
            cell.itemImage.layer.cornerRadius =  cell.itemImage.bounds.height / 2
            cell.itemImage.clipsToBounds = true
            cell.itemImage.backgroundColor = .green
            cell.itemImage.backgroundColor = self.colorsArray[randomNumber]
            let doubleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
            doubleTap.numberOfTapsRequired = 1
            self.collectionView.addGestureRecognizer(doubleTap)
            
            return cell
            
        }
        return UICollectionViewCell()
    }
    
    @objc func didDoubleTap(sender: UITapGestureRecognizer) {
        
        
        //     print("cell) was double tapped")
        
        let tapLocation = sender.location(in: self.collectionView)
        if let indexPath : NSIndexPath = self.collectionView.indexPathForItem(at: tapLocation) as NSIndexPath?
        {
            let name = imageArray[indexPath.row]
            if indexPath.row == 0{
              
        
            //    self.show(secondViewController, sender: self)
                
            }
            
        }else {
            print("nameof index")
        }
        
        
      
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
//        let size = CGSize(width: 120, height: 120)
//        return size
//    }
//
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let noOfCellsInRow = 3

           let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

           let totalSpace = flowLayout.sectionInset.left
               + flowLayout.sectionInset.right
               + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

           let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

           return CGSize(width: size, height: size) 
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return  0
    }
    
    
    func getRandomColorsArray(){
        
        self.colorsArray = [UIColor]()
        
        for _ in 0..<imageArray.count {
            self.colorsArray.append(UIColor.random())
        }
        
    }
    
}

