//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Wolfteinter on 25/04/23.
//

import UIKit

protocol CharacterListViewViewModelDelegate: AnyObject{
    func didLoadInitialCharacters()
    func didSelectCharacter(_ character: RMCharacter)
}

final class CharacterListViewViewModel: NSObject {
    
    public weak var delegate: CharacterListViewViewModelDelegate?
    
    private var characters : [RMCharacter] = []{
        didSet {
            for character in characters {
                let viewModel  = RMCharacterCollectionViewCellViewModel(
                    characterName: character.name, characterStatus: character.status, characterImageUrl: URL(string: character.image)
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
    private var apiInfo: RMGetAllCharactersResponse.Info? = nil
    
    
    func fetchCharacters(){
        RMService.shared.execute(
            .listCharactersRequest,
            expecting: RMGetAllCharactersResponse.self
        ){ [weak self] result in
            switch result{
                case .success(let responseModel):
                let results = responseModel.results
                let info = responseModel.info
                self?.characters = results
                self?.apiInfo = info
                DispatchQueue.main.async{
                    self?.delegate?.didLoadInitialCharacters()
                }
                
                case .failure(let error):
                    print(String(describing: error))
            }
        }
    }
    
    public func fetchAdditionalCharacters(){
        
    }
    
    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil;
    }
}
extension CharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int)-> Int{
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIndentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsopported cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
        
    }
}

extension CharacterListViewViewModel: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldShowLoadMoreIndicator else {
            return
        }
    }
}
