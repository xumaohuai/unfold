//
//  StyleOneModel.h
//  文字展开与收回
//
//  Created by 徐茂怀 on 2016/11/23.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface StyleOneModel : NSObject
@property (nonatomic, strong)NSString *workInfo;
@property (nonatomic, assign)BOOL isShow;
@property (nonatomic, assign)BOOL showBtn;
-(CGFloat)heightForRowWithisShow:(BOOL)isShow;
@end
