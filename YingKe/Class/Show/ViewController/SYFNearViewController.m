//
//  SYFNearViewController.m
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/10.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "SYFNearViewController.h"
#import "SYFLiveHandler.h"
#import "SYFNearLiveCell.h"
static NSString *indentifier = @"SYFNearLiveCell";
#define kMargin 5
#define kItemWidth 100

@interface SYFNearViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) UICollectionView *nearCollection;

@property(nonatomic,copy)NSArray *dataList;

@end

@implementation SYFNearViewController
-(UICollectionView *)nearCollection{
    if (!_nearCollection ) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _nearCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0,KScreen_Width,KScreen_Height - 64 - 49) collectionViewLayout:layout];
        

        _nearCollection.dataSource = self;
        _nearCollection.delegate   = self;
        _nearCollection.backgroundColor = [UIColor whiteColor];
        [_nearCollection registerClass:[SYFNearLiveCell class] forCellWithReuseIdentifier:indentifier];
        [self.view addSubview:_nearCollection];
    }
    
    return _nearCollection;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self loadData];
}
-(void)loadData{
    [SYFLiveHandler executeGetNearLiveTaskWithSuccess:^(id obj) {
        
        self.dataList = obj;
        
        [self.nearCollection reloadData];
    
    } failed:^(id obj) {
        
    }];
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    NSLog(@"count->%ld",self.dataList.count);
  return   self.dataList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    SYFNearLiveCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentifier forIndexPath:indexPath];
    cell.live = self.dataList[indexPath.row];

    
    return  cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    

    return CGSizeMake(100,120);
    
    
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    NSInteger count = self.nearCollection.width / kItemWidth;
    CGFloat maxWidth = self.nearCollection.width  - kItemWidth * count;
    CGFloat magin = maxWidth / (count+1);
  
    return UIEdgeInsetsMake(15, magin, 5, magin);
}
//cell 将要显示时调用
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SYFNearLiveCell * LiveCell = (SYFNearLiveCell *)cell;
    
    [LiveCell showAnimation];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
