//
//  MainViewController.swift
//  DemoDataShowWithPagination
//
//  Created by WemoAshif on 28/05/24.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var tableView:UITableView!
    var dataShowVM = DataShowViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    private func initialSetup(){
        self.tableView.register(UINib(nibName: "DataShowTableViewCell", bundle: nil), forCellReuseIdentifier: "DataShowTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.dataShowVM.mainVc = self
        self.dataShowVM.loadPosts()
    }
   
}
extension MainViewController:UITableViewDelegate,UITableViewDataSource{
    
    //MARK: UITableViewDataSource Methods
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.dataShowVM.dataModel.count
        }
    
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataShowTableViewCell", for: indexPath) as! DataShowTableViewCell
            let post = self.dataShowVM.dataModel[indexPath.row]
             cell.item = post
             performHeavyComputation(for: post) { detail in
                    cell.lblTimeComputation?.text = detail
                }
            return cell
        }
    
    //MARK: UITableViewDelegate Methods
         func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if indexPath.row == self.dataShowVM.dataModel.count - 1 {
                self.dataShowVM.loadPosts()
            }
             
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DataShowDetailViewController") as! DataShowDetailViewController
        let post = self.dataShowVM.dataModel[indexPath.row]
        vc.dataModel = post
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func performHeavyComputation(for post: DataModel, completion: @escaping (String) -> Void) {
            DispatchQueue.global(qos: .userInitiated).async {
                let startTime = CFAbsoluteTimeGetCurrent()
                
                // Simulate heavy computation
                let result = "Processed=> \(post.title ?? "")"
                sleep(2)  // Simulate a delay
                
                let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
                print("Time taken for computation: \(timeElapsed) seconds")
                
                DispatchQueue.main.async {
                    completion(result)
                }
            }
        }

}
