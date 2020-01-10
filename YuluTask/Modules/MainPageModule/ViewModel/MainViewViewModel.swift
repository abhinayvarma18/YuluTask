//
//  MainViewViewModel.swift
//  YuluTask
//
//  Created by Abhinay Varma on 10/01/20.
//  Copyright © 2020 Abhinay Varma. All rights reserved.
//

import Foundation
import UIKit

class MainViewViewModel: NSObject {
    
    var models:[DataModel]?
    
    
    override init() {
        super.init()
    }
    
    func getDataFromInputFile(fileName:String, completion:@escaping (String) -> Void) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let result = try decoder.decode(InputFileData.self, from: data)
                models = result.data
                completion("")
            } catch {
                completion("error parsing data from input file")
                print(error)
            }
        }
    }
    
    
}

extension MainViewViewModel:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView.tag == 1) {
            if let count = models?.count {
                return count > 20 ? 20 : count
            }
            return 0
        }
        
        if let count = models?.count {
            return count > 20 ? count - 20 : 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellIdentifier, for: indexPath) as? MainTableViewCell
        if(tableView.tag == 1) {
            cell?.updateDataWithModel(self.models?[indexPath.row])
        }else {
            cell?.updateDataWithModel(self.models?[20+indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
    
}
