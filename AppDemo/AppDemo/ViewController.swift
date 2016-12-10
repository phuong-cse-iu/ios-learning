//
//  ViewController.swift
//  AppDemo
//
//  Created by TranTPhuong on 12/7/16.
//  Copyright © 2016 Nearby Host. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnRandom: UIButton!
    let arrImage = ["dog", "cat", "elephant", "bird"]
    
    let arrImageUrl:Array<String> = ["https://mobile.gamelandvn.com/wp-content/uploads/2016/07/006.png", "http://genknews.genkcdn.vn/k:2016/1-27-sandshrew-1468951494516/pokemongoneunhorodieunaybansegapduocpokemonmaminhmuon.png", "http://assets.pokemon.com/assets/cms2/img/pokedex/full//610.png", "http://cdn.kul.vn/data/article/2016/07/09/Articuno-1_1468063722.png", "http://www.ew.com/sites/default/files/styles/tout_image_612x380/public/i/2016/07/16/pokemon-evee.jpg?itok=DmFWMx3V"]
    
    var index:Int = 0
    
    func action() {
        index += 1
        if index == arrImageUrl.count{
            index = 0
        }
        
        slider.value = Float(index)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Timer doi tuong quan li thoi gian
        // scheduledTimer dinh thoi gian lam gi day
        // target refer to viewcontroller
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
        slider.minimumValue = Float(index)
        slider.maximumValue = Float(arrImageUrl.count - 1)
        slider.value = Float(index)
        // image.loadImage(name: arrImage[index])
        
        
        image.loadImageFromUrl(url: "http://cdn.kul.vn/data/article/2016/07/09/Articuno-1_1468063722.png")
        
        
        // layer quan li ve border cua button
        // core animation la su dung card do hoa
        
        
        btnOne.designButton(color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), boderWidth: 1, radius: 10)
        btnTwo.designButton(color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), boderWidth: 1, radius: 5)
        btnRandom.designButton(color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), boderWidth: 1, radius: 4)
        
    }
  
    

    @IBAction func btnBack(_ sender: Any) {
        index = index - 1
        
        if index < 0 {
            index = arrImageUrl.count - 1
        }
        
        image.loadImageFromUrl(url: arrImageUrl[index])
        
        slider.value = Float(index)
    }

    
    @IBAction func btnNext(_ sender: Any) {
        index += 1
        if index == arrImageUrl.count{
            index = 0
        }
        
        image.loadImageFromUrl(url: arrImageUrl[index])
        slider.value = Float(index)

    }
    
    @IBAction func abtnRandom(_ sender: Any) {
        index = Int(arc4random()) % arrImage.count
        
        image.loadImageFromUrl(url: arrImageUrl[index])
        
    
    }
    
    
    @IBAction func aslider(_ sender: Any) {
        image.loadImageFromUrl(url: arrImageUrl[Int(slider.value)])
    }
    
    
    
}

extension UIButton {
    
    func designButton(color: UIColor, boderWidth: CGFloat, radius: CGFloat) {
        
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = boderWidth
        self.layer.cornerRadius = radius
        self.tintColor = color
        
    }

}

extension UIImageView {
    func loadImage(name: String) {
        self.image = UIImage(named: name)
    }
    
    func loadImageFromUrl(url: String) {
        let url:URL = URL(string: url)!
        do {
            let data:Data = try Data(contentsOf: url)
            self.image = UIImage(data: data)
        } catch {
            print("error")
        }
    }
}

// Bai tap: Keo 3 thanh slider, moi thanh dai dien cho mot con thu. Cu mot giay phat sinh random, cho thu no nhich, neu thang nao toi cuoi cung thi thang
// lam animation bang timer 
