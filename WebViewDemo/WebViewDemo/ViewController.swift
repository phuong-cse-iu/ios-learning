//
//  ViewController.swift
//  WebViewDemo
//
//  Created by TranTPhuong on 12/30/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet weak var txtField: UITextField!
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func loadWeb(link: String) {
        let url = URL(string: link)
        let urlRequest:URLRequest = URLRequest(url: url!)
        webView.loadRequest(urlRequest)
    }

   
    @IBAction func aBack(_ sender: Any) {
        webView.goBack()
    }
    
    

    @IBAction func aGo(_ sender: Any) {
        
        loadWeb(link: link)
    }
    
    var link:String {
        if txtField.text!.contains("http://") == true || txtField.text!.contains("https://") == true {
            return txtField.text!
        }
        return "http://\(txtField.text!)"
        var str: String = "a b c"
        
    }
    
    
    
    @IBOutlet weak var reloadBtnPressed: UIButton!

}

