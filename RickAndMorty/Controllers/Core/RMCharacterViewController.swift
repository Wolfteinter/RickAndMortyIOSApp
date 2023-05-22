//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Wolfteinter on 13/02/23.
//

import UIKit

final class RMCharacterViewController: UIViewController, CharacterListViewDelegate {

    private let characterListView = CharacterListView()
    
    override func viewDidLoad() {
        characterListView.delegate = self
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func rmCharacterListView(_ characterListView: CharacterListView, didSelectCharacter character: RMCharacter) {
        let viewModel = RMCharacterDetailsViewViewModel(character: character)
        let detailVC = RMCharacterDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
