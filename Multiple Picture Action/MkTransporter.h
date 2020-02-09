//
//  MkTransporter.h
//  20120530Test4Views
//
//  Created by Miquel Isidre Vidal Carretero on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MkTransporter : NSObject
+ (id)getObjectFromNSString:(NSString*)unaClau;
+ (void)setObject:(id)unObjecte forNSString:(NSString*)unaClau;
@end
