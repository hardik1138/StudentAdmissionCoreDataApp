
import UIKit

class CollectionViewCell: UICollectionViewCell{
    private let studName:UILabel = {
        let label = UILabel()
        label.text=""
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    private let classes:UILabel = {
        let label = UILabel()
        label.text=""
        label.textColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    private let studDp: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 15
        return iv
    }()
    func setupCell(with name:Student){
        contentView.layer.backgroundColor = UIColor.white.cgColor
        contentView.layer.cornerRadius = 15.0
        contentView.addSubview(studName)
        contentView.addSubview(studDp)
        contentView.addSubview(classes)
       
        studDp.frame = CGRect(x: 20, y: 20, width: contentView.width - 40, height: contentView.height - 80)
        studName.frame = CGRect(x: 0, y: studDp.bottom + 5, width: contentView.width, height: 25)
        classes.frame = CGRect(x: 0, y: studName.bottom , width: contentView.width , height: 25)
        studName.text = name.name
        classes.text = name.cls
        if(name.gender == "Male")
        {
            studDp.image = UIImage(named: "defaultdpm")
        }else{
            studDp.image = UIImage(named: "defaultdpf")
        }
    }
    
}
