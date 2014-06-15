//
//  Crop.m
//  CropExample
//
//  Created by juhana on 15/06/14.
//  Copyright (c) 2014 juhana. All rights reserved.
//

#import "Crop.h"

@implementation Crop

@synthesize imageView,secondView;

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openFileURL:) name:@"fileurl" object:nil];
    }
    return self;
}

-(void)openFileURL:(NSNotification*)notification
{
    if(notification!=nil){
        NSDictionary* dict = notification.userInfo;
        if(dict!=nil){
            NSURL* url = (NSURL*)[dict objectForKey:@"url"];
            NSImage* img = [[NSImage alloc]initWithContentsOfURL:url];
            [imageView setImage:img];
            
            NSImage* second = [[NSImage alloc]initWithSize:NSMakeSize(img.size.width/2, img.size.height/2)];
            NSRect rect = NSMakeRect(0, 0, img.size.width/2, img.size.height/2);
            [second lockFocus];
            [img drawInRect:rect fromRect:rect operation:NSCompositeCopy fraction:1.0];
            [second unlockFocus];
            
            [secondView setImage:second];
        }
    }
}
@end
