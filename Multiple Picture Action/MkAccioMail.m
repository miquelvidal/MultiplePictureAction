//
//  MkAccioMail.m
//  Multiple Picture Action
//
//  Created by Miquel Isidre Vidal Carretero on 1/4/13.
//  Copyright (c) 2013 Leuqim. All rights reserved.
//

#import "MkAccioMail.h"

@implementation MkAccioMail

@synthesize numSplit;
@synthesize zipCompress;
@synthesize tandesMails;

-(void)ferAccio{
/*    //NSLog(@"Accio Mail aqui - %i mails - comprimit= %d",self.numSplit,self.zipCompress);
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    
    // Set the subject of email
    [picker setSubject:@"Pictures from my iPad!"];
    
    // Add email addresses
    // Notice three sections: "to" "cc" and "bcc"
    //[picker setToRecipients:[NSArray arrayWithObjects:@"emailaddress1@domainName.com", @"emailaddress2@domainName.com", nil]];
    //[picker setCcRecipients:[NSArray arrayWithObject:@"emailaddress3@domainName.com"]];
    //[picker setBccRecipients:[NSArray arrayWithObject:@"emailaddress4@domainName.com"]];
    
    // Fill out the email body text
    NSString *emailBody = @"I just took this picture, check it out.";
    
    // This is not an HTML formatted email
    [picker setMessageBody:emailBody isHTML:NO];
    
    // Create NSData object as PNG image data from camera image
    ////NSData *data = UIImagePNGRepresentation(image);
*/
    // Attach image data to the email
    // 'CameraImage.png' is the file name that will be attached to the email
    ////[picker addAttachmentData:data mimeType:@"image/png" fileName:@"CameraImage"];
    //NSArray* fotosSeleccionades = [MkDbFetcher imatgesSeleccionades:[MkTransporter getObjectFromNSString:@"managedObjectContext"]];
    
    
    ///NSArray* fotosSeleccionades = [MkDbFetcher imatgesSeleccionadesMesAlbum:[MkTransporter getObjectFromNSString:@"managedObjectContext"]];
    
    //fem amb el MkDbAssetIn
    NSManagedObjectContext* context = [MkTransporter getObjectFromNSString:@"managedObjectContext"];
    ALAssetsLibrary* library = [MkTransporter getObjectFromNSString:@"library"];
    
    fotosSeleccionades = [MkDbFetcher imatgesSeleccionadesMesAlbum:context];
    arrayUrls = [NSMutableArray new];
    
    for (MkDbImg* unaMkDbImatge in fotosSeleccionades) {
        [arrayUrls addObject:[unaMkDbImatge.url copy]];
    }
    
    
    MkAssetFetcher* unAssetFetcher = [[MkAssetFetcher alloc] init];
    unAssetFetcher.elDelegat = self;
    arrayDiposit = [NSMutableArray new];
    unAssetFetcher.arrayDiposit = arrayDiposit;
    unAssetFetcher.arrayStringUrls = arrayUrls;
    okAssets = 0;
    koAssets = 0;
    [unAssetFetcher startFetching:context withLibrary:library];
    
}
-(void)assetFailed{
    okAssets++;
    VistaEntrada* vistaEntrada = [MkTransporter getObjectFromNSString:@"vistaEntrada"];
    vistaEntrada.txtLog.text = [NSString stringWithFormat:@"Loading pictures %i/%i and %i errors",okAssets,arrayUrls.count,koAssets];
    if (okAssets+koAssets==arrayUrls.count) {
        [self enviaMails];
    }
}
-(void)assetAdded{
    koAssets++;
    VistaEntrada* vistaEntrada = [MkTransporter getObjectFromNSString:@"vistaEntrada"];
    vistaEntrada.txtLog.text = [NSString stringWithFormat:@"Loading pictures %i/%i and %i errors",okAssets,arrayUrls.count,koAssets];
    if (okAssets+koAssets==arrayUrls.count) {
        [self enviaMails];
    }
}

-(void)enviaMails {
    NSLog(@"EnviaMails");
    assetsSelecionats = [MkDbFetcher assetsSeleecionats:[MkTransporter getObjectFromNSString:@"managedObjectContext"]];
    // les tandes
    tandesMails  =  [[NSMutableArray alloc] initWithCapacity:numSplit];
    for (int j=0; j<numSplit; j++) {
        //per cada tanda posem una cua on afegir les fotos
        [tandesMails addObject:[[NSMutableArray alloc] init]];
    }
    //reparim les fotos en les tandes de correus
    for (int k = 0; k<assetsSelecionats.count; k++) {
        //agafem la següent tanda per foto
        NSMutableArray* tmpArray = [tandesMails objectAtIndex:(k%numSplit)];
        [tmpArray addObject:[assetsSelecionats objectAtIndex:k]];
    }
    NSLog(@"primera crida a nextmail");
    [self nextMail];
    //ara per cada tanda hem d'enviar un correu
    //for (l=0; l<numSplit; l++) {
       //[tandesMails re]
    //}
    /*
    int i= 0;
    ZipFile *zipFile;
    ZipWriteStream *stream1;
    NSString *filePath;
    if (zipCompress) {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"test.zip"];
        filePath = path;
        //       filePath= [documentsDir stringByAppendingPathComponent:@"test.zip"];
        zipFile = [[ZipFile alloc] initWithFileName:filePath mode:ZipFileModeCreate];
        NSLog(@"%@",filePath);
        if (!zipFile) {
            NSLog(@"ZipFile no nil");
        }
    }
    NSData* data ;
    for (MkDbImg *unaImatge in fotosSeleccionades) {
        i++;
        data = UIImagePNGRepresentation(unaImatge.thumbnail.imatge);
        
        //si es en zip es fa un fitxer zip
        if (zipCompress) {
            stream1= [zipFile writeFileInZipWithName:[NSString stringWithFormat:@"image%i.png",i] fileDate:[NSDate dateWithTimeIntervalSinceNow:-86400.0] compressionLevel:ZipCompressionLevelBest];
            [stream1 writeData:data];
            [stream1 finishedWriting];

        }
        else {
         [picker addAttachmentData:data mimeType:@"image/png" fileName:[NSString stringWithFormat:@"image%i.png",i]];
        }
    }
    if (zipCompress) {
        [zipFile close];
        data = [NSData dataWithContentsOfFile:filePath];
        //NSLog(@"longitud del fitxer %i",[data length]);
        [picker addAttachmentData:data mimeType:@"application/zip" fileName:@"pictures.zip"];
    }
    
    // Show email view
    ///    [MkTransporter setObject:self forNSString:@"vistaEntrada"];
    [[MkTransporter getObjectFromNSString:@"vistaEntrada"] presentViewController:picker animated:YES completion:nil];
 
     */
    // Release picker
    ///[picker release];
}

-(void) nextMail{
    NSLog(@"nextMail");
    if (tandesMails) {
        NSLog(@"tandesMails");
        if (tandesMails.count!=0) {
            NSLog(@"enviar prox correu");
            NSMutableArray* tmpTanda = [tandesMails objectAtIndex:0];
            [tandesMails removeObjectAtIndex:0];
            //NSArray* fotosSeleccionades = tmpTanda;
            NSArray* tandaAssetsSeleccionats = tmpTanda;
            MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
            picker.mailComposeDelegate = self;
            
            [picker setSubject:@"Pictures from my iPad!"];
            
            
            // Fill out the email body text
            NSString *emailBody = @"I just took this picture, check it out.";
            
            // This is not an HTML formatted email
            [picker setMessageBody:emailBody isHTML:NO];
            
            //treure la pròxima tanda de mail de la cua de tandes
            //enviar següent la tanda extreta per mail
            int i= 0;
            ZipFile *zipFile;
            ZipWriteStream *stream1;
            NSString *filePath;
            if (zipCompress) {
                NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                NSString *documentsDirectory = [paths objectAtIndex:0];
                
                NSString *path = [documentsDirectory stringByAppendingPathComponent:@"test.zip"];
                filePath = path;
                //       filePath= [documentsDir stringByAppendingPathComponent:@"test.zip"];
                zipFile = [[ZipFile alloc] initWithFileName:filePath mode:ZipFileModeCreate];
                NSLog(@"%@",filePath);
                if (!zipFile) {
                    NSLog(@"ZipFile no nil");
                }
            }
            NSData* data ;
            //for (MkDbImg *unaImatge in fotosSeleccionades) {
            for (MkDbAssetIn *unaAssetIn in tandaAssetsSeleccionats) {
                i++;
                if ([MkDbAssetIn class]==[unaAssetIn class]) {
                    NSLog(@"El class está ok");
                }
                else
                    NSLog(@"%@ classe",[unaAssetIn class]);
                data = unaAssetIn.data;
                
                //si es en zip es fa un fitxer zip
                if (zipCompress) {
                    //stream1= [zipFile writeFileInZipWithName:[NSString stringWithFormat:@"image%i.png",i] fileDate:[NSDate dateWithTimeIntervalSinceNow:-86400.0] compressionLevel:ZipCompressionLevelBest];
                    stream1= [zipFile writeFileInZipWithName:unaAssetIn.filename fileDate:[NSDate dateWithTimeIntervalSinceNow:-86400.0] compressionLevel:ZipCompressionLevelBest];
                    [stream1 writeData:data];
                    [stream1 finishedWriting];
                    
                }
                else {
                    //[picker addAttachmentData:data mimeType:@"image/png" fileName:[NSString stringWithFormat:@"image%i.png",i]];
                    [picker addAttachmentData:data mimeType:[NSString stringWithFormat:@"image/pn%@",[unaAssetIn.filename pathExtension]] fileName:unaAssetIn.filename];
                }
            }
            if (zipCompress) {
                [zipFile close];
                data = [NSData dataWithContentsOfFile:filePath];
                //NSLog(@"longitud del fitxer %i",[data length]);
                [picker addAttachmentData:data mimeType:@"application/zip" fileName:@"pictures.zip"];
            }
            
            // Show email view
            ///    [MkTransporter setObject:self forNSString:@"vistaEntrada"];
            [[MkTransporter getObjectFromNSString:@"vistaEntrada"] presentViewController:picker animated:YES completion:nil];
            
        }
        else{
            //hi ha tandes object però no queden tandes per fer ... doncs res!!
            
        }
    }
}

-(NSString*)passarNom{
    if (zipCompress) {
        if (numSplit==1) {
            return [NSString stringWithFormat:@"Send one Mail with zip compression"];
        }else{
            return [NSString stringWithFormat:@"Send Mail - split in %i mails with zip compression",numSplit];
        }
    }
    else if (numSplit==1) 
        return [NSString stringWithFormat:@"Send one Mail"];
    return [NSString stringWithFormat:@"Send Mail split in %i mails",numSplit];
    
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error{
    /*
     if (error)
        msstge --> error al enviar
     else
        if (queden tandes)
            proxima tanda
        else
            missatge tot ok
     */
    
    //[self dismissModalViewControllerAnimated:YES];
    VistaEntrada* vistaEntrada = [MkTransporter getObjectFromNSString:@"vistaEntrada"];
    if ((result==MFMailComposeResultCancelled)||(result==MFMailComposeResultFailed)) {
        vistaEntrada.txtLog.text = @"Error sending mail";
    }
    else {
        if (tandesMails.count!=0) {
//            NSLog(@"MkAccioMail: es crida el pròxim correu");
            [self nextMail];
        }
        else {
            vistaEntrada.txtLog.text = @"Mail sent";
            [vistaEntrada step3Done];
        }
    }
    [vistaEntrada dismissViewControllerAnimated:NO completion:nil];
    
    
}
@end
