//
//  RazeNetworking.swift
//  RazeCore
//
//  Created by umam on 6/16/20.
//

import Foundation

protocol NetworkSession {
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        let task = self.dataTask(with: url) { (data, _, error) in
            completionHandler(data, error)
        }
        task.resume()
    }
}

extension RazeCore {
    public class Networking {
        public class Manager {
            public init() {}
            
            internal var session: NetworkSession = URLSession.shared
            
            public func loadData(from url: URL, completionHandler: @escaping (NetworkResult<Data>) -> Void) {
                session.get(from: url) { (data, error) in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
            }
            
            public enum NetworkResult<Value> {
                case success(Value)
                case failure(Error?)
            }
        }
    }
}
