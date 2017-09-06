//
//  SecondViewController.m
//  通知中心
//
//  Created by 田 on 2017/9/6.
//  Copyright © 2017年 Jiang. All rights reserved.
//

#import "SecondViewController.h"



@interface SecondViewController ()<UITextFieldDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //文本输入框
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, 200, 40)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    //设置代理属性
    textField.delegate = self;
    [self.view addSubview:textField];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField代理
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    //传值(通知中心)
    //发送通知
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    /*
     第一个参数:通知的名字
     第二个参数:通知的对象
     第三个参数:传递的一些参数值
     */
    NSDictionary *dict = @{@"myText":textField.text,@"hehe":@"memeda"};
    
    
    [nc postNotificationName:@"transferValue" object:nil userInfo:dict];
    
    //退回第一个界面
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return YES;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
