//
//  BigWindowViewController.m
//  WindowStatusbarDemo
//
//  Created by ranwenjie on 16/3/29.
//  Copyright © 2016年 ranwenjie. All rights reserved.
//

#import "BigWindowViewController.h"

@interface BigWindowViewController ()

@end

@implementation BigWindowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(BOOL)prefersStatusBarHidden{
    return self.statusBarHidden;
}

-(UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return UIStatusBarAnimationSlide;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
