//
//  HomeVC.swift
//  ZingLayoutClone
//
//  Created by TranTPhuong on 12/26/16.
//  Copyright © 2016 Nearby Host. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableViewMenu: UITableView!
//    let menuList:Array<Menu> = [Menu(menuId: "1", menuIcon: "music", menuTitle: "Songs", playList: [Song(songId: "1", songName: "Chac ai do se ve", songImg: "music", lyric: "Chac ai do se som quay lai thoi"), Song(songId: "2", songName: "Chac ai do se ve", songImg: "music", lyric: "Chac ai do se som quay lai thoi")]), Menu(menuId: "2", menuIcon: "playlist", menuTitle: "My Playlist", playList: [Song(songId: "1", songName: "Chac ai do se ve", songImg: "disc", lyric: "Chac ai do se som quay lai thoi"), Song(songId: "2", songName: "Chac ai do se ve", songImg: "music", lyric: "Chac ai do se som quay lai thoi")])]
    
    let database:Array<SectionMenu> = [SectionMenu(id: "1", title: "Offline Songs", list: [Menu(menuId: "1", menuIcon: "music", menuTitle: "Songs", playList: [Song(songId: "1", songName: "Chac ai do se ve", songImg: "music", lyric: "Chac ai do se som quay lai thoi"), Song(songId: "2", songName: "Chac ai do se ve", songImg: "music", lyric: "Chac ai do se som quay lai thoi")]), Menu(menuId: "2", menuIcon: "playlist", menuTitle: "My Playlist", playList: [Song(songId: "1", songName: "Chac ai do se ve", songImg: "disc", lyric: "Chac ai do se som quay lai thoi"), Song(songId: "2", songName: "Chac ai do se ve", songImg: "music", lyric: "Chac ai do se som quay lai thoi")])]), SectionMenu(id: "2", title: "Online Songs", list: [Menu(menuId: "1", menuIcon: "music", menuTitle: "US/UK", playList: [Song(songId: "1", songName: "Chac ai do se ve", songImg: "music", lyric: "Chac ai do se som quay lai thoi"), Song(songId: "2", songName: "Chac ai do se ve", songImg: "music", lyric: "Chac ai do se som quay lai thoi")]), Menu(menuId: "2", menuIcon: "playlist", menuTitle: "Top Hit", playList: [Song(songId: "1", songName: "Chac ai do se ve", songImg: "disc", lyric: "Chac ai do se som quay lai thoi"), Song(songId: "2", songName: "Chac ai do se ve", songImg: "music", lyric: "Chac ai do se som quay lai thoi")])])]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMenu.dataSource = self
        tableViewMenu.delegate = self
    }
}






extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database[section].menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MenuCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        let itemMenu = database[indexPath.section].menuList[indexPath.row]
        cell.imgMenu.image = UIImage(named: itemMenu.menuIcon)
        cell.lblMenu.text = itemMenu.menuTitle
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return database.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return database[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemMenu = database[indexPath.section].menuList[indexPath.row]
        let playListScreen: PlaylistVC = storyboard?.instantiateViewController(withIdentifier: "playlistScreen") as! PlaylistVC
        
        playListScreen.playList = itemMenu.playList
        self.navigationController?.pushViewController(playListScreen, animated: true)
    }
}
