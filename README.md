# Potato
Game Engine

# GitHub命令
...\Potato>git clone https://github.com/Copilot2022/Potato Git
...> git status
...> git add *
...> git reset .
提交代码：           ...> git commit -m "Setup basic Application and Entry Point."
查看远程分支：       ...> git branch -r
检查本地分支：       ...> git branch
检查是否有提交记录： ...> git log
拉取远程更改：       ...> git pull origin main
推送：              ...> git push origin master

# 输出目录和中间目录配置
Output Directory:$(SolutionDir)bin\$(Configuration)-$(Platform)\$(ProjectName)\
Intermediate Directory:$(SolutionDir)bin-int\$(Configuration)-$(Platform)\$(ProjectName)\

# Git

定义子模块：git submodule add https://github.com/gabime/spdlog Potato/vendor/spdlog

# 日志系统
https://github.com/gabime/spdlog

# 工具集生成项目文件
https://github.com/premake/premake-core
...> vendor\bin\premake\premake5.exe vs2022

