//
//  ViewController.swift
//  WebServiceDemo
//
//  Created by TranTPhuong on 1/2/17.
//  Copyright © 2017 Trunky Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrSong:Array<Song> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        
        let url = URL(string: "http://hidaacademy.com/dataJson.json")
//        let queue = DispatchQueue(label: "queue")
//        queue.async {
//            do {
//                let data = try Data(contentsOf: url!)
//                // convert data into string
//                //            let dataString = String(data: data, encoding: .utf8)
//                let dataInJSONFormat = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                print(dataInJSONFormat)
//            } catch {
//                print("error")
//            }
//        }
        
        // lay data thong qua session, ban than no tu da luong san
        let session = URLSession.shared
        // lay data thong qua url
        session.dataTask(with: url!, completionHandler: {
            (data, response, err) in
//            print(data, response, err)
            
            do {
                let dataInJSONFormat:Array<AnyObject> = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<AnyObject>
                print(dataInJSONFormat)
                
                for object in dataInJSONFormat {
                    let song = Song(object: object)
                    self.arrSong.append(song)
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print("error")
            }
            
        }).resume()
       
    }



}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSong.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = arrSong[indexPath.row].songTitle
        return cell!
    }
}
