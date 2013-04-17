//
//  GDraw.h
//  CustomCell
//
//  Created by Paweł Czechowski on 16.04.2013.
//  Copyright (c) 2013 Pawel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDraw : NSObject

- (void)drawRoundRectWithColor: (UIColor*)color margin:(CGFloat)margin cornerRadius:(CGFloat)cornerRadius lineWidth:(CGFloat)lineWidth frame:(CGRect)frame isFill:(BOOL)isFill;

- (void)drawLine: (CGPoint)startPoint endPoint:(CGPoint)endPoint lineWidth:(CGFloat)lineWidth;

@end
