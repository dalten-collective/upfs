::
::  upfs sur file
::
/-  gora, store=graph-store
::
|%
::
+$  admin
  $%  [%node site=@t]
      [%cred user=@t pass=@t]
      [%read res=resource:store]
      [%wind ~]
      [%gora goid=@uv]
  ==
::
+$  maker
  $%  [%make-hash url=@t mim=mite]
      [%take-hash hsh=@t]
  ==
::
+$  state-0
  [node=@t ipfs-creds=@t perm-gora=@uv wind=? chat=resource:store]
--