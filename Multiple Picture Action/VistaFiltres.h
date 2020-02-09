//
//  VistaFiltres.h
//  MultiPicAction
//
//  Created by Miquel Isidre Vidal Carretero on 1/18/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "framework/Source/GPUImage.h"
#import "MkTransporter.h"
#import "MkDbFetcher.h"

#import "MkDbImg.h"
#import "MkDbImgThumbnail.h"

#import "VistaCellaFiltres.h"

static NSString *CellIdentifier = @"VistaCellaFiltres";

@interface VistaFiltres : UICollectionViewController

+(GPUImageOutput*)filtrePerNum:(NSInteger) index;
+(NSInteger)numFiltres;
+(NSString*)txtFiltre:(NSInteger)index;
-(IBAction)seleccionatFiltre:(id)sender;

@end
