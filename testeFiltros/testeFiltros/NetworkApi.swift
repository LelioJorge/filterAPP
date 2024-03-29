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
                let result = try decoder.decode(Playlist.self, from: data)
                completion(result)
                
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
        
    }
    
    
    
//    func taskUser(completion: @escaping (User) -> Void){
//        let urlPath = "https://api.deezer.com/search?q=eminem"
//        let endpoint = URL(string: urlPath)!
//
//        let task = URLSession.shared.dataTask(with: endpoint) { data, response, error in
//            completion(self.tratarResposta(data: data, response: response, error: error)!)
//        }
//        task.resume()
//
//    }
//
//
//    func tratarResposta(data: Data?, response: URLResponse?, error: Error?) -> User?{
//
//        let decoder = JSONDecoder()
//
//        do {
//            let result = try decoder.decode(User.self, from: data!)
//            print(result)
//            return result
//        } catch {
//            print(error)
//        }
//
//        return nil
//    }
    
    func requestImage(urlPath: String,completion: @escaping (Data) -> Void) {
        let endpoint = URL(string: urlPath)
        URLSession.shared.dataTask(with: endpoint!) { (data, response, error) in
            do {
                guard let data = data else {
                    throw JSONError.NoData
                }
                
                completion(data)
                
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
    }
    
    func taskUser(urlPath: String,completion: @escaping (UserData) -> Void) {
        guard let urlString = urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        let endpoint = URL(string: urlString)
        

        URLSession.shared.dataTask(with: endpoint!) { (data, response, error) in
            let decoder = JSONDecoder()
            do {
                guard let data = data else {
                    throw JSONError.NoData
                }
                
                let result = try decoder.decode(UserData.self, from: data)
                completion(result)
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
    }
    
}




