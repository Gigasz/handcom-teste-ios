//
//  Produto.swift
//  Handcom-Sales app
//
//  Created by Arthur Valle on 28/02/2018.
//  Copyright © 2018 Arthur Valle. All rights reserved.
//

import Foundation

struct Produto: Codable {
    let IdProduto: Int?
    let CodigoBarras: String?
    let CodigoInterno: String?
    let NomeProdutoBase: String?
}
