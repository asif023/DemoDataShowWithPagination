//
//  DataShowDetailViewController.swift
//  DemoDataShowWithPagination
//
//  Created by WemoAshif on 29/05/24.
//

import UIKit

class DataShowDetailViewController: UIViewController {
    @IBOutlet weak var lblId:UILabel!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblDetail:UILabel!
    var dataModel:DataModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }
    func setData(){
        self.lblId.text = "\(dataModel?.id ?? 0)"
        self.lblTitle.text = dataModel?.title ?? ""
        self.lblDetail.text = dataModel?.body ?? ""
    }

}
