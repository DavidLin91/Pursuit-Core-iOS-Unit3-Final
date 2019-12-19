//
//  FavoritesVC.swift
//  Elements
//
//  Created by David Lin on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var favorites = [AllElements]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchFavorites()
    }
    
    
    private func fetchFavorites() {
        ElementsAPIClient.fetchFavorites { (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self.showAlert(title: "failed fetching favorites", message: "\(appError)")
                }
            case .success(let favorite):
                self.favorites = favorite.filter{$0.favoritedBy == "David"}
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let elementDVC = segue.destination as? DetailedElementsVC,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("could not segue to DetailedElementsVC")
        }
        let element = favorites[indexPath.row]
        elementDVC.elementsDetail = element
    }
    
}


extension FavoritesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? FavoritesCell else {
            fatalError("could not dequeue to FavoritesCell")
        }
        let favorite = favorites[indexPath.row]
        cell.configureCell(element: favorite)
        return cell
    }
}


extension FavoritesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
