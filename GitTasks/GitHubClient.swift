//
//  GitHubClient.swift
//  GitTasks
//
//  Created by Guo Tian on 1/28/21.
//

import Foundation

// GitHubClient class refer to example code
struct GitHubIssue: Codable {
    let title: String
    let createdAt: String
    let body: String?
    let state: String
    let user: GitHubUser
}

struct GitHubUser: Codable {
    let login: String
}

class GitHubClient {

    static func fetchIssues(state:String, completion: @escaping ([GitHubIssue]?, Error?) -> Void) {
        let url = URL(string: "https://api.github.com/repos/mikecao/umami/issues?state=\(state)")!

        let task = URLSession.shared.dataTask(with: url) { data, _, error in

            guard let data = data, error == nil else {
                DispatchQueue.main.async { completion(nil, error) }
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let issues = try decoder.decode([GitHubIssue].self, from: data)
                DispatchQueue.main.async { completion(issues, nil) }
            } catch (let parsingError) {
                DispatchQueue.main.async { completion(nil, parsingError) }
            }
        }

        task.resume()
    }
}
