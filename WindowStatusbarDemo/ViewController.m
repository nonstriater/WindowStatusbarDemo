//
//  ViewController.m
//  WindowStatusbarDemo
//
//  Created by ranwenjie on 16/3/29.
//  Copyright © 2016年 ranwenjie. All rights reserved.
//

#import "ViewController.h"
#import "BigWindowViewController.h"

static BOOL hidden = YES;
@interface ViewController ()
@property(nonatomic,strong)    UIWindow *bigWindow;
@property(nonatomic,strong) BigWindowViewController *bwViewController;
@property(nonatomic,strong) BigWindowViewController *lbwViewController;
@property(nonatomic,strong) UIWindow *lessBigWindow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addButton];
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self addBigLevelWindow];
    
    [self addLessBigLevelWindow];
}


- (void)addButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 100, 200, 60);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"hide/show status bar " forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(hideStatusBar:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)addBigLevelWindow{
    UIWindow *bigWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bigWindow.frame = CGRectMake(0, 300, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    bigWindow.windowLevel = pow(10, 7);
    bigWindow.rootViewController = [[BigWindowViewController alloc] init];
    self.bwViewController = (BigWindowViewController *)bigWindow.rootViewController;
    bigWindow.rootViewController.view.backgroundColor = [UIColor greenColor];
    bigWindow.hidden = NO;
    
    self.bigWindow = bigWindow;
}

- (void)addLessBigLevelWindow{
    UIWindow *bigWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bigWindow.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    bigWindow.windowLevel = pow(10, 6);
    bigWindow.rootViewController = [[UIViewController alloc] init];
    //self.lbwViewController = (BigWindowViewController *)bigWindow.rootViewController;
    bigWindow.rootViewController.view.backgroundColor = [UIColor grayColor];
    bigWindow.hidden = NO;
    
    self.lessBigWindow = bigWindow;
}


- (void)hideStatusBar:(UIButton *)btn{
    
    //not working any more....
//    static int i=0;
//    i++;
//    [[UIApplication sharedApplication] setStatusBarHidden:i%2 withAnimation:UIStatusBarAnimationSlide];
//    
    hidden = !hidden;
    [UIView animateWithDuration:0.5 animations:^{
         [self setNeedsStatusBarAppearanceUpdate];
        
        self.bwViewController.statusBarHidden = hidden;
        [self.bwViewController setNeedsStatusBarAppearanceUpdate];
//        self.lbwViewController.statusBarHidden = hidden;
//        [self.lbwViewController setNeedsStatusBarAppearanceUpdate];
        
    }];
   
    
    
}

-(BOOL)prefersStatusBarHidden{
    return hidden;
}

-(UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return UIStatusBarAnimationSlide;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
