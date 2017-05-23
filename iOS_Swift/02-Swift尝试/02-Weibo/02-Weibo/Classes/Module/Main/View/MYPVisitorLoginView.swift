//
//  MYPVisitorLoginView.swift
//  02-Weibo
//
//  Created by apple on 2017/5/23.
//  Copyright © 2017年 MengYP. All rights reserved.
//

/// 访客视图

/*
 VFL 自动布局
 
 /// 添加约束
 ///
 /// - Parameters:
 ///   - item view1:         添加约束的对象
 ///   - attribute attr1:    要添加约束的属性
 ///   - relatedBy relation: 相对的约束, 一般使用"精准约束" equal
 ///   - toItem view2:       添加的约束相对于的视图对象
 ///   - attribute attr2:    相对约束的对象的属性
 ///   - multiplier:         约束的关系乘积值
 ///   - constant c:         约束值
 public convenience init(item view1: Any, attribute attr1: NSLayoutAttribute, relatedBy relation: NSLayoutRelation, toItem view2: Any?, attribute attr2: NSLayoutAttribute, multiplier: CGFloat, constant c: CGFloat)

使用VFL手动添加约束,必须将frame 设置视图的位置的属性关闭
 设置 
    open var translatesAutoresizingMaskIntoConstraints: Bool // Default YES
 为 false

 */

import UIKit

class MYPVisitorLoginView: UIView {

// MARK: - 初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented") //只能通过代码创建
        //super.init(coder: aDecoder)
    }
    
// MARK: - 私有方法
    
    /// 初始化子控件
    fileprivate func setupUI() {
        backgroundColor = UIColor(white: 0.93, alpha: 1) //设置背景颜色
        
        //添加子控件
        addSubview(circleView)
        addSubview(backView)
        addSubview(houseView)
        addSubview(tipLabel)
        addSubview(loginBtn)
        addSubview(registerBtn)
        
        
    }
    
    /// 布局子控件
    fileprivate func setupLayout() {
        
        for child in subviews {
            child.translatesAutoresizingMaskIntoConstraints = false //使用VFL,必须将此属性关闭（frame 设置视图位置的属性）
        }
        
        //圆环
        addConstraint(NSLayoutConstraint(item: circleView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: circleView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: -60))
        
        //圆环中间的房子
        addConstraint(NSLayoutConstraint(item: houseView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: circleView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: houseView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: circleView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0))
        
        // 文字提示
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: circleView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: circleView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 16))
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 30))
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -30))
        
        // 登录按钮
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: tipLabel, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 20))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 100))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 35))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: -15))
        
        // 注册按钮
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: loginBtn, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 100))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 35))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 15))
        
        // 模糊背景
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[maskView]-0-|", options: [], metrics: nil, views: ["maskView": backView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[maskView]-(-35)-[regBtn]", options: [], metrics: nil, views: ["maskView": backView, "regBtn": registerBtn]))
    }
    

    
// MARK: - 懒加载
    
    
    /// 模糊背景
    fileprivate lazy var backView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    
    /// 圆环
    fileprivate lazy var circleView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    /// 圆环中间的房子
    fileprivate lazy var houseView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    /// 文字提示
    fileprivate lazy var tipLabel: UILabel = {
        let label = UILabel()
        
        label.text = "关注一些人，回这里看看有什么惊喜"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        label.sizeToFit()
        
        return label
    }()
    
    /// 登录按钮
    fileprivate lazy var loginBtn: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("登录", for: UIControlState())
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: UIControlState())
        btn.setTitleColor(UIColor.darkGray, for: UIControlState())
        btn.sizeToFit()
        
        return btn
    }()
    
    /// 注册按钮
    fileprivate lazy var registerBtn: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("注册", for: UIControlState())
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: UIControlState())
        btn.setTitleColor(UIColor.orange, for: UIControlState())
        btn.sizeToFit()
        
        return btn
    }()
    
}
