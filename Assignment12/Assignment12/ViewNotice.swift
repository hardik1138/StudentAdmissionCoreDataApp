
import UIKit

class ViewNotice: UIViewController {

    var note:Notice?
    
    private let TopView = UIView()
    private let closeBtn:UIButton = {
        let button=UIButton()
        button.setImage(UIImage(named: "backbtn"), for: .normal)
        button.addTarget(self, action: #selector(backbtnHandle), for: .touchUpInside)
        return button
    }()
    @objc func backbtnHandle (){
        navigationController?.popViewController(animated: true)
    }
    public let seprator = UIView()
    public let noteTitle:UILabel = {
        let nt = UILabel()
        nt.textColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        nt.textAlignment = .left
        nt.font = .boldSystemFont(ofSize: 24)
        return nt
    }()
  
    public let noteDate:UILabel = {
        let nt = UILabel()
        nt.textColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        nt.textAlignment = .left
        return nt
    }()
    
    private let contentView : UITextView = {
        let cv = UITextView()
        cv.textColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        cv.font = UIFont.systemFont(ofSize: 16)
        cv.textAlignment = .left
        cv.isEditable = false
        return cv
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noteTitle.text = note?.title
        contentView.text = note?.dis
        noteDate.text = note?.date
    }
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        if note?.cls == "FYMCA"{
            //TopView.backgroundColor =  #colorLiteral(red: 0.4352941176, green: 0.8117647059, blue: 0.5921568627, alpha: 1)
            noteTitle.textColor = #colorLiteral(red: 0.4352941176, green: 0.8117647059, blue: 0.5921568627, alpha: 1)
            seprator.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.8117647059, blue: 0.5921568627, alpha: 1)
        }else if note?.cls == "SYMCA" {
            //TopView.backgroundColor =  #colorLiteral(red: 0.9490196078, green: 0.6, blue: 0.2901960784, alpha: 1)
            noteTitle.textColor = #colorLiteral(red: 0.9490196078, green: 0.6, blue: 0.2901960784, alpha: 1)
            seprator.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.6, blue: 0.2901960784, alpha: 1)
        }else {
            //TopView.backgroundColor =  #colorLiteral(red: 0.1843137255, green: 0.5019607843, blue: 0.9294117647, alpha: 1)
            noteTitle.textColor = #colorLiteral(red: 0.1843137255, green: 0.5019607843, blue: 0.9294117647, alpha: 1)
            seprator.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.5019607843, blue: 0.9294117647, alpha: 1)
        }
        view.addSubview(TopView)
        TopView.addSubview(closeBtn)
        view.addSubview(noteTitle)
        view.addSubview(contentView)
        view.addSubview(noteDate)
        view.addSubview(seprator)
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TopView.frame = CGRect(x: 0, y: 0, width: view.width, height: 100)
        closeBtn.frame = CGRect(x: 20, y: 58, width: 24, height: 24)
        noteDate.frame = CGRect(x: 25, y: TopView.bottom - 20, width: view.width - 50, height: 50)
        noteTitle.frame = CGRect(x: 25, y: TopView.bottom + 15, width: view.width - 50, height: 50)
        seprator.frame = CGRect(x: 25, y: noteTitle.bottom , width: view.width - 50, height: 1)
        contentView.frame = CGRect(x: 25, y: noteTitle.bottom + 15, width: view.width - 50, height: view.height - noteTitle.bottom - 35)
    }
}
