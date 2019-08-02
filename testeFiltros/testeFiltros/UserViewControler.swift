//
//  CollectionViewController.swift
//  testeFiltros
//
//  Created by Lelio Jorge Junior on 01/08/19.
//  Copyright © 2019 Lelio Jorge Junior. All rights reserved.
//

import UIKit

class UserViewControler: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
   
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
 
    let apiSearch = NetworkApi()
    var users = [User]()
//        didSet{
//            self.searchCollectionView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
//        apiSearch.jsonParserUser(completion: printData)
        
            self.apiSearch.taskUser(completion: { data in
                self.printData(data)
                DispatchQueue.main.async {
                    self.searchCollectionView.reloadData()
                }
            })

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
    func printData(_ user: User){
        self.users.append(user)
        print(users[0].id)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count < 1 ? 0:users.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        guard let id = cell?.id else {return}
        print(id)
//        performSegue(withIdentifier: "eu nao sei", sender: id)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "eu nao sei"{
            // TERMINAR ISSO AQUI
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell
        apiSearch.requestImage(urlPath: users[indexPath.row].picture_medium, completion: { data in
            DispatchQueue.main.async {
                cell?.image = data
            }
        })
        cell?.textName = users[indexPath.row].name
        cell?.id = users[indexPath.row].id
        return cell!
    }
    
}
