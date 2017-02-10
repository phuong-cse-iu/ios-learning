//
//  ViewController.swift
//  OntapTongHop
//
//  Created by TranTPhuong on 1/6/17.
//  Copyright © 2017 Trunky Foundation. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var txtSearchInput: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var arrTongquat:Array<String> = ["thoi trang nu", "thoi trang nam", "me va be", "giay dep"]
    var arrTam:Array<String> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        txtSearchInput.delegate = self
        // http://hidaacademy.com/baitap.json
        //http://www.namk61.890m.com/iosuploadImage.php
//        let url = URL(string: "http://hidaacademy.com/baitap.json")
//        let urlRequest = URLRequest(url: url!)
//        let session = URLSession.shared
//        session.dataTask(with: urlRequest, completionHandler: {
//            (data, response, error) in
//            do {
//                // tai object json ve
//                let object:Dictionary<String, AnyObject> = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, AnyObject>
//                
//                let result:Array<Dictionary<String, AnyObject>> = object["result"] as! Array<Dictionary<String, AnyObject>>
//                
//                for i in result {
//                    let arrChuoi = (i["categoryName"] as! String).components(separatedBy: " | ")
//                    if arrChuoi.count == 1 {
//                        self.arrTongquat.append(arrChuoi[0])
//                    }
//                }
//                print(self.arrTongquat)
//                
//                
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//                
//            } catch {
//                
//            }
//            
//        }).resume()
//        txtSearchInput.rx.text.throttle(5, scheduler: MainScheduler.instance).filter { ($0?.characters.count)! > 0 }.bindNext {
//            (a) in
////            self.arrTam = self.arrTongquat.filter{ $0.components(separatedBy: " ").joined()}
//            
//        }
        
        
        loadData(urlString: .getSong, param: nil, method: .get, completionHandler: {
            (object) in
            print(object)
        })
    }
    
    var search:String {
        return txtSearchInput.text!.components(separatedBy: " ").joined()
    }
    



}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = arrTam[indexPath.row]
        return cell!
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

