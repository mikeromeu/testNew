//
//  ViewController.swift
//  ExampleMapKit
//
//  Created by Consultant on 4/14/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!

    var heroes: Welcome?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        fetchJSON {
            [unowned self] in
                self.mainTableView.reloadData()
        }
        // Need a pause to give time for API fetch to finish
        sleep(1)
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    func fetchJSON(completed: @escaping ()->()) {

        // Step 1: Setup of url
        guard let url = URL(string: "https://randomuser.me/api/?results=50") else { return }

        // Step 2: Create a url Singleton session
        let session = URLSession.shared

        // Step 3: create task to use both the created singleton session and the url
        let task = session.dataTask(with: url, completionHandler: { data, response, error in

            // guard test if error is equal to nil otherwise print the error message or default message
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "Something happened here")")
                return
            }

            // guard test that http response is within the 'good' range otherwise print error
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("server error!")
                return
            }

            // guard test that data is not equal to nil or in otherwords is equal to some value else print message of no data
            guard data != nil else {
                print("Error: We have no data returned from API call")
                return
            }

            do {
                // instead of first serializing the json with JSONSerialization class or associated functions we can instead let the instance of our array of heroes hold the decoded data directly.
                self.heroes = try JSONDecoder().decode(Welcome.self, from: data!)

                DispatchQueue.main.async { [self] in
                    // here we call the closure to indicate this is where the results of the fetch should be used
                    print("DispatchQue heroes count = \(heroes!.results.count)")
                    completed()
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        })
        task.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Currently coded to retiurn count via number of results in heroes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("tableview heroes count = \(self.heroes!.results.count)")
        
        return heroes!.results.count
    }
    
    // Setting up tableview to interact with cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
//        print("tableview÷ heroes thumbnail = \(heroes!.results[indexPath.row].picture.thumbnail)")
        
        // filling image to cell
        cell.imageView?.getImage(from: URL(string: heroes!.results[indexPath.row].picture.thumbnail)!)
        cell.reloadInputViews()
        
        // testing current row count
        print("tableview row = \(indexPath.row)")
        
        // working on updating the text field
        cell.textLabel?.text = "\(heroes!.results[indexPath.row].name.first) \(heroes!.results[indexPath.row].name.last)"
        
        return cell
    }
    
    // Currently hard coded to print the indexpath number of the row selected by user
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Selected row \(indexPath), was selected")
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueOne", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueOne") {
                // pass data to next view
                
            }
    }
    
    
    
}

