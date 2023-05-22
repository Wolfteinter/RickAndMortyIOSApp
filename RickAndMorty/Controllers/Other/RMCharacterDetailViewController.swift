//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Wolfteinter on 21/05/23.
//

import UIKit

final class RMCharacterDetailViewController: UIViewController{
    private let viewModel: RMCharacterDetailsViewViewModel
    
    init(viewModel: RMCharacterDetailsViewViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder){
        fatalError("Unsopported")
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title 
    }
}
