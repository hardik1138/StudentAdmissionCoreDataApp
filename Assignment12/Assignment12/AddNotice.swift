
import UIKit

class AddNotice: UIViewController {

    var note : Notice?
    var strclass : String!
    private let TopView = UIView()
    private let closeBtn:UIButton = {
        let button=UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.addTarget(self, action: #selector(backbtnHandle), for: .touchUpInside)
        return button
    }()
    @objc func backbtnHandle (){
        navigationController?.popViewController(animated: true)
    }
    private let uploadBtn:UIButton = {
        let button=UIButton()
        button.setImage(UIImage(named: "upload"), for: .normal)
        button.addTarget(self, action: #selector(uploadTapHandle), for: .touchUpInside)
        return button
    }()
    @objc func uploadTapHandle (){
        let name = noteTitle.text!
        let date = Date().string(format: "dd, MMM yyyy")
        let Cls = strclass!
        let discription = contentView.text!
        
        if let n1 = note {
            coreDataHandler.shared.updateNotice(note: n1, title: name, dis: discription, date: date) {
                print("updated notice")
                self.reset()
            }
        } else{
            coreDataHandler.shared.insertNotice(title: name, dis: discription, date: date, cls: Cls) {
                print("inserted notice")
                self.reset()
            }
        }
        navigationController?.popViewController(animated: true)
    }
    

    private func reset()
    {
        note = nil
        noteTitle.text = ""
        contentView.text = ""
    }
    public let noteTitle:UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Title", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.337254902, green: 0.4039215686, blue: 0.4666666667, alpha: 1)])
        textField.textColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        textField.textAlignment = .left
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        return textField
    }()
    private let contentView : UITextView = {
        let cv = UITextView()
        cv.textColor = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2156862745, alpha: 1)
        cv.text = ""
        cv.font = UIFont.systemFont(ofSize: 16)
        cv.textAlignment = .left
        cv.layer.borderWidth = 1
        cv.layer.cornerRadius = 10
        cv.layer.borderColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        cv.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        return cv
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        strclass = title
        super.viewDidLoad()
        if strclass == "FYMCA"{
            TopView.backgroundColor =  #colorLiteral(red: 0.4352941176, green: 0.8117647059, blue: 0.5921568627, alpha: 1)
        }else if strclass == "SYMCA" {
            TopView.backgroundColor =  #colorLiteral(red: 0.9490196078, green: 0.6, blue: 0.2901960784, alpha: 1)
        }else {
            TopView.backgroundColor =  #colorLiteral(red: 0.1843137255, green: 0.5019607843, blue: 0.9294117647, alpha: 1)
        }
                    
        view.addSubview(TopView)
        TopView.addSubview(closeBtn)
        TopView.addSubview(uploadBtn)
        view.addSubview(noteTitle)
        view.addSubview(contentView)
        
        if let n1 = note {
            noteTitle.text = n1.title
            contentView.text = n1.dis
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TopView.frame = CGRect(x: 0, y: 0, width: view.width, height: 100)
        closeBtn.frame = CGRect(x: 20, y: 58, width: 24, height: 24)
        uploadBtn.frame = CGRect(x: (TopView.width - 30 ) - 20 , y: 58, width: 30, height: 21)
        noteTitle.frame = CGRect(x: 20, y: TopView.bottom + 15, width: view.width - 40, height: 50)
        contentView.frame = CGRect(x: 20, y: noteTitle.bottom + 15, width: view.width - 40, height: view.height - noteTitle.bottom - 35)
    }
}
extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
