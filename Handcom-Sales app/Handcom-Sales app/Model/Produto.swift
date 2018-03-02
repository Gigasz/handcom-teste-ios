//
//  Promocao.swift
//  Handcom-Sales app
//
//  Created by Arthur Valle on 28/02/2018.
//  Copyright © 2018 Arthur Valle. All rights reserved.
//

import Foundation

struct Produto: Codable {
    let Titulo: String?
    let Produto: DadosProduto?
    let Preco: Double?
    let PrecoAnterior: Double?
    let DataInicio: String?
    let DataTermino: String?
    let Categoria: Categoria?
    let UrlImage: String?
}

