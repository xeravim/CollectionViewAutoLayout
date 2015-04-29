# CollectionViewAutoLayout
CollectionViewAutoLayout
I am using auto layout and size classes with UICollectionViewCell. So the idea is to make an UI similar with Instagram.

The problem is that i can't fully understand how to add a proper autolayout because it seems add missing constraint didn't do the things magically.
when I add constraints, even there is no warning, it always shows "Will attempt to recover by breaking constraint" on target output. The goal is to make the profile cell dynamic based on iphone types, and dynamic height based on the bioLabel. For now I make it static which is very wrong, because when I use this method

systemLayoutSizeFittingSize:UILayoutFittingCompressedSize

it always return zero, and I guess its because of the misplace autolayout constraints. Can you advice me how can I calculate cell's size based on it's constraints? I had created the project in github, anyhelp would be much appreciated!
