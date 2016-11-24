//
//  StyleOneCell.m
//  文字展开与收回
//
//  Created by 徐茂怀 on 2016/11/23.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import "StyleOneCell.h"

@implementation StyleOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
-(void)setWithModel:(StyleOneModel *)model indexPath:(NSIndexPath *)indexpath
{
    _model = model;
    _indexPath = indexpath;
    if (model.showBtn) {
        _zhankaiBtn.hidden = NO;
        [_topContacts setConstant:10];
        _infoLabel.numberOfLines = 1;
    }else
    {
        _zhankaiBtn.hidden = YES;
        [_topContacts setConstant:0];
        _infoLabel.numberOfLines = 0;
    }
    if (model.isShow) {
        [_zhankaiBtn setTitle:@"收回" forState:0];
        _infoLabel.numberOfLines = 0;
    }else{
        [_zhankaiBtn setTitle:@"展开" forState:0];
        _infoLabel.numberOfLines = 1;
    }
    _infoLabel.text = model.workInfo;
    
}
- (IBAction)selectedZhankai:(id)sender {
    [self.delegate reloadIndexPathWithModel:_model indexPath:_indexPath];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
