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
    static var shareTableViewController = TableViewController(style: .grouped)
    override func viewDidLoad() {
        super.viewDidLoad()
        api1.jsonParser(completion: receiveAlbum)
    }
 
    

    func receiveAlbum(_ playlist: Playlist) {
        self.playlists.append(playlist)
        self.tableView.reloadData()
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        print("Rows: \(self.playlists.count)")
        return self.playlists.count < 1 ? 0 : self.playlists[0].tracks.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        print(playlists[0].tracks.data.count)
        let playlist = self.playlists[0]
        let data = playlist.tracks.data[indexPath.row].artist.name
        cell?.name = data
        return cell!
    }
    
}


