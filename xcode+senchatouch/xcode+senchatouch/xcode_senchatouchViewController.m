//
//  xcode_senchatouchViewController.m
//  xcode+senchatouch
//
//  Created by 张立彬 on 13-5-15.
//  Copyright (c) 2013年 com.xiaoweb. All rights reserved.
//

#import "xcode_senchatouchViewController.h"

@interface xcode_senchatouchViewController ()

@end

@implementation xcode_senchatouchViewController

@synthesize webView;

- (void)viewDidLoad {
    
    //适配各种机型的loading
    BOOL isIpone5 =   [UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320*2, 568*2),[[UIScreen mainScreen] currentMode].size) : NO;
    //如果是iphone5
    if(isIpone5){
        loading = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 320, 548)];
        [loading setImage:[UIImage imageNamed:@"Default-568h@2x.png"]];
    }else{
        loading = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 320, 460)];
        [loading setImage:[UIImage imageNamed:@"Default.png"]];
    }
    
    //在webView中添加loading视图
    [webView addSubview:loading];
	
    //加载www/index.html
	NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"www"];
	NSURL *htmlUrl = [NSURL fileURLWithPath:htmlPath];
	[webView loadRequest:[NSURLRequest requestWithURL:htmlUrl]];
    
}

//window.location.url变动监听事件
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
{
    //获取url
    NSURL *requestURL =[ [ request URL ] retain ];
    //获取path
    NSString* path = requestURL.path;
    
    //通过path的设置，可以实现网页反向控制
    if([path hasPrefix:@"/play"]){
        //在此执行对应代码
        NSLog(@"播放！");
        //返回false，阻止url的正常跳转
        return false;
    }
    
    
    //所有链接均用safari打开
    if ( ( [ [ requestURL scheme ] isEqualToString: @"http" ] || [ [ requestURL scheme ] isEqualToString: @"https" ] || [ [ requestURL scheme ] isEqualToString: @"mailto" ])
        && ( navigationType == UIWebViewNavigationTypeLinkClicked ) ) {
        
        return ![ [ UIApplication sharedApplication ] openURL: [ requestURL autorelease ] ];
    }
    [ requestURL release ];
    
    return YES;
}

//webView加载完成事件
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //隐藏loading控件
    loading.hidden = YES;
	NSLog(@"加载完成！");
}

@end
