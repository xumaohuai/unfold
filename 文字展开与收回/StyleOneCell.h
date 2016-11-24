//
//  StyleOneCell.h
//  文字展开与收回
//
//  Created by 徐茂怀 on 2016/11/23.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StyleOneModel.h"
@protocol reloadDelegate<NSObject>
-(void)reloadIndexPathWithModel:(StyleOneModel *)model indexPath:(NSIndexPath *)indexPath;
@end
@interface StyleOneCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *infoLabel;
@property (strong, nonatomic) IBOutlet UIButton *zhankaiBtn;
@property (nonatomic, strong)StyleOneModel *model;
@property (strong ,nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topContacts;
-(void)setWithModel:(StyleOneModel *)model indexPath:(NSIndexPath *)indexpath;
@property (nonatomic, weak)id<reloadDelegate>delegate;
@end
