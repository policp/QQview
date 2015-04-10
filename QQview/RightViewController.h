//
//  RightViewController.h
//  QQview
//
//  Created by chenpeng on 15/4/9.
//  Copyright (c) 2015年 chenpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RightDelegate<NSObject>
-(void)sendRightstr:(NSString *)str;
@end
@interface RightViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak , nonatomic)id<RightDelegate>rightdelegate;
@end
