//
//  HomepageViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 19/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var RightButton: UIBarButtonItem!
    @IBOutlet weak var LeftButton: UIBarButtonItem!
    
    var imageArray1 = [String] ()
    var imageArray = [String] ()
    var colorsArray: [UIColor] = [UIColor]()
    
    var Scrollinftimer = Timer()
    var imageArraytitle = [String] ()
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        imageArray1 = ["1","2","3","4"]
        
        imageArray = ["Dairy _ Milk","Groceries","Vegetables-1","meat-&-sea-food-con","Organic-1","Fruits _ Juices"]
        imageArraytitle = ["Milk","Groceries","Vegetables","meat &seafood","Organic","Fruits&Juices"]
        
        let firstFrame = CGRect(x: 0, y: 0, width: view.frame.width/2, height: view.frame.height)
        let firstLabel = UILabel(frame: firstFrame)
        firstLabel.text = "8th Cross,RT Nagar,Bangalore"
        //  navigationView.addSubview(firstLabel)
        navigationItem.titleView = firstLabel
        
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage (named: "location-pin-icon"), for: .normal)
        button.frame = CGRect(x: 30.0, y: 0.0, width: 35.0, height: 35.0)
        button.tintColor = .white
        //button.addTarget(target, action: nil, for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        let barButtonItem = UIBarButtonItem(customView: button)
        
        self.navigationItem.leftBarButtonItems = [barButtonItem]
        
        let button2 = UIButton(type: .custom)
        button2.tintColor = .white
        button2.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        button2.setImage(UIImage (named: "cart-(-white-)-icon"), for: .normal)
        button2.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
        button2.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        let barButtonItem2 = UIBarButtonItem(customView: button2)
        self.navigationItem.rightBarButtonItems = [barButtonItem2]
        
        getRandomColorsArray()
        // Do any additional setup after loading the view.
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
        
        if collectionView == self.collectionView {
            return imageArray1.count
        }
        
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == self.collectionView {
            
            let noOfCellsInRow = 1
            
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            
            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
            
            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            
            return CGSize(width: size, height: size)
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
        
        if collectionView == self.collectionView {
            
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomListCollectionViewCell
            {
                
                cell.itemImage.image = UIImage(named: imageArray1[indexPath.row])
                var rowIndex = indexPath.row
                
                let Numberofrecords : Int = imageArray1.count - 1
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
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as? CustomListCollectionViewCell1
            {
                
                let randomNumber = Int(arc4random_uniform(UInt32(imageArraytitle.count)))
                cell.itemImage1.image = UIImage(named: imageArray[indexPath.row])
                let image = imageArray[indexPath.row]
                cell.ItemNameLabel.text = imageArraytitle[indexPath.row]
                cell.itemImage1.backgroundColor = self.colorsArray[randomNumber]
                
                
                return cell
                
            }
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
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.collectionView2 {
            
            if indexPath.row == 0{
                
            }else if indexPath.row == 1
            {
                let storyBoard : UIStoryboard = UIStoryboard(name: "ListOfStoresStoryboard", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ListOfStoresViewController") as! ListOfStoresViewController
                self.navigationController?.show(nextViewController, sender: nil)
            }
            
        }
        
    }
    
    
    func getRandomColorsArray(){
        
        self.colorsArray = [UIColor]()
        
        for _ in 0..<imageArray.count {
            self.colorsArray.append(UIColor.random())
        }
        
    }
    
    
}




