//
//  Song.swift
//  ZingLayoutClone
//
//  Created by TranTPhuong on 12/26/16.
//  Copyright © 2016 Nearby Host. All rights reserved.
//

import UIKit

struct Song {
    var songId: String
    var songName: String
    var songImg: String
    var lyric: String
    
    init() {
        songId = ""
        songName = ""
        songImg = ""
        lyric = ""
    }
    
    init(songId: String, songName: String, songImg: String, lyric: String) {
        self.songId = songId
        self.songName = songName
        self.songImg = songImg
        self.lyric = lyric
    }
}
