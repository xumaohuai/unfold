//
//  StyleTwoCell.h
//  文字展开与收回
//
//  Created by 徐茂怀 on 2016/11/23.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLLinkLabel.h"
#import "StyleTwoModel.h"
@protocol reloadTwoDelegate<NSObject>
-(void)reloadIndexPathWithModel:(StyleTwoModel *)model indexPath:(NSIndexPath *)indexPath;
@end
@interface StyleTwoCell : UITableViewCell
@property (strong, nonatomic) IBOutlet MLLinkLabel *infoLabel;
@property (nonatomic, strong)StyleTwoModel *model;
@property (nonatomic, strong)NSMutableAttributedString *wholeAttrStr;
@property (strong ,nonatomic) NSIndexPath *indexPath;
-(void)setWithModelTwo:(StyleTwoModel *)model indexPath:(NSIndexPath *)indexpath;
@property (nonatomic, weak)id<reloadTwoDelegate>delegate;
@end
