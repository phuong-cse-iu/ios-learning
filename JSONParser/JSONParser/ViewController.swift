//
//  ViewController.swift
//  JSONParser
//
//  Created by TranTPhuong on 1/4/17.
//  Copyright © 2017 Trunky Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://trantuanphuong.pe.hu/getdata.php?index=0&number=2")
        
        let urlRequest = URLRequest(url: url!)
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest, completionHandler: {
            (data, response, err) in
            do {
                let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                print(object)
            } catch {
                
            }
        }).resume()
        
        
        
        
    }



}

