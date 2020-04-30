//
//  HomepageViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 19/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit
import CoreLocation



class HomepageViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UITextFieldDelegate  {
    
    @IBOutlet weak var selfpickupButton: UIButton!
    @IBOutlet weak var DeliveryButton: UIButton!
    @IBOutlet weak var RightButton: UIBarButtonItem!
    @IBOutlet weak var LeftButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    
    var imageArray1 = [String] ()
    var imageArray = [String] ()
    var colorsArray: [UIColor] = [UIColor]()
    var Scrollinftimer = Timer()
    var imageArraytitle = [String] ()
    var i=Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        imageArray1 = ["1","2","3","4"]
        imageArray = ["Groceries","Vegetables-1","meat-&-sea-food-con","Organic-1","Fruits _ Juices"]
        imageArraytitle = ["Groceries","Vegetables","meat &seafood","Organic","Fruits&Juices"]
        
        let firstFrame = CGRect(x: 0, y: 0, width: view.frame.width/2, height: view.frame.height)
        let firstLabel = UILabel(frame: firstFrame)
        firstLabel.text = "8th Cross,RT Nagar,Bangalore"
        //  navigationView.addSubview(firstLabel)
        navigationItem.titleView = firstLabel
        
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage (named: "location-pin-icon"), for: .normal)
        button.frame = CGRect(x: 30.0, y: 0.0, width: 35.0, height: 35.0)
        button.tintColor = .black
        
        button.addTarget(self, action: #selector(MapButtonClicked(sender:)), for: .touchUpInside)
        //button.addTarget(target, action: nil, for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        let barButtonItem = UIBarButtonItem(customView: button)
        
        self.navigationItem.leftBarButtonItems = [barButtonItem]
        
        let button2 = UIButton(type: .custom)
        button2.tintColor = .black
        button2.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        button2.setImage(UIImage (named: "cart-(-white-)-icon"), for: .normal)
        button2.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
        button2.addTarget(self, action: #selector(cartButtonClicked(sender:)), for: .touchUpInside)
        let barButtonItem2 = UIBarButtonItem(customView: button2)
        self.navigationItem.rightBarButtonItems = [barButtonItem2]
        
        getRandomColorsArray()
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(imageChange), userInfo: nil, repeats: true)
        
        
    }
    
    
    
    @objc func imageChange(){
        
        let cellSize = view.frame.size
        
        //get current content Offset of the Collection view
        let contentOffset = collectionView.contentOffset
        
        if collectionView.contentSize.width <= collectionView.contentOffset.x + cellSize.width
        {
            let r = CGRect(x: 0, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
            collectionView.scrollRectToVisible(r, animated: true)
            
        } else {
            let r = CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
            collectionView.scrollRectToVisible(r, animated: true);
        }
        
    }
    
    @objc func cartButtonClicked(sender: UIBarButtonItem) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "CartStoryboard", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AddCartViewController") as! AddCartViewController
        self.navigationController?.show(nextViewController, sender: nil)
        
    }
    
    
    @objc func MapButtonClicked(sender: UIBarButtonItem) {
        
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                print("No access")
                
                
                guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "ExamplePopupViewController") as? ExamplePopupViewController else { return }
                popupVC.height = 300
                popupVC.topCornerRadius = 35
                popupVC.presentDuration = 1.5
                popupVC.dismissDuration = 1.5
                popupVC.shouldDismissInteractivelty = true
                popupVC.popupDelegate = self
                present(popupVC, animated: true, completion: nil)
            case .authorizedAlways, .authorizedWhenInUse:
                
                guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "ExamplePopupViewController") as? ExamplePopupViewController else { return }
                popupVC.height = 534.49
                popupVC.topCornerRadius = 35
                popupVC.presentDuration =  0.51
                popupVC.dismissDuration = 0.51
                popupVC.shouldDismissInteractivelty = true
                popupVC.popupDelegate = self
                present(popupVC, animated: true, completion: nil)
                
                
                print("Access")
            @unknown default:
                break
            }
        } else {
            
            if let BUNDLE_IDENTIFIER = Bundle.main.bundleIdentifier,
                let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(BUNDLE_IDENTIFIER)") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            
        }
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //   self.view.endEditing(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //enable disable gps
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
                
                
                return cell
                
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as? CustomListCollectionViewCell1
            {
                
//                cell.contentView.layer.cornerRadius = 2.0
//                    cell.contentView.layer.borderWidth = 1.0
//                    cell.contentView.layer.borderColor = UIColor.clear.cgColor
//                    cell.contentView.layer.masksToBounds = true
//
//                    cell.layer.backgroundColor = UIColor.white.cgColor
//                    cell.layer.shadowColor = UIColor.gray.cgColor
//                    cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
//                    cell.layer.shadowRadius = 2.0
//                    cell.layer.shadowOpacity = 1.0
//                    cell.layer.masksToBounds = false
//                    cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
//
                
                
          
                cell.contentView.layer.cornerRadius = 10.0
                   cell.contentView.layer.borderWidth = 1.0
                   cell.contentView.layer.borderColor = UIColor.clear.cgColor
                   cell.contentView.layer.masksToBounds = true;

                cell.layer.shadowColor = UIColor(red:243/255, green: 243/255, blue: 248/255, alpha: 1).cgColor
                   cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
                   cell.layer.shadowRadius = 2.0
                   cell.layer.shadowOpacity = 1.0
                   cell.layer.masksToBounds = false;
                   cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath

                
                
                 //cell.backgroundColor = .white
                let randomNumber = Int(arc4random_uniform(UInt32(imageArraytitle.count)))
                cell.itemImage1.image = UIImage(named: imageArray[indexPath.row])
                //    let image = imageArray[indexPath.row]
                cell.ItemNameLabel.text = imageArraytitle[indexPath.row]
                cell.itemImage1.backgroundColor = self.colorsArray[randomNumber]
                return cell
                
            }
        }
        return UICollectionViewCell()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("this is not clling")
        
        
        if collectionView == self.collectionView2 {
            
            if indexPath.row == 0{
                let storyBoard : UIStoryboard = UIStoryboard(name: "ListOfStoresStoryboard", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ListOfStoresViewController") as! ListOfStoresViewController
                self.navigationController?.show(nextViewController, sender: nil)
                
            }else if indexPath.row == 1
            {
                let storyBoard : UIStoryboard = UIStoryboard(name: "ListOfStoresStoryboard", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ListOfStoresViewController") as! ListOfStoresViewController
                self.navigationController?.show(nextViewController, sender: nil)
            } else {
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
    
    
    
    @IBAction func DeliveryButtonclick(_ sender: UIButton) {
        
        DeliveryButton.backgroundColor = .clear
        DeliveryButton.layer.cornerRadius = 5
        DeliveryButton.layer.borderWidth = 0.5
        //        DeliveryButton.layer.borderColor =  Constants.BL_lightLineColor
        selfpickupButton.backgroundColor = .clear
        selfpickupButton.layer.cornerRadius = 5
        selfpickupButton.layer.borderWidth = 0.5
        //             selfpickupButton.layer.borderColor = Constants.BL_lightLineColor
        
        DeliveryButton.setTitleColor(Constants.BM_White, for: .normal)
        DeliveryButton.backgroundColor = Constants.BM_Default
        selfpickupButton.setTitleColor(Constants.BM_Default, for: .normal)
        
        selfpickupButton.backgroundColor = Constants.BM_White
        print("this click")
        
        
    }
    
    
    
    
    
    @IBAction func Selfpickup(_ sender: UIButton) {
        
        DeliveryButton.backgroundColor = .clear
        DeliveryButton.layer.cornerRadius = 5
        DeliveryButton.layer.borderWidth = 0.5
        
        DeliveryButton.setTitleColor(Constants.BM_Default, for: .normal)
        DeliveryButton.backgroundColor = Constants.BM_White
        selfpickupButton.setTitleColor(Constants.BM_White, for: .normal)
        selfpickupButton.backgroundColor = Constants.BM_Default
        
        //  selfpickupButton.backgroundColor = KCFonts.BM_Default
        //DeliveryButton.backgroundColor = KCFonts.BM_White
        print("this click")
    }
    
    
    
}





extension HomepageViewController: BottomPopupDelegate {
    
    func bottomPopupViewLoaded() {
        print("bottomPopupViewLoaded")
    }
    
    func bottomPopupWillAppear() {
        print("bottomPopupWillAppear")
    }
    
    func bottomPopupDidAppear() {
        print("bottomPopupDidAppear")
    }
    
    func bottomPopupWillDismiss() {
        print("bottomPopupWillDismiss")
    }
    
    func bottomPopupDidDismiss() {
        print("bottomPopupDidDismiss")
    }
    
    func bottomPopupDismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat) {
        print("bottomPopupDismissInteractionPercentChanged fromValue: \(oldValue) to: \(newValue)")
    }
}



