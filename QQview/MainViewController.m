//
//  MainViewController.m
//  QQview
//
//  Created by chenpeng on 15/4/9.
//  Copyright (c) 2015年 chenpeng. All rights reserved.
//

#import "MainViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "CenterViewController.h"
@interface MainViewController ()<RightDelegate,LeftDelegate>
{
    CenterViewController *center;
    LeftViewController   *left;
    RightViewController  *right;
    BOOL showLeft;
    BOOL showRight;
    double Coefficient;
}
@property(strong,nonatomic)UIPanGestureRecognizer *panGesture;
@end
@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:imageview];
    imageview.image=[UIImage imageNamed:@"bg"];
    
    showLeft=NO;
    left.view.hidden=YES;
    showRight=NO;
    right.view.hidden=YES;
    
    right=[[RightViewController alloc]initWithNibName:@"RightViewController" bundle:nil];
    right.view.backgroundColor=[UIColor clearColor];
    [self addChildViewController:right];
    [right didMoveToParentViewController:self];
    [self.view addSubview:right.view];
    
    left=[[LeftViewController alloc]initWithNibName:@"LeftViewController" bundle:nil];
    left.view.backgroundColor=[UIColor clearColor];
    [self addChildViewController:left];
    [left didMoveToParentViewController:self];
    [self.view addSubview:left.view];
    
    center=[[CenterViewController alloc]initWithNibName:@"CenterViewController" bundle:nil];
    center.view.backgroundColor=[UIColor purpleColor];
    [self addChildViewController:center];
    [center didMoveToParentViewController:self];
    [self.view addSubview:center.view];
    
    self.panGesture =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panHandle:)];
    [self.panGesture setMaximumNumberOfTouches:1];
    [center.view addGestureRecognizer:self.panGesture];
    
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHandle:)];
    tap.numberOfTapsRequired=1;
    tap.numberOfTouchesRequired=1;
    [center.view addGestureRecognizer:tap];
    left.Leftdelegate=self;
    right.rightdelegate=self;
    // Do any additional setup after loading the view from its nib.
}
-(void)tapHandle:(UITapGestureRecognizer *)sender{
    [UIView animateWithDuration:0.3 animations:^{
        sender.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
        sender.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
        Coefficient=0;
    }];
}
-(void)sendRightstr:(NSString *)str{
    center.showLable.text=str;
    [UIView animateWithDuration:0.3 animations:^{
        center.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
        center.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
        Coefficient=0;
    }];
}
-(void)sendString:(NSString *)str{
    center.showLable.text=str;
    [UIView animateWithDuration:0.3 animations:^{
        center.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
        center.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
        Coefficient=0;
    }];
}

-(void)panHandle:(UIPanGestureRecognizer *)sender{
    CGPoint translation=[sender translationInView:self.view];
    Coefficient= translation.x*0.8+Coefficient;
    sender.view.center=CGPointMake(translation.x+sender.view.center.x, translation.y+sender.view.center.y);
    
    left.view.transform=CGAffineTransformScale(CGAffineTransformIdentity, 0.6+Coefficient/1000, 0.6+Coefficient/1000);
    right.view.transform=CGAffineTransformScale(CGAffineTransformIdentity, 0.6-Coefficient/1000, 0.6-Coefficient/1000);
    [sender setTranslation:CGPointMake(0, 0) inView:self.view];
    //判断往哪边拖
    if (sender.view.frame.origin.x>0) {
        sender.view.transform=CGAffineTransformScale(CGAffineTransformIdentity, 1-Coefficient/1000, 1-Coefficient/1000);
        showLeft=YES;
        left.view.hidden=NO;
        showRight=NO;
        right.view.hidden=YES;
    }else{
        sender.view.transform=CGAffineTransformScale(CGAffineTransformIdentity, 1+Coefficient/1000, 1+Coefficient/1000);
        showLeft=NO;
        left.view.hidden=YES;
        showRight=YES;
        right.view.hidden=NO;
    }
    if (self.panGesture.state==UIGestureRecognizerStateEnded) {
        if (sender.view.frame.origin.x>60) {
             [self showLeftView:sender.view];
        }else if (sender.view.frame.origin.x<-60){
             [self showRightView:sender.view];
        }else{
            [UIView animateWithDuration:0.3 animations:^{
                sender.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
                sender.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
                Coefficient=0;
            }];
        }
    }
    
}
-(void)showLeftView:(UIView *)sender{
        [UIView animateWithDuration:0.3 animations:^{
            sender.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
            sender.center = CGPointMake([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height/2);
            left.view.transform=CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
            right.view.transform=CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        }];
}
-(void)showRightView:(UIView *)sender{
        [UIView animateWithDuration:0.3 animations:^{
            sender.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
            sender.center = CGPointMake(0,[UIScreen mainScreen].bounds.size.height/2);
            left.view.transform=CGAffineTransformScale(CGAffineTransformIdentity,1, 1);
            right.view.transform=CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        }];
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
