/-  *upfs, gora, store=graph-store
/+  default-agent, dbug
|%
+$  versioned-state
  $%  state-zero
  ==
::
+$  state-zero
  $:  %0
      state-0
  ==
::
+$  card     card:agent:gall
+$  eyre-id  @ta
--
::
%-  agent:dbug
::
=|  state-zero
=*  state  -
::
^-  agent:gall
=<
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    hc    ~(. +> bowl)
::
++  on-init
  ^-  (quip card _this)
  ~&  >  [%upfs %online]
  :_  this
  ^-  (list card)
  :~  :*
    %pass   `path`[%ipfs %watch %chat ~]
    %agent  [our.bowl %graph-store]
    %watch  `path`[%updates ~]
  ==  ==
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  ole=vase
  =/  old=versioned-state  !<(versioned-state ole)
  ~&  >  [%upfs %reload]
  `this(state old)
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+    mark  `this
      %upfs-sudo
    ?>  (team:title our.bowl src.bowl)
    =/  adam=admin  !<(admin vase)
    ?-    -.adam
        %node
      `this(node site.adam)
    ::
        %cred
      ?:  =('' node)
        ~&  >>  [%enter %node %first ~]
        `this
      =.  ipfs-creds
        %^  cat  3  'Basic '
        %-  en:base64:mimes:html
        %-  as-octs:mimes:html
        (rap 3 [user.adam ':' pass.adam ~])
      `this
    ::
        %read
      ?.  =(our.bowl -.res.adam)
        ~&  >>>  [%must %be %owned %chat ~]
        `this
      `this(chat res.adam)
    ::
        %wind
      `this(wind !wind)
    ::
        %gora
      `this
    ==
  ==    
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?+    -.sign  `this
      %kick
    :_  this
    ^-  (list card)
    :~  :*
      %pass   wire
      %agent  [our.bowl %graph-store]
      %watch  [%updates ~]
    ==  ==
  ::
      %watch-ack
    ?:  =(~ p.sign)
      `this
    ~&  >>>  [%error %watching %graph-store ~]
    `this
  ::
      %fact
    ?.  ?=(%graph-update-3 p.cage.sign)
      `this
    =/  upd=update:store  !<(update:store q.cage.sign)
    ?.  ?=(%add-nodes -.q.upd)
      `this
    ?:  |(=('' node) =('' ipfs-creds))
      `this
    =/  time=(set index:store)  ~(key by nodes.q.upd)
    =/  nine=(list node:store)  ~(val by nodes.q.upd)
    ?~  nine
      `this
    ?.  =(1 (lent nine))
      `this
    ?.  ?=(%.y -.post.i.nine)
      `this
    =/  nade=post:store  p.post.i.nine
    =/  nude=(list content:store)  contents.nade
    ?.  ?=([[%url @t] [%text @t] ~] nude)
      `this
    =/  lur=[%url url=@t]  -.nude
    =/  dup=update:store
      :-  (add now.bowl ~s1)
      :+  %remove-posts
        resource.q.upd
      time
    :_  this
    %+  welp
      %-  ~(snek make:hc [resource.q.upd author.nade])
      [url.lur ipfs-creds node]
    :~  :*
      %pass   /upfs/delbot/(scot %da now.bowl)
      %agent  [our.bowl %graph-store]
      %poke   %graph-update-3  !>(dup)
    ==  ==
  ==
++  on-watch  on-watch:def
++  on-arvo   on-arvo:def
++  on-peek   on-peek:def
++  on-leave  on-leave:def
++  on-fail   on-fail:def
--
|_  bol=bowl:gall
++  make
  |_  [res=resource:store who=@p]
  ++  snek
    |=  [url=@t pas=@t nod=@t]
    ^-  (list card)
    ?>  &(=(res chat) =(our.bol -.res))
    ::
    ::  make the graph-card
    ::
    =/  tel=@t
      (rap 3 ['got ' url '\0a' 'returning shortly ' ~])
    =/  lsc=(list content:store)
      :~  [%text tel]
          [%mention who]
      ==
    =/  upd=update:store
      :-  (add now.bol 2)
      :+  %add-nodes
          res
      %-  ~(put by *(map index:store node:store))
      :-  ~[(add now.bol 2)]
      :_  [%empty ~]
      [%& [our.bol ~[(add now.bol 2)] now.bol lsc ~ ~]]
    ::
    ::  now the thread-card
    ::
    =/  tid=@ta  (cat 3 'upfs_' (scot %uv (sham eny.bol)))
    =/  sat      [~ `tid byk.bol %ipfs-make !>(`[res who url pas nod])]
    :~  :*
      %pass   /upfs/response/bot/(scot %da now.bol)
      %agent  [our.bol %graph-store]
      %poke   %graph-update-3  !>(upd)
        ==
        :*
      %pass   /upfs/ted/machine/(scot %da now.bol)
      %agent  [our.bol %spider]
      %poke   %spider-start  !>(sat)
    ==  ==
  ::
  ++  oops
    |=  msg=(list content:store)
    ^-  (list card)
    ?>  &(=(res chat) =(our.bol -.res))
    =/  upd=update:store
    :-  (add now.bol 2)
    :+  %add-nodes
        res
    %-  ~(put by *(map index:store node:store))
    :-  ~[(add now.bol 2)]
    :_  [%empty ~]
    [%& [our.bol ~[(add now.bol 2)] now.bol msg ~ ~]]
    :~  :*
      %pass   /upfs/response/bot/(scot %da now.bol)
      %agent  [our.bol %graph-store]
      %poke   %graph-update-3  !>(upd)
    ==  ==
::
  ++  swap
    |=  [in=index:store url=@t]
    ^-  (list card)
    ?>  &(=(res chat) =(our.bol -.res))
    ::  trigger thread
    =/  tel=@t
    (rap 3 ['got ' url '\0a' 'returning shortly ' ~])
    =/  lsc=(list content:store)
    :~  [%text tel]
        [%mention who]
    ==
    =/  upd=update:store
    :-  (add now.bol 2)
      :+  %add-nodes
          res
      %-  ~(put by *(map index:store node:store))
      :-  ~[(add now.bol 2)]
      :_  [%empty ~]
      [%& [our.bol ~[(add now.bol 2)] now.bol lsc ~ ~]]
    :~  :*
      %pass   /upfs/response/bot/(scot %da now.bol)
      %agent  [our.bol %graph-store]
      %poke   %graph-update-3  !>(upd)
    ==  ==
  --
--