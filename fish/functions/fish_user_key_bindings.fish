function fish_user_key_bindings
    # 绑定 emacas 快捷键到插入模式中
    fish_default_key_bindings -M insert

    # 绑定 vim 快捷键
    # 参数 --no-erase 代表冲突时不覆盖之前设置的命令
    # 参数 insert 代表默认进入插入模式
    fish_vi_key_bindings --no-erase insert
end
