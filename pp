//
//  HNTHomeController.m
//  demo
//
//

#import "HNTHomeController.h"
#import "HNTHomeHeaderView.h"
#import "HNTHomeCell.h"
#import "HNTDetailsTabController.h"
#import <AdSupport/ASIdentifierManager.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@interface HNTHomeController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic ,strong)UITableView         *tabView;

@property (nonatomic ,strong)NSDecimalNumber    *nonceEarnings;

@property (nonatomic ,strong)NSDecimalNumber    *yesEarnings;

@property (nonatomic ,strong)NSArray            *listAccount;


@end

@implementation HNTHomeController


- (UITableView *)tabView
{
    if (!_tabView) {
        _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.width, self.contentView.height) style:UITableViewStyleGrouped];
        [_tabView registerNib:[UINib nibWithNibName:@"HNTHomeCell" bundle:nil] forCellReuseIdentifier:@"HNTHomeCell"];
        [_tabView registerNib:[UINib nibWithNibName:@"HNTHomeHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"HNTHomeHeaderView"];
        _tabView.delegate = self;
        _tabView.dataSource = self;
    }
    return _tabView;
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!_listAccount || _listAccount.count < 2 ) {
        [self loadData];
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.listAccount.count > 0) {
        HNTAccountModel *model = self.listAccount[section];
        return model.listHotspot.count;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.listAccount.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  56;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 52;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00006;
}


-(HNTHomeCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HNTHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HNTHomeCell" forIndexPath:indexPath];
    HNTAccountModel *model = self.listAccount[indexPath.section];
    
    cell.hotspotModel = model.listHotspot[indexPath.row];


    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HNTHomeHeaderView *head = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HNTHomeHeaderView"];
    [head.backgroundView setBackgroundColor:UIColor.whiteColor];
    head.indexNumbet = section;
    head.infoModel = self.listAccount[section];
    
    return head;
}



@end
