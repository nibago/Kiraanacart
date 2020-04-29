//
//  ManageAddressViewController.swift
//  Kiraanacart
//
//  Created by CHINNA on 19/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit
import CoreLocation

class ManageAddressViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var Tableiview: UITableView!
    
    @IBOutlet weak var CurrenImageLabel: UILabel!
    
    @IBOutlet weak var CurrentIconImage: UIImageView!
    
    @IBOutlet weak var CurrentAddressButton: UIButton!
    let Address1 = ["Home","Office"]
    let Address2 = ["345,10Th Cross, Ganga Nagar,RT Nagar,Bangalore,560032","345,10Th Cross, Sandyapalayout,Veernapalya,Bangalore,560045"]
    let check = ["uncheck","uncheck"]
    
    var addressString:String = ""
    
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "ManageAddress"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        let button2 = UIButton(type: .custom)
        button2.tintColor = .systemGreen
        button2.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
        button2.setImage(UIImage (named: "cart-(-white-)-icon"), for: .normal)
        button2.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
        let barButtonItem2 = UIBarButtonItem(customView: button2)
        self.navigationItem.rightBarButtonItems = [barButtonItem2]
        
        CurrentIconImage.tintColor =   .black
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Address1.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ManageTableViewCell
        cell.AddressLable1.text = Address1[indexPath.row]
        cell.addressLable2.text = Address2[indexPath.row]
        cell.selectImages.image = UIImage(named:check[indexPath.row] )
        cell.selectImages.tintColor = Constants.BM_Default
        cell.selectionStyle = .none
        cell.editButton.addTarget(self, action: #selector(ManageAddressViewController.editButtonClick(_:)), for: .touchUpInside)
        return cell
        
    }
    
    @objc func editButtonClick(_ sender: AnyObject) {
        
        //    CurrentAddressButton.backgroundColor = const
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 119
    }
    
    
    
    
    
    
    @IBAction func CurrentLocationButtonclick(_ sender: UIButton) {
        
        //  locationManager.startUpdatingLocation()
        
        CurrentIconImage.tintColor =   Constants.BM_Default
        CurrenImageLabel.textColor =  Constants.BM_Default
        //        CurrentIconImage.backgroundColor = Constants.BM_Default
        let latvalues = "13.0272,77.5939"
        
        performGoogleSearch(string:latvalues )
        
        
        
        //        Toast(text: "text", duration: Delay.long)
        
        
        
        
    }
    
    
    @IBAction func addressButtonClick(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "AddAddressStoryboard", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AddAddressViewController") as! AddAddressViewController
        self.navigationController?.show(nextViewController, sender: true)
        
        
        
    }
    
    
    
    func performGoogleSearch(string: String) {
        // string = ""
        //  tableView.reloadData()
        
        var components = URLComponents(string: "https://maps.googleapis.com/maps/api/geocode/json")!
        let key = URLQueryItem(name: "key", value: "AIzaSyAFLOApaH_UAxWRuWIKIiukF8kQZ2xu3MI") // use your key
        let address = URLQueryItem(name: "address", value: string)
        components.queryItems = [key, address]
        
        let task = URLSession.shared.dataTask(with: components.url!) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, error == nil else {
                print(String(describing: response))
                print(String(describing: error))
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] else {
                print("not JSON format expected")
                print(String(data: data, encoding: .utf8) ?? "Not string?!?")
                return
            }
            
            guard let results = json["results"] as? [[String: Any]],
                let status = json["status"] as? String,
                status == "OK" else {
                    print("no results")
                    print(String(describing: json))
                    return
            }
            
            DispatchQueue.main.async {
                // now do something with the results, e.g. grab `formatted_address`:
                let stringsvalues = results.compactMap { $0["formatted_address"] as? String
                    
                    
                }
                
                if let addressStringval = stringsvalues.first {
                    
                    self.addressString = addressStringval
                    print("this is addrss ",self.addressString)
                    self.view.makeToast(self.addressString, duration: 3.0, position: .top)
                }
                // print(stringsvalues.first)
                
            }
        }
        
        task.resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath)as? ManageTableViewCell{
            cell.selectImages.tintColor = Constants.BM_Default
            cell.selectImages.image = UIImage(named: "check")
            
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath)as? ManageTableViewCell{
            cell.selectImages.image = UIImage(named: "uncheck")
        }
    }
    
    
}



extension ManageAddressViewController:CLLocationManagerDelegate
{
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        //   self.labelLat.text = "\(userLocation.coordinate.latitude)"
        //  self.labelLongi.text = "\(userLocation.coordinate.longitude)"
        var address :String = ""
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if (error != nil){
                print("error in reverseGeocode")
            }
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count>0{
            let placemark = placemarks![0]
                
            }
        }
        
        print("address",address)
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
    
    
    
}
