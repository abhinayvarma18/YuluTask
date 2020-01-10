//
//  ViewController.swift
//  YuluTask
//
//  Created by Abhinay Varma on 10/01/20.
//  Copyright © 2020 Abhinay Varma. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    
    var viewModel = MainViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideErrorView()
        initializeSetup()
        viewModel.getDataFromInputFile(fileName: "InputData") { [weak self](errorString) in
            if(errorString == "") {
                self?.leftTableView.reloadData()
                self?.rightTableView.reloadData()
            }else {
                self?.showErrorView(withText: errorString)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func hideErrorView() {
        errorView.isHidden = true
        errorLabel.text = ""
        errorLabel.isHidden = true
    }
    
    func showErrorView(withText:String?) {
        errorView.isHidden = false
        errorLabel.isHidden = false
        errorLabel.text = withText ?? Constants.defaultErrorString
    }
    
    func initializeSetup() {
        leftTableView.tag = 1
        rightTableView.tag = 2
        leftTableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.tableViewCellIdentifier)
        rightTableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.tableViewCellIdentifier)
        leftTableView.dataSource = viewModel
        rightTableView.dataSource = viewModel
        leftTableView.layer.masksToBounds = true
        leftTableView.layer.borderColor = AppColors.leftTableColor
        leftTableView.layer.borderWidth = 1.0
        
        rightTableView.layer.masksToBounds = true
        rightTableView.layer.borderColor = AppColors.rightTableColor
        rightTableView.layer.borderWidth = 2.0
    }


}

