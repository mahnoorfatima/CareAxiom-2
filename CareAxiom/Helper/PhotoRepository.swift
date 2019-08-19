//
//  PhotoRepository.swift
//  CareAxiom
//
//  Created by Mahnoor Fatima on 19/08/2019.
//  Copyright © 2019 Mahnoor Fatima. All rights reserved.
//

import Foundation
import CoreData

class PhotoRepository {
    
    private let container: CoreDataConteiner
    
    init(_ container: CoreDataConteiner) {
        self.container = container
    }
    
    func fetchAll() -> [PhotoDescription] {
        do {
            return try container.viewContext
                .fetch(CDPhotoDescription.fetchRequest())
                .compactMap { $0.asMappable() }
            
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }

    
    func add(_ photo: PhotoDescription) {
        let context = container.writeContext
        container.writeContext.perform {
            _ = photo.asManagedObject(with: context)
            context.saveOrRollback()
        }
    }
    
 
    
    
}
