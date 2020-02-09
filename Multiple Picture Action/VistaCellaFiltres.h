//
//  VistaCellaFiltres.h
//  MultiPicAction
//
//  Created by Miquel Isidre Vidal Carretero on 1/18/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "framework/Source/GPUImage.h"

@interface VistaCellaFiltres : UICollectionViewCell

//@property (nonatomic) UIImage* imatgeOrginal;
@property (nonatomic) IBOutlet UIImageView* unaImageView;
@property (nonatomic) IBOutlet UIButton* unBoto;
@property (nonatomic) IBOutlet NSString* txtFiltre;
@property (nonatomic) GPUImageOutput* unFiltre;

@end
