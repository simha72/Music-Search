//
//  LyricsData.h
//  Music Search
//
//  Created by Nuvvala on 8/13/15.
//  Copyright (c) 2015 Narasimha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPRequestOperation.h>

@interface LyricsData : NSObject

-(void)getStreamsFromURLString:(NSString *)urlString success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure;

@end
