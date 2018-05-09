//
//  HJAvatarView.m
//  HJAvatar
//
//  Created by ios119 on 2018/4/28.
//  Copyright © 2018年 ios119. All rights reserved.
//

#import "HJAvatarView.h"
#import <YYKit.h>

@implementation HJAvatarAttribute

+ (instancetype)defauleAttribute
{
    HJAvatarAttribute *attribute = [HJAvatarAttribute new];
    attribute.borderWidthA = 1;
    attribute.borderColorA = [UIColor grayColor];
    attribute.placeHolderImgA = [UIImage imageNamed:@"default_avatar"];
    
    return attribute;
}

- (HJAvatarAttribute *(^)(NSURL *))imageURL
{
    return ^(NSURL *imageURL) {
        self.imageURLA = imageURL;
        
        return self;
    };
}

- (HJAvatarAttribute *(^)(CGFloat))borderWidth
{
    return ^(CGFloat borderWidth) {
        self.borderWidthA = borderWidth;
        
        return self;
    };
}

- (HJAvatarAttribute *(^)(UIColor *))borderColor
{
    return ^(UIColor *borderColor) {
        self.borderColorA = borderColor;
        
        return self;
    };
}

- (HJAvatarAttribute *(^)(UIImage *))placeHolderImgBlock
{
    return ^(UIImage *placeHolderImg) {
        self.placeHolderImgA = placeHolderImg;
        
        return self;
    };
}

- (HJAvatarAttribute *(^)(CGSize))avatarSize
{
    return ^(CGSize avatarSize) {
        self.avatarSizeA = avatarSize;
        
        return self;
    };
}

- (HJAvatarAttribute *(^)(CGFloat))radius
{
    return ^(CGFloat radius) {
        self.radiusA = radius;
        
        return self;
    };
}

@end

@interface HJAvatarView ()

@property (nonatomic, strong) UIImageView *avatarView;

@property (nonatomic, strong) HJAvatarAttribute *defaultAttribute;

@end

@implementation HJAvatarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.avatarView];
    }
    
    return self;
}

- (void)hj_makeAvatarWithAttribute:(void (^)(HJAvatarAttribute *))attributeBlock
{
    attributeBlock(self.defaultAttribute);
    
    @weakify(self);
    [self.avatarView setImageWithURL:self.defaultAttribute.imageURLA placeholder:self.defaultAttribute.placeHolderImgA options:YYWebImageOptionShowNetworkActivity progress:nil transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {

        UIImage *squreImage = nil;
        
        CGFloat scale =  [UIScreen mainScreen].scale;
        UIGraphicsBeginImageContextWithOptions(weak_self.defaultAttribute.avatarSizeA, NO, scale);
        [image drawInRect: (CGRect) {0, 0, weak_self.defaultAttribute.avatarSizeA}];
        squreImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return [squreImage imageByRoundCornerRadius:weak_self.defaultAttribute.radiusA borderWidth:weak_self.defaultAttribute.borderWidthA borderColor:weak_self.defaultAttribute.borderColorA];
    } completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {

    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.avatarView.frame = self.bounds;
}

#pragma mark - 懒加载
- (UIImageView *)avatarView
{
    if (!_avatarView) {
        _avatarView = [UIImageView new];
    }
    
    return _avatarView;
}

- (HJAvatarAttribute *)defaultAttribute
{
    if (!_defaultAttribute) {
        _defaultAttribute = [HJAvatarAttribute defauleAttribute];
    }
    
    return _defaultAttribute;
}

@end
