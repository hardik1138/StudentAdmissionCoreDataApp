import UIKit

class TableViewCell: UITableViewCell {

    private let itemIcon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    private let itemName:UILabel = {
        let label = UILabel()
      
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    func setupCellWith(title itemname: String){
        contentView.addSubview(itemIcon)
        contentView.addSubview(itemName)
        
        itemIcon.frame = CGRect(x: 10, y: 0, width: 30, height: 30)
        itemName.frame = CGRect(x: itemIcon.right + 20 , y: 3 , width: 200, height: 25)
        itemIcon.image = UIImage(named: itemname)
        itemName.text = itemname
    }
    
    private let ClassView = UIView()
    private let ClassItemName:UILabel = {
        let label = UILabel()
      
        label.textColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    private let ClassItemSubName:UILabel = {
        let label = UILabel()
      
        label.textColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    private let InArrowImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "inarrow")
        return iv
    }()
    func setupClassCellWith(title itemname: String){
        contentView.addSubview(ClassView)
        if itemname == "FYMCA"{
            ClassItemSubName.text = "2021-23"
            ClassView.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.8117647059, blue: 0.5921568627, alpha: 1) }
        else if itemname == "SYMCA"{
            ClassItemSubName.text = "2020-22"
            ClassView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.6, blue: 0.2901960784, alpha: 1)
        }else{
            ClassItemSubName.text = "2019-21"
            ClassView.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.5019607843, blue: 0.9294117647, alpha: 1)
        }
        
        ClassView.addSubview(ClassItemName)
        ClassView.addSubview(ClassItemSubName)
        ClassView.addSubview(InArrowImg)
        
        ClassView.layer.cornerRadius = 15
        ClassView.frame = CGRect(x: 20, y: 10, width: contentView.width - 40, height: 100)
        
        ClassItemName.frame = CGRect(x: 20, y: 10, width: ClassView.width, height: 50)
        ClassItemSubName.frame = CGRect(x: 20, y: ClassItemName.bottom - 20, width: ClassView.width, height: 50)
        InArrowImg.frame = CGRect(x: ClassView.right - 60, y: (ClassView.height - 21 )/2, width: 21, height: 21)
        
        ClassItemName.text = itemname
    }
    private let ncellView = UIView()
    private let ncellicon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "notice")
        return iv
    }()
    private let ncelltile:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text=""
        label.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    private let ncellDate:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1

        label.textColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    func setupNoticeCellWith(itemname: Notice){
        contentView.backgroundColor = .clear
        contentView.addSubview(ncellView)
        ncellView.layer.cornerRadius = 8.76
        ncellView.layer.borderWidth = 1
        ncellView.layer.borderColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        ncellView.addSubview(ncellicon)
        ncellView.addSubview(ncelltile)
        ncellView.addSubview(ncellDate)
        
        ncellView.frame = CGRect(x: 20, y: 0, width: contentView.width - 40, height: 90)
        ncellicon.frame = CGRect(x: 15, y: 10, width: 35.5, height: 35.5)
        ncelltile.frame = CGRect(x: ncellicon.right + 10, y: 5, width: 180, height: 45)
        ncellDate.frame = CGRect(x: ncellicon.right + 10, y: ncelltile.bottom - 10 , width: 180, height: 50)
        
        ncelltile.text = itemname.title
        ncellDate.text = itemname.date
    }
    private let pcellicon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    private let pcelltile:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text=""
        label.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    func setupPeopleCellWith(title stud: Student){
        contentView.addSubview(pcellicon)
        contentView.addSubview(pcelltile)
        
        pcellicon.frame = CGRect(x: 15, y: 10, width: 35.5, height: 35.5)
        pcelltile.frame = CGRect(x: pcellicon.right + 10, y: 5, width: 180, height: 45)
        pcelltile.text = stud.name
        if(stud.gender == "Male"){
            pcellicon.image = UIImage(named: "defaultdpm")
        }else{
            pcellicon.image = UIImage(named: "defaultdpf")

        }
    }
}
