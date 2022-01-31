::  ipfs-make - make an ipfs url
/-  spider, store=graph-store, gora
/+  *strandio
::
=,  strand=strand:spider
=,  strand-fail=strand-fail:libstrand:spider
::
=<  ::  helper core below, unnamed.
::
^-  thread:spider
|=  arg=vase
=/  m  (strand ,vase)
^-  form:m
::
::  get our expected data or leave
::
=/  drop=(unit [res=resource:store who=@p url=@t pas=@t nod=@t])
  !<((unit [res=resource:store who=@p url=@t pas=@t nod=@t]) arg)
?~  drop
  =-  (strand-fail %upfs-fail -)
  ~[leaf+"spider %ipfs-make received bad call"]
::
::  expose the bowl
::
;<  =bowl:spider   bind:m  get-bowl
=,  bowl
;<  ~              bind:m  (wait (add now ~s2))
::
::  get ipfs hash
::
;<  dat=cord       bind:m  (fetch-cord (trip url.u.drop))
?~  dat
  =/  news=(list content:store)
    :~  [%text '`%upfs` failed to load your image\0d']
        [%mention who.u.drop]
    ==
  =+  msg=(~(bear-news says-this [now our who.u.drop res.u.drop]) news)
  ;<  ~            bind:m  (send-raw-card msg)
  =-  (strand-fail %upfs-load-src -)
  ~[leaf+"spider got nack from img src"]
::
=/  shak=@t  (crip (a-co:co (end 6 (sham eny))))
=/  body=@t
  %+  rap  3
  :~
    '----'  shak  '\0d\0a'
    'Content-Disposition: form-data; name=""; filename="test"'  '\0d\0a'
    'Content-Type: application/octet-stream'  '\0d\0a'
    '\0d\0a'
    dat  '\0d\0a'
    '----'  shak  '--'  '\0d\0a'
  ==
=/  reqs=request:http
  :^    %'POST'
      nod.u.drop
    :~  'Authorization'^pas.u.drop
        'Content-Type'^(cat 3 'multipart/form-data; boundary=--' shak)
    ==
  `(as-octs:mimes:html body)
;<  ~              bind:m  (send-request reqs)
;<  =ccru          bind:m  take-maybe-response
?~  ccru
  =/  news=(list content:store)
    :~  [%text '`%upfs` failed to process your request\0d']
        [%mention who.u.drop]
    ==
  =+  msg=(~(bear-news says-this [now our who.u.drop res.u.drop]) news)
  ;<  ~            bind:m  (send-raw-card msg)
  =-  (strand-fail %upfs-load-ipfs -)
  ~[leaf+"spider got nack from ipfs server"]
;<  response=cord  bind:m  (extract-body u.ccru)
=/  jun=(unit json)        (de-json:html response)
?~  jun
  =/  news=(list content:store)
    :~  [%text '`%upfs` received a bad response from ipfs\0d']
        [%mention who.u.drop]
    ==
  =+  msg=(~(bear-news says-this [now our who.u.drop res.u.drop]) news)
  ;<  ~            bind:m  (send-raw-card msg)
  =-  (strand-fail %upfs-load-ipfs -)
  ~[leaf+"spider got bad response from ipfs server"]
=/  jon=[hash=@t fash=@t sash=@t]  (read-ipfs u.jun)
  =/  news=(list content:store)
    :~  [%text '`%upfs` delivers:\0d']
        [%url (cat 3 'https://ipfs.io/ipfs/' hash.jon)]
        [%mention who.u.drop]
    ==
=+  msg=(~(bear-news says-this [now our who.u.drop res.u.drop]) news)
;<  ~            bind:m  (send-raw-card msg)
(pure:m !>(~))
::
|%
::
+$  ccru  (unit client-response:iris)
::
++  read-ipfs
  |=  jon=json
  =,  dejs:format
  ((ot ~[['Hash' so] ['Name' so] ['Size' so]]) jon)
::
++  says-this
  |_  [now=@da our=@p who=@p ray=resource:store]
  ::
  ++  make-node
    |=  wat=update:store
    ^-  card:agent:gall
    =/  wir=path
      /upfs/thread/response/(scot %da now)
    [%pass wir %agent [our %graph-store] %poke %graph-update-3 !>(wat)]
  ::
  ++  post-link
    |=  url=@t
    =/  lsc=(list content:store)
      :~  [%mention who]
          [%text '\0awe have your link: ']
          [%url url]
      ==
    =/  upd=update:store
      :-  (add now 4)
      :+  %add-nodes
          ray
      %-  ~(put by *(map index:store node:store))
      :-  ~[(add now 4)]
      :_  [%empty ~]
      [%& [our ~[(add now 4)] now lsc ~ ~]]
    (make-node upd)
  ::
  ++  bear-news
    |=  lsc=(list content:store)
    =/  upd=update:store
      :-  (add now 4)
      :+  %add-nodes
          ray
      %-  ~(put by *(map index:store node:store))
      :-  ~[(add now 4)]
      :_  [%empty ~]
      [%& [our ~[(add now 4)] now lsc ~ ~]]
    (make-node upd)
  --
--