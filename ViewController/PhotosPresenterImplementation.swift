//
//  MoviesPresenter.swift
//  CareAxiom
//
//  Created by Mahnoor Fatima on 19/08/2019.
//  Copyright © 2019 Mahnoor Fatima. All rights reserved.
//

import Foundation

class PhotosPresenterImplementation: PhotosPresenter {
    let appServerClient: AppServerClient
    private weak var view: PhotosView?
    private let repository:  PhotoRepository
    
    init(_ view: PhotosView?, _ repository: PhotoRepository , appServerClient: AppServerClient) {
        self.view = view
        self.repository = repository
        self.appServerClient = appServerClient
    }
    
   
  func fetchAll() {
    //appServerClient.getPhotos(repository: repository)
        let photoDetails = repository.fetchAll()
        let photoItems = PhotosMapper.convertCells(from: photoDetails)
    print(photoItems)
        view?.display(movies: photoItems)
    }
    
}
