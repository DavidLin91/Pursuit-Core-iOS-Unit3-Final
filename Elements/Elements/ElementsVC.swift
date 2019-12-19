//
//  ViewController.swift
//  Elements
//
//  Created by Alex Paul on 12/31/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ElementsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var elements = [AllElements]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    func loadData() {
        ElementsAPIClient.getElements { (result) in
            switch result {
            case .failure(let appError):
                print("app error: \(appError)")
            case .success(let data):
                self.elements = data
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let elementDVC = segue.destination as? DetailedElementsVC,
            let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("could not segue to DetailedElementsVC")
        }
        let element = elements[indexPath.row]
        elementDVC.elementsDetail = element
    }
    
}

extension ElementsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath) as? ElementCell else {
            fatalError("Could not dequeue to ElementCell")
        }
        let element = elements[indexPath.row]
        cell.configureCell(element: element)
        return cell
    }
}

extension ElementsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
