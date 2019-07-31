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

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //let resutado: = self.api1.jsonParser()
        
        print(self.api1.jsonParser(),"4")
        sleep(3000)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        let album = api1.jsonParser()
        print(album,"2")
        cell?.name = "ok"
        return cell!
    }
    
}


