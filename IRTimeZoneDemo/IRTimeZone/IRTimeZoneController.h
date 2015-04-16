//
//  IRTimeZoneController.h
//  IRTimeZoneDemo
//
//  Created by Hijazi on 16/4/15.
//  Copyright (c) 2015 iReka Soft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IRTimeZoneController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>{
    
    NSDate *now;
    BOOL isSearching;
}

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) NSMutableArray *searchingArray;

@property (strong,nonatomic) NSArray *knownTimeZoneNames;
@property (strong,nonatomic) NSArray *displayNameTimeZoneNames;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
