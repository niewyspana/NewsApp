//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Viki on 07/12/2023.
//

import UIKit
import SnapKit

class NewsViewController: UIViewController {
    // MARK: - GUI Variables
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "image")
        
        
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.text = "13.05.2024"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Title"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .darkGray
        
        return label
    }()
    
    private lazy var textNews: UILabel = {
        let label = UILabel()
        
        label.text = """
Buddy, you're a boy, make a big noise
        Playing in the street, gonna be a big man someday
        You got mud on your face, you big disgrace
        Kicking your can all over the place, singin'
        We will, we will rock you
        We will, we will rock you
        Buddy, you're a young man, hard man
        Shouting in the street, gonna take on the world someday
        You got blood on your face, you big disgrace
        Waving your banner all over the place
        We will, we will rock you, sing it
        We will, we will rock you
"""
        
        return label
    }()
    
    // MARK: - Properties
    
    private let edgeInset = 16
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        setupUI()
    }
    
    // MARK: - Methods
    
    // MARK: - Private methods
    private func setupUI() {
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textNews)
        view.addSubview(scrollView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.width.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.snp.width)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(edgeInset)
            make.leading.trailing.equalToSuperview().inset(edgeInset)
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(edgeInset)
            make.leading.trailing.equalToSuperview().inset(edgeInset)
            
        }
        
        textNews.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(edgeInset)
            make.leading.trailing.equalToSuperview().inset(edgeInset)
            make.bottom.equalToSuperview().inset(edgeInset)
            
        }
        
        
    }
}
