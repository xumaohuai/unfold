//
//  StyleOneController.m
//  文字展开与收回
//
//  Created by 徐茂怀 on 2016/11/23.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import "StyleOneController.h"
#import "StyleOneCell.h"
@interface StyleOneController ()<UITableViewDelegate,UITableViewDataSource,reloadDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataArr;
@end

@implementation StyleOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr = [NSMutableArray array];
    NSString *str = @"有一天，大哥悄悄地对我说：“你过来，我给你做了个顶顶好看的蝴蝶结。”大哥手巧，我知道的，便跟他到了家门口。大哥从他的书包里小心地掏出一个蝴蝶结来。呀，那是我见过的最漂亮的蝴蝶结！它是用那时很稀罕的红的确良布的，还有黑线镶边饰纹缀斑，简直就是一只翩翩起舞的蝴蝶。我简直不敢相信它会属于我。“小妹人俊，系上这就更漂";
    for (NSInteger i = 0; i < 20; i++) {
        StyleOneModel *model = [[StyleOneModel alloc]init];
        model.workInfo = [str substringToIndex:(arc4random() % str.length)];
        [_dataArr addObject:model];
    }
    [_tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        StyleOneModel *model = _dataArr[indexPath.row];
        return  [model heightForRowWithisShow:model.isShow];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        StyleOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"styleonecell" forIndexPath:indexPath];
        StyleOneModel *model = _dataArr[indexPath.row];
        [cell setWithModel:model indexPath:indexPath];
        cell.delegate = self;
        return cell;
}
-(void)reloadIndexPathWithModel:(StyleOneModel *)model indexPath:(NSIndexPath *)indexPath
{
    model.isShow = !model.isShow;
    [_dataArr replaceObjectAtIndex:indexPath.row withObject:model];
    [_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationFade];
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
