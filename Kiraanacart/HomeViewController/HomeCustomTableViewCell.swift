//
//  HomeCustomTableViewCell.swift
//  Kiraanacart
//
//  Created by CHINNA on 14/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class HomeCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groceryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
    
     var colorsArray: [UIColor] = [UIColor]()
    
      @IBOutlet weak var collectionView: UICollectionView!
      var imageArray = [String] ()
      var imageArraytitle = [String] ()
      
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
               self.collectionView.dataSource = self

        
               imageArray = ["Dairy _ Milk","Groceries","Vegetables-1","meat-&-sea-food-con","Organic-1","Fruits _ Juices"]
       imageArraytitle = ["Milk","Groceries","Vegetables","meat &seafood","Organic","Fruits&Juices"]
            getRandomColorsArray()
        
//        var imageArray = [(title: "Milk", image: "image1"),
//                              (title: "Grocery", image: "image2"),
//                              (title: "Vegitables", image: "image3"),
//                              (title: "Mear & SeaFood", image: "image4"),
//                              (title: "OrganicFood", image: "image5"),
//                              (title: "Friut & Juice", image: "image6"),
//
//           ]
        

      
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomListCollectionViewCell", for: indexPath) as? CustomListCollectionViewCell
        {
            let randomNumber = Int(arc4random_uniform(UInt32(imageArray.count)))
            cell.itemImage.image = UIImage(named: imageArray[indexPath.row])
            
          // cell.itemImage.image =  UIImage(named: imageArraytitle[cell.tag][indexPath.item])
             let image = imageArray[indexPath.row]
            cell.ItemNameLabel.text = imageArraytitle[indexPath.row]
            
            cell.itemImage.layer.cornerRadius =  cell.itemImage.bounds.height / 2
          //  cell.itemImage.layer.cornerRadius = cell.itemImage.frame.width / 2
            cell.itemImage.clipsToBounds = true
            cell.itemImage.backgroundColor = .green
            print("indexpath",indexPath.row)
            
             cell.itemImage.backgroundColor = self.colorsArray[randomNumber]
            
          //  cell.ItemNameLabel.text = imageArray.title
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = CGSize(width: 123, height: 126)
        return size
    }
    
  
    func getRandomColorsArray(){
          
          self.colorsArray = [UIColor]()
          
          for _ in 0..<imageArray.count {
              self.colorsArray.append(UIColor.random())
          }
          
      }

}


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1)
    }
}
