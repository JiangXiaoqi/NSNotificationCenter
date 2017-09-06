//
//  ViewController.m
//  通知中心
//
//  Created by 田 on 2017/9/6.
//  Copyright © 2017年 Jiang. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "FirstViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //显示文字
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 40)];
    label.tag = 100;
    [self.view addSubview:label];
    
    //跳转按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(50, 200, 80, 40);
    [btn setTitle:@"跳转2" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(50, 400, 80, 40);
    [btn1 setTitle:@"跳转1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(clickBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    //注册通知(单例对象)
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    //    NSNotificationCenter *nc2 = [NSNotificationCenter defaultCenter];
    //注册通知
    /*
     第一个参数:发送通知是回调用哪个对象的方法
     第二个参数:发送通知时会调用哪个方法
     第三个参数:通知的名字
     第四个参数:会接收哪个对象发送的通知(如果传nil,表示接收所有的通知)
     */
    //    [nc2 addObserver:self selector:@selector(notiAction:) name:@"transferValue" object:nil];
    
    FirstViewController *ctrl = [[FirstViewController alloc]init];
    
    [nc addObserver:self selector:@selector(notiAction:) name:@"transferValue" object:ctrl.textField];
    
}

-(void)dealloc
{
    /*
     NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
     //[nc removeObserver:self name:@"transferValue" object:nil];
     [nc removeObserver:self];
     */
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)notiAction:(NSNotification *)n
{
    //获取参数值
    NSDictionary *dict = n.userInfo;
    
    NSLog(@"%@",dict);
    //显示到label上面
    UILabel *label = (UILabel *)[self.view viewWithTag:100];
    label.text = dict[@"myText"];
    NSLog(@"%@",dict[@"hehe"]);
}

- (void)clickBtn:(id)sender
{
    SecondViewController *ctrl = [[SecondViewController alloc] init];
    [self presentViewController:ctrl animated:YES completion:nil];
}

- (void)clickBtn1:(id)sender
{
    FirstViewController *ctrl = [[FirstViewController alloc] init];
    [self presentViewController:ctrl animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
