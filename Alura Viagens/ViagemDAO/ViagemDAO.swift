//
//  ViagemDAO.swift
//  Alura Viagens
//
//  Created by Eduardo Santos on 07/06/21.
//

import UIKit

class ViagemDAO: NSObject {
    func retornaTodasAsViagens() -> Array<Viagem> {
        let ceara = Viagem(titulo: "Ceará", quantidadeDeDias: 3, preco: "1.800,59", caminhoDaImagem: "img1.png")
        let rioDeJaneiro = Viagem(titulo: "Rio de Janeiro", quantidadeDeDias: 6, preco: "1.200,00", caminhoDaImagem: "img2.jpg")
        let interiorSaoPaulo = Viagem(titulo: "Atibaia - São Paulo", quantidadeDeDias: 1, preco: "890,00", caminhoDaImagem: "img3.jpg")
        let paraiba = Viagem(titulo: "Paraíba", quantidadeDeDias: 3, preco: "1.385,00", caminhoDaImagem: "img4.jpg")
        let fortaleza = Viagem(titulo: "Fortaleza", quantidadeDeDias: 4, preco: "3.120,00", caminhoDaImagem: "img5.jpg")
        
        let listaViagem = [rioDeJaneiro, ceara, interiorSaoPaulo, paraiba, fortaleza]
        
        return listaViagem
    }
}
