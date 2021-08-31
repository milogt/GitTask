//
//  IssueDetailViewController.swift
//  GitTasks
//
//  Created by Guo Tian on 1/28/21.
//

import UIKit

class IssueDetailViewController: UIViewController {
    @IBOutlet weak var issueTitle: UILabel!
    @IBOutlet weak var issueUser: UILabel!
    @IBOutlet weak var issueDate: UILabel!
    @IBOutlet weak var stateIcon: UIImageView!
    @IBOutlet weak var issueText: UITextView!
    
    var titlename: String = ""
    var username: String = ""
    var date: String = ""
    var textbody: String = ""
    var icon = UIImage()
    
    let dateFormatterGet = DateFormatter()
    let dateFormatterPrint = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        issueTitle.text = titlename
        issueUser.text = username
        issueDate.text = date
        issueText.text = textbody
        stateIcon.image = icon
    }
    
    func config(with issue:GitHubIssue){
        // date format code refer to
        // https://developer.apple.com/documentation/foundation/dateformatter
        // https://stackoverflow.com/questions/35700281/date-format-in-swift
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"
        let newDate: Date? = dateFormatterGet.date(from: issue.createdAt)

        titlename = issue.title
        username = "@" + issue.user.login
        date = dateFormatterPrint.string(from: newDate!)
        textbody = issue.body!
        if issue.state == "open"{
            icon = UIImage(systemName: "paperplane.fill")!
        }
        else {
            icon = UIImage(systemName: "paperplane")!
        }
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
