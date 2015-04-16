//
//  IRTimeZoneController.m
//  IRTimeZoneDemo
//
//  Created by Hijazi on 16/4/15.
//  Copyright (c) 2015 iReka Soft. All rights reserved.
//

#import "IRTimeZoneController.h"

@interface IRTimeZoneController ()

@end

@implementation IRTimeZoneController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.searchingArray = [NSMutableArray array];
    //タイムゾーンの一覧を取得する
    self.knownTimeZoneNames = [NSTimeZone knownTimeZoneNames];
    NSLog(@"timeZoneNamesArray: %@", self.knownTimeZoneNames);
    
    for (NSString *timeZoneName in self.knownTimeZoneNames) {
        
    }
    
    //省略形式の辞書を取得する
    NSDictionary *timeZoneNamesDic = [NSTimeZone abbreviationDictionary];
    NSLog(@"timeZoneNamesDic: %@", timeZoneNamesDic);
    
    now = [NSDate date];
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger retVal;
    
    if (!isSearching) {
        retVal = [self.knownTimeZoneNames count];
    }else{
        retVal = [self.searchingArray count];
    }
    
    return retVal;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    
    NSArray *array;
    if (!isSearching) {
        array = self.knownTimeZoneNames;
    }else{
        array = self.searchingArray;
    }

    NSDateFormatter * formatter = [NSDateFormatter new];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"US"]];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:array[indexPath.row]]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    

    NSString *stringFromDate = [formatter stringFromDate:now];
    
    NSLog(@"%@", stringFromDate);
    
    
    
    cell.textLabel.text = array[indexPath.row];
    cell.detailTextLabel.text = stringFromDate;
    
    return cell;
    
   
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    NSLog(@"search %@",searchBar);
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    isSearching = YES;
    [self.tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"search %@",searchText);

    [self.searchingArray removeAllObjects];
    
    for (NSString *name in self.knownTimeZoneNames){
        
        if ([name rangeOfString:searchText options:NSCaseInsensitiveSearch].location != NSNotFound){
            NSLog(@"is there %@",name);
            [self.searchingArray addObject:name];
        }
        
    }
    
    [self.tableView reloadData];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    isSearching = NO;
    [self.tableView reloadData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
