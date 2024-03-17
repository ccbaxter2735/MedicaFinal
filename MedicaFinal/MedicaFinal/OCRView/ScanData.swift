//
//  ScanData.swift
//  Medica
//
//  Created by Nayeff BOINARIZIKI on 12/03/2024.
//

import Foundation

struct ScanData:Identifiable {
    var id = UUID()
    let content:String
    
    init(content:String) {
        self.content = content
    }
}
