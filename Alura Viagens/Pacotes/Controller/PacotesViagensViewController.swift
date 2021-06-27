//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Eduardo Santos on 09/06/21.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate, UINavigationControllerDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    // MARK: - Propriedades
    
    let listaComTodasViagens: [PacoteViagem] = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens: [PacoteViagem] = []
    var pacoteSelecionado: PacoteViagem?
    var frameSelecionado: CGRect?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colecaoPacotesViagem.dataSource = self
        self.colecaoPacotesViagem.delegate = self
        self.pesquisarViagens.delegate = self
        self.navigationController?.delegate = self
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
        
        
        let pacoteAtual = listaViagens[indexPath.item]
        
        celulaPacote.configuraCelula(pacoteViagem: pacoteAtual)
        
        
        return celulaPacote
    }

    // MARK: - FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2 - 20, height: 160) : CGSize(width: collectionView.bounds.width/3 - 20, height: 250)
    }
    
    // MARK: - SearchDeleate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        listaViagens = listaComTodasViagens
//        if searchText != "" {
//            let filtroListaViagem = NSPredicate(format: "viagem.titulo contains[cd] %@", searchText)
//            let listaFiltrada: Array<PacoteViagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array
//            listaViagens = listaFiltrada
//        }
        listaViagens = searchText.isEmpty ? listaComTodasViagens : listaComTodasViagens.filter { pacote in
            return pacote.viagem.titulo.localizedCaseInsensitiveContains(searchText)
        }
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
        colecaoPacotesViagem.reloadData()
    }
    
    // MARK: - Collection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]
        pacoteSelecionado = pacote
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "detalhes") as! DetalhesViagemViewController
        controller.pacoteSelecionado = pacote
        
        let atributosItemSelecionado = collectionView.layoutAttributesForItem(at: indexPath)
        frameSelecionado = atributosItemSelecionado?.frame
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func atualizaContadorLabel() -> String {
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }
    
    // MARK: - UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let pacoteSelecionado = pacoteSelecionado else { return nil }
        let caminhoDaImagem = pacoteSelecionado.viagem.caminhoDaImagem
        guard let imagem = UIImage(named: caminhoDaImagem) else { return nil }
        guard let frameInicial = frameSelecionado else { return nil }
        
        switch operation {
            case .push:
                return AnimacaoTransicaoPersonalizada(duracao: 0.5, imagem: imagem, frameInicial: frameInicial)
            default:
                // TO DO: Implementar pop
                return AnimacaoTransicaoPersonalizada(duracao: 0.5, imagem: imagem, frameInicial: frameInicial)
        }
    }

}
