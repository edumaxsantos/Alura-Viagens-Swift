//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Eduardo Santos on 09/06/21.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    // MARK: - Propriedades
    
    let listaComTodasViagens: [Viagem] = ViagemDAO().retornaTodasAsViagens()
    var listaViagens: [Viagem] = []
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colecaoPacotesViagem.dataSource = self
        self.colecaoPacotesViagem.delegate = self
        self.pesquisarViagens.delegate = self
        listaViagens = listaComTodasViagens
        self.labelContadorPacotes.text = self.atualizaContadorLabel()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        
        let viagemAtual = listaViagens[indexPath.item]
        
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
    
    // MARK: - SearchDeleate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens
        if searchText != "" {
            let filtroListaViagem = NSPredicate(format: "titulo contains %@", searchText)
            let listaFiltrada: Array<Viagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array
            listaViagens = listaFiltrada
        }
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
        colecaoPacotesViagem.reloadData()
    }
    
    func atualizaContadorLabel() -> String {
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }

}
