//
//  ViewController.swift
//  TableViewDemo
//
//  Created by TranTPhuong on 12/21/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
//    var wordArr:Array<Array<String>> = [["Saigon","Hanoi"],["Danang","Haiphong"], ["Nhatrang", "Cantho"]]
//    var imgArr:Array<Array<String>> = [["1","2"],["3","4"],["5","6"]]
    
    var arrPokemon:Array<Array<Pokemon>> = [[Pokemon(name: "Saigon", img: "3"), Pokemon(name: "Hanoi", img: "1")], [Pokemon(name: "Nhatrang", img: "2"), Pokemon(name: "Cantho", img: "4")], [Pokemon(name: "Camau", img: "5")]]
    let sectionArr:Array<String> = ["1", "2", "3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPokemon[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // nhuoc diem, neu la dung du lieu tai ve, thi moi lan scroll man hinh, giai phong cell, ton du lieu tai
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let pokemon:Pokemon = arrPokemon[indexPath.section][indexPath.row]
        cell.lblName.text = pokemon.name
        cell.imgView.image = UIImage(named: pokemon.img)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(wordArr[indexPath.row])
        let manhinh2:ManHinh2VC = storyboard?.instantiateViewController(withIdentifier: "manhinh2") as! ManHinh2VC
        let pokemon:Pokemon = arrPokemon[indexPath.section][indexPath.row]
        manhinh2.name = pokemon.name
        manhinh2.imageName = pokemon.img
        self.navigationController?.pushViewController(manhinh2, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrPokemon.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section"
//    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        // ung dung willDisplay de lam animation
//        cell.alpha = 0
//        cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, -view.frame.size.height, 0)
//        // cell.layer.transform = CATransform3DRotate(CATransform3DIdentity, CGFloat(M_PI), 0, 0, 1)
//        cell.layer.transform = CATransform3DScale(CATransform3DIdentity, <#T##sx: CGFloat##CGFloat#>, <#T##sy: CGFloat##CGFloat#>, 0)
//        
//        UIView.animate(withDuration: 2, animations: {
//            cell.alpha = 1
//            cell.layer.transform = CATransform3DIdentity
//        })
//    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // cho phep vuot tu mep tren cell de hien thi cac nut tuong ung cho cac function
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delBtn = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler: {(rowact, index) in
            print("delete")
            self.arrPokemon[index.section].remove(at: index.row)
            
            self.tableView.reloadSections(IndexSet.init(integer: index.section), with: UITableViewRowAnimation.automatic)
        })
        
        let shareBtn = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: {(rowact, index) in
            print("share")
        })
        
        let editBtn = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Edit", handler: {(rowact, index) in
            print("edit")
        })
        
        shareBtn.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        editBtn.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        // delBtn co the doi mau neu dung delBtn.backgroundColor
        return [delBtn, shareBtn, editBtn]
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // rut trich current cell de insert sau khi move
        let currentCell = arrPokemon[sourceIndexPath.section][sourceIndexPath.row]
        
        // xoa currentCell khoi mang
        arrPokemon[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        
        // chen currentCell vao vi tri cua cell vua duoc moved
        arrPokemon[destinationIndexPath.section].insert(currentCell, at: destinationIndexPath.row)
        
    }

    @IBAction func editBtnPressed(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    
  
}


