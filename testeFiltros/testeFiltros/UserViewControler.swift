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
    
 

    let users = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        guard let id = cell?.id else {return}
        print(id)
        performSegue(withIdentifier: "eu nao sei", sender: id)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "eu nao sei"{
            // TERMINAR ISSO AQUI
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell
        cell?.image = "profile"
        cell?.textName = "Lelinho"
        cell?.id = 218
        return cell!
    }
    
}
