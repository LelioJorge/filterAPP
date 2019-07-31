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

    var albums = [Album]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //let resutado: = self.api1.jsonParser()
        api1.jsonParser(completion: receiveAlbum)
//        api1.jsonParser(completion: {
//            self.albums.append(album)
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        })
//        [1, 2, 3].forEach({ print($0) })
        
    }
    
    func receiveAlbum(_ album: Album) {
        self.albums.append(album)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        let album = self.albums[indexPath.row]
        cell?.name = album.title
        return cell!
    }
    
}


