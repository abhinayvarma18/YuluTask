//
//  DataModel.swift
//  YuluTask
//
//  Created by Abhinay Varma on 10/01/20.
//  Copyright © 2020 Abhinay Varma. All rights reserved.
//

import Foundation


struct InputFileData:Codable {
    var data:[DataModel]?
}

struct DataModel:Codable {
    var title:String?
    var subtitle:String?
}


