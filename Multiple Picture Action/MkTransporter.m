//
//  MkTransporter.m
//  20120530Test4Views
//
//  Created by Miquel Isidre Vidal Carretero on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MkTransporter.h"

NSMutableDictionary* unDiccionari;
@implementation MkTransporter

+ (id)getObjectFromNSString:(NSString*)unaClau {
    if (unDiccionari==nil) {
        return nil;
    }
    else return [unDiccionari objectForKey:unaClau];
}
+ (void)setObject:(id)unObjecte forNSString:(NSString*)unaClau{
    if (unDiccionari==nil) {
        unDiccionari = [[NSMutableDictionary alloc] init];
    }
    [unDiccionari setValue:unObjecte forKey:unaClau];
}
@end
