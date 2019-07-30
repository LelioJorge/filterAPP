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
    
    func jsonParser() {
        let urlPath = "https://api.deezer.com/album/302127"
        let endpoint = URL(string: urlPath)
        URLSession.shared.dataTask(with: endpoint!) { (data, response, error) in
            do {
                guard let data = data else {return}
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else {
                    throw JSONError.ConversionFailed
                }
                print(json["release_date"]!)
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
    }
    
}
