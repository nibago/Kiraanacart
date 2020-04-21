//
//  MilkproductViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 21/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class MilkproductViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    
    @IBOutlet weak var CollectionView1: UICollectionView!
    
       @IBOutlet weak var CollectionView2: UICollectionView!

    @IBOutlet weak var CollectionView3: UICollectionView!
    
    
    var imageArray1 = [String] ()
    var imageArray2 = [String] ()
     var imageArray3 = [String] ()
      
     var imageArray = [String] ()
     var colorsArray: [UIColor] = [UIColor]()
     
     var Scrollinftimer = Timer()
     var imageArraytitle = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.translatesAutoresizingMaskIntoConstraints = true
        
        CollectionView1.delegate = self
        CollectionView1.dataSource = self
        
        CollectionView2.delegate = self
        CollectionView2.dataSource = self
            imageArray1 = ["dairy.jpeg","2","3","4"]
            imageArray2 = ["img1","img2","img3","img4","img5","img6","img7","img8"]
        imageArray3 = ["img1","img2","img3","img4","img5","img6","img7","img8"]
//              imageArray = ["Dairy _ Milk","Groceries","Vegetables-1","meat-&-sea-food-con","Organic-1","Fruits _ Juices"]
              imageArraytitle = ["Milk","curd","butter","cheese","panner","Ghee","mysty","lussi"]
//
            let button2 = UIButton(type: .custom)
              button2.tintColor = .white
              button2.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
              button2.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
              button2.setImage(UIImage (named: "cart-(-white-)-icon"), for: .normal)
              button2.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
              button2.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
              let barButtonItem2 = UIBarButtonItem(customView: button2)
              self.navigationItem.rightBarButtonItems = [barButtonItem2]
    }
    
    
    @objc func buttonClicked(sender: UIBarButtonItem) {

           let storyBoard : UIStoryboard = UIStoryboard(name: "CartStoryboard", bundle:nil)
           let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AddCartViewController") as! AddCartViewController
           self.navigationController?.show(nextViewController, sender: nil)
           
       }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           
           if collectionView == self.CollectionView1 {
               return imageArray1.count
           } else if collectionView == self.CollectionView2{
             return imageArray2.count
        } else if collectionView == self.CollectionView3{
             return imageArray3.count
        }
           
          return 1
       }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == self.CollectionView1 {
            
            let noOfCellsInRow = 1
            
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            
            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
            
            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            
            return CGSize(width: size, height: size)
         }else if collectionView == self.CollectionView2 {
        
        
                return CGSize(width: 120, height:120)
            
        } else {
    
    let noOfCellsInRow = 3
            
    
    let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
    
    let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
    
    let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
    
    return CGSize(width: size, height: size)
     
        }
    
}
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == self.CollectionView1{
                
                
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as? MilkCollectionViewCell1
                {
                    
                    cell.showimage1.image = UIImage(named: imageArray1[indexPath.row])
                   // var rowIndex = indexPath.row
                    return cell
                    
                }
            } else if collectionView == self.CollectionView2{
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? MilkCollectionViewCell2
                {
                    cell.showImage2.image = UIImage(named: imageArray2[indexPath.row])
                    cell.ItemNameLabel.text = imageArraytitle[indexPath.row]
                    
                  return cell
                }
        } else {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as? MilkCollectionViewCell3
                           {
                               cell.showImage3.image = UIImage(named: imageArray3[indexPath.row])
                               
                               
                             return cell
                           }
        }
            return UICollectionViewCell()

         
        }

     
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.CollectionView3 {
            
            if indexPath.row == 0{
                let storyBoard : UIStoryboard = UIStoryboard(name: "FilterBrandsStoryboard", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "FilterBrandsViewController") as! FilterBrandsViewController
                self.navigationController?.show(nextViewController, sender: nil)
            }
            
        }
        
    }
    
    
    }




    
    
    
    
    
   
