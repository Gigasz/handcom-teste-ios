//
//  Promocoes.swift
//  Handcom-Sales app
//
//  Created by Arthur Valle on 28/02/2018.
//  Copyright © 2018 Arthur Valle. All rights reserved.
//

import Foundation

struct Promocao: Codable {
    let Promocoes: [Produto]?
    let Lojas: [Loja]?
    let Arquivos: [String]?
    let Nome: String?
    let DataInicio: String?
    let DataTermino: String?
}
