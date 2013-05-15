//
//  xcode_senchatouchViewController.h
//  xcode+senchatouch
//
//  Created by 张立彬 on 13-5-15.
//  Copyright (c) 2013年 com.xiaoweb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xcode_senchatouchViewController : UIViewController

{
    //声明网页容器控件变量
    IBOutlet UIWebView *webView;
    
    //声明loading控件变量
    IBOutlet UIImageView *loading;
}

@property (nonatomic,retain) UIWebView *webView;

@end
