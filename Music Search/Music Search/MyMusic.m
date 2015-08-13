//
//  MyMusic.m
//  Music Search
//
//  Created by Nuvvala on 8/12/15.
//  Copyright (c) 2015 Narasimha. All rights reserved.
//

#import "MyMusic.h"

@implementation MyMusic


-(instancetype)initWithTrack:(NSString *)track artist:(NSString *)artist album:(NSString *)album imageURL:(NSString *)imageURL
{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.track = track;
    self.artist=artist;
    self.album = album;
    [self downloadImageFromURL:imageURL];
    
    return self;
}

-(void)downloadImageFromURL:(NSString *)imageURL
{
    NSURL *url = [NSURL URLWithString:imageURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    self.icon = [UIImage imageWithData:data];
}
-(instancetype)initWithLyrics:(NSString *)lyric{

    self = [super init];
    if (!self) {
        return nil;
    }
    else{
    
        self.lyrics = lyric;
    }
    return self;
}

@end
