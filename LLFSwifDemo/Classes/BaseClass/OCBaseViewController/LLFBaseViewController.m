//
//  LLFBaseViewController.m
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/21.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

#import "LLFBaseViewController.h"

@interface LLFBaseViewController ()

@end

@implementation LLFBaseViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"------------------------------本页面：%@ viewWillAppear",[self class]);
}

- (void)dealloc {
    NSLog(@"------------------------------本页面：%@ Dealloc",NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    self.view.backgroundColor =  [UIColor whiteColor];
}

#pragma mark - private

- (void)gotoRegist
{
    
}

- (void)gotoLogin
{
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary * dictionary = [defaults dictionaryRepresentation];
    for (id key in dictionary)
    {
        [defaults removeObjectForKey:key];
    }
    [defaults synchronize];
    
    
//    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:UD_IS_LOGIN];
    
}

#pragma mark - 关闭键盘

- (void)closeKeyboard {
    //添加手势关闭键盘
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard:)];
    gesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:gesture];
}

- (void)closeKeyboard:(UITapGestureRecognizer*)sender {
    [self.view endEditing:YES];
}

@end
