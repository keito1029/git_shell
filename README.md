# git_shell            
          
This program reduces push work to github          
          
# Setup            
1. [Create New tokens](https://qiita.com/kz800/items/497ec70bff3e555dacd0)          
1. Create .netrc and [Token in password](https://qiita.com/0uts1de/items/7eb13fea6ac5f02da44b)          
	> [おまけ](https://qiita.com/0uts1de/items/7eb13fea6ac5f02da44b#%E3%81%8A%E3%81%BE%E3%81%91)の項目を参照          
          
## Changed from nano to vim      
      
Following type command and chose vim editor.      
      
```      
sudo update-alternatives --config editor      
```      
      
## export_push.sh           
    
You can export directory to remote repository from anywhere directory.    
            
```          
$ sh ~/git_shell/export_push.sh ~/"your push or pull directory path"            
```          
          
## import_pull.sh           
        
You can import remote repository from anywhere directory.    
    
```        
$ sh ~/git_shell/import_pull.sh ~/"your push or pull directory path"        
```        
      
## merge.sh           
        
When you want to merge different device edit with local edit, you can import remote repository from any directory.    
	> https://kray.jp/blog/git-pull-rebase/  
    
```        
$ sh ~/git_shell/merge.sh ~/"your push or pull directory path"        
```        
    
## reset.sh           
        
* Be carefull    
	Local edits would disappear.    
	    
When you want to import remote repository, you can remove local edits from any directory.    
	> https://www-creators.com/archives/1097  
    
```        
$ sh ~/git_shell/reset.sh ~/"your push or pull directory path"        
```        
    
## Advice

* When push too big files  
You have to rename the directory you want to push. After cloning the repository before renaming it, it is better to make the file smaller and delete the original directory.

* When you want to copy a remote repository but import.sh does not work  
You should use reset.sh

  

