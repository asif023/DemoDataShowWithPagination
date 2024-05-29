//
//  DataShowTableViewCell.swift
//  DemoDataShowWithPagination
//
//  Created by WemoAshif on 28/05/24.
//

import UIKit

class DataShowTableViewCell: UITableViewCell {
    @IBOutlet weak var lblId:UILabel!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblTimeComputation:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var item: DataModel? {
           didSet {
               // Update the cell's UI whenever the item is set
               self.lblId?.text = "\(self.item?.id ?? 0)"
               self.lblTitle.text = self.item?.title ?? ""
           }
       }
}
