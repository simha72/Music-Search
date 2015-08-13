//
//  MusicTableViewController.h
//  Music Search
//
//  Created by Nuvvala on 8/12/15.
//  Copyright (c) 2015 Narasimha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicTableViewController : UITableViewController


@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *musicItems;
@property(nonatomic,strong)NSString *song;

@end
