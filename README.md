#IanPageTableViewDemo
<img src="https://coding.net/u/ianisme/p/IanPageTableViewDemo/git/raw/master/Demo.gif"  alt="效果演示by ian" />
<p>此Demo是模仿path和QQ空间的个人主页景深效果.</p>
<p>思路:在UITableView下放入一个UISrollView的叠加层, 通过监听contenoffset控制坐标, 达到效果!</p>
<p>
注意：打开warning注释可以打开放大效果
#warning 加入放大效果
//    _animateFactor = -(_tableView.contentOffset.y)*0.03;
//
//    ((UIScrollView *)[_scrollView viewWithTag:9999]).transform = CGAffineTransformMakeScale(_animateFactor < 1.0 ? 1.0 : _animateFactor,
//                                                         _animateFactor < 1.0 ? 1.0 : _animateFactor);
</p>
