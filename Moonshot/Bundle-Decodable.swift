//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Thaddeus Dronski on 12/22/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {

        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        //load in data from URL
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        //decode data from json to string of tye Astronaut struct
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
