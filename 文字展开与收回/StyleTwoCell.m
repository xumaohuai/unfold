//
//  StyleTwoCell.m
//  文字展开与收回
//
//  Created by 徐茂怀 on 2016/11/23.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import "StyleTwoCell.h"

@implementation StyleTwoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
-(void)setWithModelTwo:(StyleTwoModel *)model indexPath:(NSIndexPath *)indexpath
{
    _model = model;
    _indexPath = indexpath;
    [self setWithInfoLabel:model.workInfo];
//    _infoLabel.text = model.workInfo;
}
-(void)setWithInfoLabel:(NSString *)str
{
    _wholeAttrStr = nil;
    if (_model.isBeyond && _model.isShow) {
        NSMutableString *wholeStr = [[NSMutableString alloc]initWithString:str];
        [wholeStr appendString:@"[收起]"];
        _wholeAttrStr = [[NSMutableAttributedString alloc]initWithString:wholeStr];
        [_wholeAttrStr addAttribute:NSLinkAttributeName value:@"收起" range:NSMakeRange(_wholeAttrStr.length - 4, 4)];
        self.infoLabel.attributedText = _wholeAttrStr;
    }else if (_model.isBeyond && !_model.isShow){
        NSMutableString *wholeStr = [[NSMutableString alloc]initWithString:[str substringToIndex:18]];
        [wholeStr appendString:@"...[展开]"];
        _wholeAttrStr = [[NSMutableAttributedString alloc]initWithString:wholeStr];
        [_wholeAttrStr addAttribute:NSLinkAttributeName value:@"展开" range:NSMakeRange(_wholeAttrStr.length - 4, 4)];
        self.infoLabel.attributedText = _wholeAttrStr;
    }else
    {
        NSMutableString *wholeStr = [[NSMutableString alloc]initWithString:str];
        _wholeAttrStr = [[NSMutableAttributedString alloc]initWithString:wholeStr];
        self.infoLabel.attributedText = _wholeAttrStr;
    }
    [self.infoLabel setDidClickLinkBlock:^(MLLink *link, NSString *linkText, MLLinkLabel *label) {
        if ([link.linkValue isEqualToString:@"展开"]) {
            label.attributedText = _wholeAttrStr;
            [self.delegate reloadIndexPathWithModel:_model indexPath:_indexPath];
        } else {
            label.attributedText = _wholeAttrStr;
            [self.delegate reloadIndexPathWithModel:_model indexPath:_indexPath];
        }
    }];
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
