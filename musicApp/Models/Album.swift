//
//  Album.swift
//  musicApp
//
//  Created by Георгий on 09.12.2021.
//

import Foundation

struct Album {
    var name: String
    var image: String
    var songs: [Song]
}

extension Album {
    static func get() -> [Album] {
        return [
            Album(name: "Acoustic", image: "acoustic", songs: [
            Song(name: "Acoustic breeze", image: "acoustic", artist: "Bensound", fileName: "bensound-acousticbreeze"),
            Song(name: "Buddy", image: "acoustic", artist: "Bensound", fileName: "bensound-buddy"),
            Song(name: "Cute", image: "acoustic", artist: "Bensound", fileName: "bensound-cute")
            ]),
            
            Album(name: "Cinematic", image: "cinematic", songs: [
            Song(name: "Better days", image: "cinematic", artist: "Bensound", fileName: "bensound-betterdays"),
            Song(name: "Epic", image: "cinematic", artist: "Bensound", fileName: "bensound-epic"),
            Song(name: "Memories", image: "cinematic", artist: "Bensound", fileName: "bensound-memories")
            ]),
            
            Album(name: "Jazz", image: "jazz", songs: [
            Song(name: "All that", image: "jazz", artist: "Bensound", fileName: "bensound-allthat"),
            Song(name: "Jazzy Frenchy", image: "jazz", artist: "Bensound", fileName: "bensound-jazzyfrenchy"),
            Song(name: "The Jazz Piano", image: "jazz", artist: "Bensound", fileName: "bensound-thejazzpiano")
            ])
        ]
    }
}
