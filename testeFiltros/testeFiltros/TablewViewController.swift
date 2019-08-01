//
//  TablewViewController.swift
//  testeFiltros
//
//  Created by Lelio Jorge Junior on 30/07/19.
//  Copyright © 2019 Lelio Jorge Junior. All rights reserved.
//

import UIKit



class TableViewController: UITableViewController {
    let api1 = NetworkApi()

    var playlists = [Playlist]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        api1.jsonParser(completion: receiveAlbum)
    }
    
    func receiveAlbum(_ playlist: Playlist) {
        self.playlists.append(playlist)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playlists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        let playlist = self.playlists[indexPath.row]
        let data = playlist.tracks.data[0].artist.name
        cell?.name = data
        return cell!
    }
    
}


