//
//  RootViewController.m
//  headerImageTableViewEffect
//
//  Created by ian on 15/1/8.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "RootViewController.h"

#define kWindowHeight 100.0f
#define kImageHeight 200.0f

@interface RootViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    CGFloat _animateFactor;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.frame = CGRectMake(0,kWindowHeight - kImageHeight, self.view.frame.size.width, kImageHeight - kWindowHeight + self.view.frame.size.height);
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!section) {
        return 1;
    }
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellReuseIdentifier   = @"cell";
    static NSString *windowReuseIdentifier = @"clean";
    
    UITableViewCell *cell = nil;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:windowReuseIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:windowReuseIdentifier];
            cell.backgroundColor = [UIColor clearColor];
            cell.contentView.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseIdentifier];
            cell.selectionStyle  = UITableViewCellSelectionStyleNone;
        }
    }
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0){
        return kWindowHeight;
    }
    return 44;
}


#pragma mark - UIScrollViewDelegate
- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self updateOffsets];
}

- (void)updateOffsets {
    CGFloat yOffset   = _tableView.contentOffset.y;
    CGFloat threshold = kImageHeight - kWindowHeight;

    if (yOffset > -threshold && yOffset < 0) {
        
        _scrollView.contentOffset = CGPointMake(0.0, floorf(yOffset / 2.0));

    } else if (yOffset < 0) {
        
        _scrollView.contentOffset = CGPointMake(0.0, yOffset + floorf(threshold / 2.0));
        
    } else {
        
        _scrollView.contentOffset = CGPointMake(0.0, yOffset);
        
    }
// 加入放大效果
//    _animateFactor = -(_tableView.contentOffset.y)*0.03;
//
//    ((UIScrollView *)[_scrollView viewWithTag:9999]).transform = CGAffineTransformMakeScale(_animateFactor < 1.0 ? 1.0 : _animateFactor,
//                                                         _animateFactor < 1.0 ? 1.0 : _animateFactor);

}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_scrollView];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, kImageHeight);
        imageView.tag = 9999;
        imageView.image = [UIImage imageNamed:@"demo"];
        [_scrollView addSubview:imageView];
    }
    return _scrollView;
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
