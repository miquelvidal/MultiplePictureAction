//
//  MkAssetFetcher.m
//  MultiPicAction
//
//  Created by Miquel Isidre Vidal Carretero on 1/13/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import "MkAssetFetcher.h"

@implementation MkAssetFetcher

@synthesize elDelegat;
@synthesize arrayDiposit;
@synthesize arrayStringUrls;

-(void) startFetching:(NSManagedObjectContext*) context withLibrary:(ALAssetsLibrary*)library{
    NSLog(@"startFetching");
    library = [[ALAssetsLibrary alloc] init];
    ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *myasset)
    {
        if (myasset==nil) {
            NSLog(@"es nillll");
        }
        else {
            [myasset thumbnail];
            NSLog(@"%@",myasset);
        }
        NSLog(@"Block1");
        ALAssetRepresentation *rep = [myasset defaultRepresentation];
        NSLog(@"Block1.1");
        NSLog(@"%@",rep);
        NSLog(@"size:%llu",rep.size);
        //peta en la següent instrucció
        //CGImageRef iref = [rep fullResolutionImage];
        NSLog(@"Block1.2");
        NSLog(@"Block2");
        MkDbAssetIn *unMkAssetIn = [NSEntityDescription insertNewObjectForEntityForName:@"MkDbAssetIn" inManagedObjectContext:context];
        unMkAssetIn.filename = [rep filename];
        Byte *buffer = (Byte*)malloc(rep.size);
        NSUInteger buffered = [rep getBytes:buffer fromOffset:0.0 length:rep.size error:nil];
        NSLog(@"Block3");
        NSData *data = [NSData dataWithBytes:buffer length:buffered];
        unMkAssetIn.data = data;
        NSLog(@"Block4");
        [arrayDiposit addObject:unMkAssetIn];
        [elDelegat assetAdded];
        NSLog(@"K burrro");
    };
    ALAssetsLibraryAccessFailureBlock failureblock  = ^(NSError *myerror)
    {
        NSLog(@"MkAssetFetcher cant get image - %@",[myerror localizedDescription]);
        [elDelegat assetFailed];
    };
    for (NSString* url in arrayStringUrls) {
        NSLog(@"Passada %@",url);
        NSURL* unaUrl = [NSURL URLWithString:url];
        NSLog(@"Passada2");
        [library assetForURL:unaUrl resultBlock:resultblock failureBlock:failureblock];
    }
    
}

@end
