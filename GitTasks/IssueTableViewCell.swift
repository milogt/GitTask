//
//  IssueTableViewCell.swift
//  GitTasks
//
//  Created by Guo Tian on 1/28/21.
//

import UIKit

class IssueTableViewCell: UITableViewCell {
    @IBOutlet weak var openTitleLabel: UILabel!
    @IBOutlet weak var openUserLabel: UILabel!
    @IBOutlet weak var openIcon: UIImageView!
    
    @IBOutlet weak var closedTitleLabel: UILabel!
    @IBOutlet weak var closedUserLabel: UILabel!
    @IBOutlet weak var closedIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with issue:GitHubIssue){
        if issue.state == "open"{
            openTitleLabel.text = issue.title
            openUserLabel.text = "@" + issue.user.login
            openIcon.image = UIImage(systemName: "paperplane.fill")
        }
        else if issue.state == "closed"{
            closedTitleLabel.text = issue.title
            closedUserLabel.text = "@" + issue.user.login
            closedIcon.image = UIImage(systemName: "paperplane")
        }
    }
}
