//
//  StyleOneModel.m
//  文字展开与收回
//
//  Created by 徐茂怀 on 2016/11/23.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import "StyleOneModel.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@implementation StyleOneModel
-(CGFloat)heightForRowWithisShow:(BOOL)isShow
{//105
    if (!isShow) {
        if ([self heightForString:_workInfo fontSize:15 andWidth:SCREEN_WIDTH - 45] > 20) {
            _showBtn = YES;
            return 163;
        }
        else
        {
            _showBtn = NO;
            return [self heightForString:_workInfo fontSize:15 andWidth:SCREEN_WIDTH - 45] + 150;
        }
    }else
    {
        return [self heightForString:_workInfo fontSize:15 andWidth:SCREEN_WIDTH - 45] + 150;
    }
}

- (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width{
    UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    detailLabel.font = [UIFont systemFontOfSize:fontSize];
    detailLabel.text = value;
    detailLabel.numberOfLines = 0;
    CGSize deSize = [detailLabel sizeThatFits:CGSizeMake(width,1)];
    return deSize.height;
}

@end
