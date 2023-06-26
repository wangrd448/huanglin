//
//  HNTTableViewController.m
//  demo
//
//  Created by 东哥 on 2022/4/12.
//

#import "HNTDetailsTabController.h"
#import "FSNetworkController.h"
#import "HNTTableViewCell.h"
#import <MBProgressHUD.h>
#import "TKAlertCenter.h"

@interface HNTDetailsTabController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,strong)UITableView                *tableView;



@end

@implementation HNTDetailsTabController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.contentView.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"HNTTableViewCell" bundle:nil] forCellReuseIdentifier:@"HNT_CELL"];
//        _tableView.backgroundColor = [UIColor  grayColor];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.contentView addSubview:self.tableView];

    self.backButton.hidden = NO;
    
    self.titleString = [NSString stringWithFormat:@"%@",self.totalAmount];
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HNTAccountModel *obj = self.accountArr[indexPath.row];
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    board.string = obj.address;
    [[TKAlertCenter defaultCenter] postAlertWithMessage:@"复制成功"];

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 6;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.accountArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HNTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HNT_CELL" forIndexPath:indexPath];
    HNTAccountModel *obj = self.accountArr[indexPath.row];
    cell.mark = indexPath.row+1;
    cell.model = obj;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  102;
}


@end
