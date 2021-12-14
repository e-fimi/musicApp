//
//  AlbumTableViewCell.swift
//  musicApp
//
//  Created by Георгий on 09.12.2021.
//

import UIKit

final class AlbumTableViewCell: UITableViewCell {
    var album: Album? {
        didSet {
            if let album = album {
                albumCover.image = UIImage(named: album.image)
                albumName.text = album.name
                songsCount.text = "\(album.songs.count) Songs"
            }
        }
    }
    
    private lazy var albumCover: UIImageView = {
        let albumCover = UIImageView()
        albumCover.translatesAutoresizingMaskIntoConstraints = false
        albumCover.contentMode = .scaleAspectFill
        albumCover.clipsToBounds = true
        albumCover.layer.cornerRadius = 25
        albumCover.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        return albumCover
    }()
    
    private lazy var albumName: UILabel = {
        let albumName = UILabel()
        albumName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        albumName.translatesAutoresizingMaskIntoConstraints = false
        albumName.textColor = UIColor(named: "titleColor")
        return albumName
    }()
    
    private lazy var songsCount: UILabel = {
        let songsCount = UILabel()
        songsCount.translatesAutoresizingMaskIntoConstraints = false
        songsCount.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        songsCount.textColor = .darkGray
        songsCount.numberOfLines = 0
        songsCount.textColor = UIColor(named: "subtitleColor")
        return songsCount
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [albumCover, albumName, songsCount].forEach {
            contentView.addSubview($0)
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            albumCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            albumCover.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            albumCover.widthAnchor.constraint(equalToConstant: 100),
            albumCover.heightAnchor.constraint(equalToConstant: 100),
            albumCover.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            albumName.leadingAnchor.constraint(equalTo: albumCover.trailingAnchor, constant: 16),
            albumName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            songsCount.leadingAnchor.constraint(equalTo: albumCover.trailingAnchor, constant: 16),
            songsCount.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: 8)
        ])
    }

}
