//
//  ListRepository.swift
//  Weather
//
//  Created by Carlos Vicente on 06/12/2018.
//  Copyright © 2018 cmvicentehe. All rights reserved.
//

import Foundation

protocol ListRepositoryInput {
    
}

protocol ListRepositoryOutput {
    
}

struct ListRepository {
    let networkClient: NetworkClient
    let interactor: ListRepositoryOutput
}

extension ListRepository: ListRepositoryInput {
    
}
