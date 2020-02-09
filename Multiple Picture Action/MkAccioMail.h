//
//  MkAccioMail.h
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import <MessageUI/MFMailComposeViewController.h>


#import "MkAccio.h"
#import "MkTransporter.h"
#import "MkDbFetcher.h"
#import "MkDbAssetIn.h"
#import "MkAssetFetcher.h"

#import "MkDbImg.h"

#import "VistaEntrada.h"

#import "Objective-Zip/ZipFile.h"
#import "Objective-Zip/ZipException.h"
#import "FileInZipInfo.h"
#import "ZipWriteStream.h"
#import "ZipReadStream.h"

@interface MkAccioMail : MkAccio <MFMailComposeViewControllerDelegate, MkAssetFetcherDelegate> {
    NSArray* fotosSeleccionades; 
    NSMutableArray* arrayUrls;
    NSMutableArray* arrayDiposit;
    NSArray* assetsSelecionats;
    int okAssets;
    int koAssets;
}

@property(nonatomic) Boolean zipCompress;
@property(nonatomic) NSInteger numSplit;
@property(nonatomic) NSMutableArray* tandesMails;

-(void)ferAccio;
-(NSString*)passarNom;

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error;
-(void)nextMail;
-(void)enviaMails;

-(void)assetFailed;
-(void)assetAdded;
@end
