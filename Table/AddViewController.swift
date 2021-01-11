//
//  AddViewController.swift
//  Table
//
//  Created by 김가영 on 2021/01/11.
//  Copyright © 2021 김가영. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COMUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 40
    var imageArray = [UIImage?]()
    var imageFileName = [ "cart.png", "clock.png", "pencil.png" ]
    var fileName = ""
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //피커뷰에 넣을 이미지배열
        for i in 0 ..< MAX_ARRAY_NUM {
                   let image = UIImage(named: imageFileName[i])
                   imageArray.append(image!)
               }
        
        imageView.image = imageArray[0]
        fileName = imageFileName[0]
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        
        //텍스트 데이터에 넣기 (string)
        items.append(tfAddItem.text!)
        
        //이미지 데이터에 넣기 (fileName > string)
        itemsImageFile.append(fileName)
        
        tfAddItem.text=""
        _ = navigationController?.popViewController(animated: true)
    }
    
    //for pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COMUMN
    }
    
    
    // returns height of row for each component.
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = imageArray[row] //이미지뷰에 보여지기
        fileName = imageFileName[row] //이미지배열의 파일이름
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
