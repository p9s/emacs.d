;;; init-erc.el

(load "~/.ercpass")
(require 'erc-services)
(erc :server "irc.freenode.net" :port 6667 :nick "p9s")
(erc-services-mode 1)
(setq erc-prompt-for-nickserv-password nil)
(setq erc-nickserv-passwords
      `((freenode     (("p9s" . ,freenode-nick-p9s-pass)))))

(setq erc-autojoin-channels-alist
      '(("freenode.net" "#perl5" "#perl6")))

;;; 命令列表
;;; /msg nickserv help	注冊 nickname
;;; /nick 名字	改名字
;;; /names [频道]	查看当前[频道]所有用户
;;; /whois 名字	常看某人資料
;;; /whoami	自己
;;; /who ip	常看某IP登錄的所有用戶
;;; /Who channel	显示此频道的人
;;; /Who *	显示参加当前频道的人
;;; /join #房間名	加入這個房間，如果房間不存在，服務器可能會創建這個房間
;;; /part #房間名 原因	離開房間，并留下原因
;;; /quit 退出的原因	退出服務器，并留下原因
;;; /away 原因	暫時離開，并留下原因
;;; /invite 昵稱 #房間名	邀請某人到指定房間
;;; /kick #房間名 昵稱 原因	剔出某人，附上原因，需要權限
;;; /topic #房間名' 房間主題	如果你是房間主持人，可以改變房間的主題
;;; /me 您要作的動作	向当前聊天室中发送一个动作 (动作使用第三人称陈述，例如 /me jumps)
;;; /msg 昵稱(或#房間) 有要說的話	向某人發信息
;;; /query 昵稱 要說的話	私聊
;;; /notice 昵稱(或#房間名) 要說的話
;;; /list	查看服務器上所有房間及主題
;;; /list #ubuntu-cn	列出這個房間
;;; /list -MIN a -MAX b	查看人數大于a小于b的房間
;;; /list * abc *	所有行abc字符串的房間
;;; /flush	终止当前命令的输出操作
;;; /help	显示所有IRC命令
;;; /join	加入/建立聊天室
;;; /leave channel	离开某一频道
;;; /mode +(-)i	锁住聊天室
;;; /mode +(-)o	设定管理员权限
;;; /knock	要求进入私人聊天室
;;; /invite	邀请用户进入私人聊天室
;;; /privmsg	悄悄话
;;; /ignore	忽略
;;; /topic	更换聊天室主题
;;; /kick	把用户踢出聊天室
;;; /quit	退出聊天室

(provide 'init-erc)
;;; init-erc.el ends here
