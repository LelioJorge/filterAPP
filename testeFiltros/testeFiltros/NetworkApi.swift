//
//  NetworkApi.swift
//  testeFiltros
//
//  Created by Lelio Jorge Junior on 30/07/19.
//  Copyright © 2019 Lelio Jorge Junior. All rights reserved.
//

import Foundation

class NetworkApi {
    
    
    
    enum JSONError: String, Error {
        case NoData = "ERROR: no data"
        case ConversionFailed = "ERROR: conversion from JSON failed"
    }
    
    func jsonParser(completion: @escaping (Playlist) -> Void) {
        let urlPath = "https://api.deezer.com/playlist/908622995"
        let endpoint = URL(string: urlPath)
        URLSession.shared.dataTask(with: endpoint!) { (data, response, error) in
            let decoder = JSONDecoder()
            do {
                guard let data = data else {
                    throw JSONError.NoData
                }
                guard (try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]) != nil else {
                    throw JSONError.ConversionFailed
                }
                let result = try decoder.decode(Playlist.self, from: data)
                completion(result)

                
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
        }.resume()
    }
    
   
    
}
