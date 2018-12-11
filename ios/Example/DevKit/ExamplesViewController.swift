//
//  ViewController.swift
//  DevKit
//
//  Created by jgsamudio on 05/03/2018.
//  Copyright (c) 2018 Prolific Interactive. All rights reserved.
//

import UIKit
import DevKit

final class ExamplesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Example's"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "FormValidator"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "FormValidatorController")
        navigationController?.pushViewController(controller, animated: true)
    }
}

