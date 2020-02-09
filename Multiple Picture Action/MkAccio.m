//
//  MkAccio.m
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import "MkAccio.h"

@implementation MkAccio
-(void)ferAccio{
    NSLog(@"S'ha cridat ferAccio de classe base");
}
-(NSString*)passarNom{
    return [NSString stringWithFormat:@"Nom base"];
}
@end
