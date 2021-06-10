//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Eduardo Santos on 09/06/21.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - Outlets
    
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    // MARK: - Propriedades
    
    let listaViagens: [Viagem] = ViagemDAO().retornaTodasAsViagens()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colecaoPacotesViagem.dataSource = self
        self.colecaoPacotesViagem.delegate = self

        // Do any additional setup after loading the view.
    }
    
    // MARK: - DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        
        let viagemAtual = listaViagens[indexPath.item]
        
        print(celulaPacote.frame.size)
        
        celulaPacote.labelTitulo.text = viagemAtual.titulo
        celulaPacote.labelPreco.text = "R$ \(viagemAtual.preco)"
        celulaPacote.labelQuantidadeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        celulaPacote.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        
        celulaPacote.layer.cornerRadius = 8
        
        return celulaPacote
    }

    // MARK: - FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let larguraCelula = collectionView.bounds.width / 2
        return CGSize(width: larguraCelula - 15, height: 160)
    }

}
