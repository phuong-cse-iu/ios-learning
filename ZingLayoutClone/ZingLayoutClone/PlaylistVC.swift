//
//  PlaylistVC.swift
//  ZingLayoutClone
//
//  Created by TranTPhuong on 12/26/16.
//  Copyright © 2016 Nearby Host. All rights reserved.
//

import UIKit

class PlaylistVC: UIViewController {

    var playList:Array<Song> = []
    
    @IBOutlet weak var tableViewPlaylist: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewPlaylist.delegate = self
        tableViewPlaylist.dataSource = self
        
        print(playList)
    }



}


extension PlaylistVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SongCell = tableView.dequeueReusableCell(withIdentifier: "SongCell") as! SongCell
        let song = playList[indexPath.row]
        cell.lblSongName.text = song.songName
        cell.imgSong.image = UIImage(named: song.songImg)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song:Song = playList[indexPath.row] 
        let playScreen:PlayVC = storyboard?.instantiateViewController(withIdentifier: "playScreen") as! PlayVC
        playScreen.song = song
       self.navigationController?.pushViewController(playScreen, animated: true)
    }
}
