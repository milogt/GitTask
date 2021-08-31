//
//  OpenViewController.swift
//  GitTasks
//
//  Created by Guo Tian on 1/27/21.
//

import UIKit

class OpenViewController: UITableViewController {
    var issues = [GitHubIssue]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        GitHubClient.fetchIssues(state: "open") { (releases, error) in
            guard let releases = releases, error == nil else {
                print(error!)
                return
            }
            self.issues = releases
            self.tableView.reloadData()
        }
    }
    
    //tab bar controller settings refer to
    //https://www.hackingwithswift.com/read/7/2/creating-the-basic-ui-uitabbarcontroller
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OpenIssues", for: indexPath) as! IssueTableViewCell
        cell.configure(with: issues[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "Detail") as? IssueDetailViewController
        vc?.config(with: issues[indexPath.row])
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
