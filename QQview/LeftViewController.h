//
//  LeftViewController.h
//  QQview
//
//  Created by chenpeng on 15/4/9.
//  Copyright (c) 2015年 chenpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LeftDelegate<NSObject>
-(void)sendString:(NSString *)str;
@end
@interface LeftViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic)id<LeftDelegate>Leftdelegate;
@end
