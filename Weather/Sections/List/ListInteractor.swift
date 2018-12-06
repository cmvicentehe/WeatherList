//
//  ListInteractor.swift
//  Weather
//
//  Created by Carlos Vicente on 06/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation

protocol ListInteractorInput {
    #warning("Implemen!")
}

protocol ListInteractorOutput {
    #warning("Implemen!")
}

class ListInteractor {
    var presenter: ListInteractorOutput?
    var repository: ListRepositoryInput?
}

extension ListInteractor: ListInteractorInput {
    
}

extension ListInteractor: ListRepositoryOutput {
    
}
