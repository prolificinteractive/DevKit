# ReusableView
**Subspec: Utility/ReusableView**

```
/// Default reuse identifier is set with the class name.
static var reuseIdentifier: String { get }
```

The `ReusableView` protocol can be added to any view to be reused. A default implementation of the `reuseIdentifier` is given and will return a string of the class name. 

`ReusableView` is often paired with UITableView or UICollectionView extensions to easily dequeue and reuse a UICollectionViewCell or UITableViewCell.

Supported Views: 
* UICollectionViewCell
* UITableViewCell
* UITableViewHeaderFooterView