//
//  LeftViewController.m
//  QQview
//
//  Created by chenpeng on 15/4/9.
//  Copyright (c) 2015年 chenpeng. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>


@property(strong,nonatomic)NSArray *listArray;
@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listArray=@[@"小猫a",@"小猫b",@"小猫c",@"小猫d"];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.backgroundColor=[UIColor clearColor];
    self.tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *Cell=[[UITableViewCell alloc]init];
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, Cell.frame.size.width-20, Cell.frame.size.height)];
    [Cell.contentView addSubview:lable];
    Cell.backgroundColor=[UIColor clearColor];
    lable.textAlignment=NSTextAlignmentLeft;
    lable.textColor=[UIColor whiteColor];
    lable.text=[self.listArray objectAtIndex:indexPath.row];
    return Cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.Leftdelegate sendString:[self.listArray objectAtIndex:indexPath.row]];
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
