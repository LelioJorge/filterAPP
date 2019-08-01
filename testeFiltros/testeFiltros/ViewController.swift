//
//  ViewController.swift
//  testeFiltros
//
//  Created by Lelio Jorge Junior on 30/07/19.
//  Copyright © 2019 Lelio Jorge Junior. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let api = NetworkApi()
    
    var playlists = [Playlist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        api.jsonParser(completion: receiveAlbum)
    }
    
//    func receiveAlbum(_ playlist: Playlist) {
//        self.playlists.append(playlist)
//        
//    }

    @IBAction func nextScreen(_ sender: Any) {
        performSegue(withIdentifier: "passPlaylistData", sender: self)
    }
    
    
}

