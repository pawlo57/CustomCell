//
//  PickupRow.h
//  CustomCell
//
//  Created by Paweł Czechowski on 15.04.2013.
//  Copyright (c) 2013 Pawel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PickupRow : NSObject

@property (nonatomic) int index;
@property (nonatomic) CGRect frame;
//@///property (nonatomic) CGFloat height;

- (void)drawContent;

- (id)initWithHeight:(CGFloat)height rowIndex:(int)index Frame:(CGRect)frame lineWidth:(CGFloat)width;

@end
