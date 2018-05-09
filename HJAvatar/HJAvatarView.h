//
//  HJAvatarView.h
//  HJAvatar
//
//  Created by ios119 on 2018/4/28.
//  Copyright © 2018年 ios119. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJAvatarAttribute : NSObject

@property (nonatomic, strong) NSURL *imageURLA;
@property (nonatomic, assign) CGFloat borderWidthA;
@property (nonatomic, strong) UIColor *borderColorA;
@property (nonatomic, strong) UIImage *placeHolderImgA;
@property (nonatomic, assign) CGSize avatarSizeA;    ///< 画圆的时候，裁图
@property (nonatomic, assign) CGFloat radiusA;   ///< 图片圆角半径

@property (nonatomic, copy) HJAvatarAttribute *(^imageURL)(NSURL *imageURL);
@property (nonatomic, copy) HJAvatarAttribute *(^borderWidth)(CGFloat borderWidth);
@property (nonatomic, copy) HJAvatarAttribute *(^borderColor)(UIColor *borderColor);
@property (nonatomic, copy) HJAvatarAttribute *(^placeHolderImg)(UIImage *placeHolderImg);
@property (nonatomic, copy) HJAvatarAttribute *(^avatarSize)(CGSize avatarSize);
@property (nonatomic, copy) HJAvatarAttribute *(^radius)(CGFloat radius);

+ (instancetype)defauleAttribute;

@end


@interface HJAvatarView : UIView

- (void)hj_makeAvatarWithAttribute:(void (^)(HJAvatarAttribute *attribute))attributeBlock;

@end
