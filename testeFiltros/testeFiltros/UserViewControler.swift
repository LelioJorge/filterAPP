//
//  CollectionViewController.swift
//  testeFiltros
//
//  Created by Lelio Jorge Junior on 01/08/19.
//  Copyright © 2019 Lelio Jorge Junior. All rights reserved.
//

import UIKit

class UserViewControler: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
   
    @IBOutlet weak var searchUserName: UISearchBar!
    @IBOutlet weak var searchCollectionView: UICollectionView!

    let apiSearch = NetworkApi()
    var users = [User]()
    var searchUser = [User]()

//        didSet{
//            self.searchCollectionView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        searchUserName.delegate = self
//        apiSearch.jsonParserUser(completion: printData)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func printData(_ user: UserData){
//        if user.data.filter({$0.name.prefix(users[0].name.count) == users[0].name}){
//
//        }

        for user in user.data {
            self.users.append(user)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchUser.count < 1 ? 0:searchUser.count
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
        apiSearch.requestImage(urlPath: searchUser[indexPath.row].picture_medium, completion: { data in
            DispatchQueue.main.async {
                cell?.image = data
            }
        })
        cell?.textName = searchUser[indexPath.row].name
        cell?.id = searchUser[indexPath.row].id
        return cell!
    }
    
}
extension UserViewControler: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.apiSearch.taskUser(urlPath: "https://api.deezer.com/search/user?q=\(searchText)") { data in
            DispatchQueue.main.async {
                self.printData(data)
                self.searchUser.removeAll()
                self.searchUser = self.users.filter({$0.name.prefix(searchText.count) == searchText})
                self.searchCollectionView.reloadData()
            }
            
        }
    }
}
