FasdUAS 1.101.10   ��   ��    k             l      �� ��   93 paste.applescript
 * 
 * Created by Jacob Rus on 2006-05-26.
 * 
 * This script sets up a list of options, allows TextMate to paste the
 * selected text to a pastebin, sets up a list of possible actions to
 * perform with the link, depending on what applications are available,
 * and carries those actions out.  Some options include:
 * 
 *   - Copy the URL to the clipboard
 *   - Send the URL to Quicksilver
 *   - Open the URL in the default browser
 *   - Paste the URL to an open IRC channel in Colloquy
 *   - Paste the URL to an open chat in Adium
 *   
 * Note that for these last two, if multiple channels or chats are open with
 * the same name, this Applescript will not attempt to distinguish between
 * them, and will paste to the first available channel or chat which matches
 * the user's choice.
 * 
        	  l     ������  ��   	  
  
 l     ������  ��        l     �� ��    !  ==========================         l     �� ��    !  = SET UP LIST OF OPTIONS =         l     �� ��    !  ==========================         l     ������  ��        l     �� ��      initialize the list         l     ��  r         J     ����    o      ���� 0 the_list  ��         l     ������  ��      ! " ! l     �� #��   # N H get a list of open applications, so that we can decide which actions to    "  $ % $ l     �� &��   &   present as options    %  ' ( ' l    )�� ) O     * + * r   	  , - , n   	  . / . 1    ��
�� 
pnam / 2  	 ��
�� 
pcap - o      ���� 0 openapps openApps + m     0 0�null     ߀��  �System Events.app�|?��^���ؐ���P��ۀ�^�����    �[b�> APPLsesevs   alis    �  Ladybird                   ���BH+    �System Events.app                                                k��d�        ����  	                CoreServices    ���"      �c��      �  �  �  6Ladybird:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    L a d y b i r d  -System/Library/CoreServices/System Events.app   / ��  ��   (  1 2 1 l     ������  ��   2  3 4 3 l     �� 5��   5 : 4 get open IRC channels from Colloquy, if it is open;    4  6 7 6 l     �� 8��   8 !  preface the actions with -    7  9 : 9 l   ^ ;�� ; Z    ^ < =���� < E     > ? > o    ���� 0 openapps openApps ? m     @ @  Colloquy    = k    Z A A  B C B O   * D E D r    ) F G F l 	  ' H�� H l   ' I�� I b    ' J K J n    ! L M L 1    !��
�� 
pnam M 2   ��
�� 
dchM K n   ! & N O N 1   $ &��
�� 
pnam O 2  ! $��
�� 
crmM��  ��   G o      ���� 0 colloquy_channels   E m     P P�null     ߀��  *Colloquy.app$�"�|?��^�������п�� �^����p    �[b�( APPLcocoRC   alis    H  Ladybird                   ���BH+    *Colloquy.app                                                    R���{\        ����  	                Applications    ���"      ��_<      *  "Ladybird:Applications:Colloquy.app    C o l l o q u y . a p p    L a d y b i r d  Applications/Colloquy.app   / ��   C  Q R Q Z   + ; S T���� S >  + / U V U o   + ,���� 0 colloquy_channels   V J   , .����   T r   2 7 W X W b   2 5 Y Z Y o   2 3���� 0 the_list   Z m   3 4 [ [  Paste to Colloquy IRC:    X o      ���� 0 the_list  ��  ��   R  \�� \ X   < Z ]�� ^ ] r   L U _ ` _ b   L S a b a o   L M���� 0 the_list   b J   M R c c  d�� d b   M P e f e m   M N g g 	 	-     f o   N O���� 0 each_channel  ��   ` o      ���� 0 the_list  �� 0 each_channel   ^ o   ? @���� 0 colloquy_channels  ��  ��  ��  ��   :  h i h l     ������  ��   i  j k j l     �� l��   l 0 * get open chats from Adium, if it is open;    k  m n m l     �� o��   o !  preface the actions with >    n  p q p l  _ � r�� r Z   _ � s t���� s E   _ b u v u o   _ `���� 0 openapps openApps v m   ` a w w  Adium    t k   e � x x  y z y O  e y { | { r   k x } ~ } l  k t ��  n   k t � � � 1   p t��
�� 
AchN � 2  k p��
�� 
Acht��   ~ o      ���� 0 adium_chats   | m   e h � ��null     ߀��  *	Adium.app���$�"�|?��^�������п�� �^����p    �[b�� APPLAdAdIM   alis    <  Ladybird                   ���BH+    *	Adium.app                                                       F���`��        ����  	                Applications    ���"      �`m�      *  Ladybird:Applications:Adium.app    	 A d i u m . a p p    L a d y b i r d  Applications/Adium.app  / ��   z  � � � Z   z � � ����� � >  z � � � � o   z }���� 0 adium_chats   � J   } ����   � r   � � � � � b   � � � � � o   � ����� 0 the_list   � m   � � � �  Paste to Adium chat:    � o      ���� 0 the_list  ��  ��   �  ��� � X   � � ��� � � r   � � � � � b   � � � � � o   � ����� 0 the_list   � J   � � � �  ��� � b   � � � � � m   � � � � 	 	>     � o   � ����� 0 	each_chat  ��   � o      ���� 0 the_list  �� 0 	each_chat   � o   � ����� 0 adium_chats  ��  ��  ��  ��   q  � � � l     ������  ��   �  � � � l     �� ���   � 2 , get all accounts from iChat, if it is open;    �  � � � l  �) ��� � Z   �) � ����� � E   � � � � � o   � ����� 0 openapps openApps � m   � � � �  iChat    � k   �% � �  � � � O  � � � � � r   � � � � � 6 � � � � � n   � � � � � 1   � ���
�� 
pnam � 2  � ���
�� 
pres � F   � � � � � >  � � � � � 1   � ���
�� 
stat � m   � ���
�� pstaoffl � >  � � � � � 1   � ���
�� 
stat � m   � ���
�� pstaunkn � o      ���� 0 ichat_accounts   � m   � � � ��null     ߀��  *	iChat.app���(�"�|?��^�������п�� �^����p    �[b�� APPLfefez!   alis    <  Ladybird                   ���BH+    *	iChat.app                                                       A�d<        ����  	                Applications    ���"      �d,      *  Ladybird:Applications:iChat.app    	 i C h a t . a p p    L a d y b i r d  Applications/iChat.app  / ��   �  � � � Z   � � ����� � >  � � � � � o   � ����� 0 ichat_accounts   � J   � �����   � r   � � � � � b   � � � � � o   � ����� 0 the_list   � m   � � � �  Paste to iChat:    � o      ���� 0 the_list  ��  ��   �  ��� � X  % ��� � � r    � � � b   � � � o  ���� 0 the_list   � J   � �  ��� � b   � � � m   � �   	    � o  ���� 0 	each_chat  ��   � o      ���� 0 the_list  �� 0 	each_chat   � o  	���� 0 ichat_accounts  ��  ��  ��  ��   �  � � � l     ������  ��   �  � � � l     �� ���   �   add singular actions    �  � � � l *1 ��� � r  *1 � � � b  */ � � � o  *+���� 0 the_list   � m  +. � �  Open in browser    � o      ���� 0 the_list  ��   �  � � � l 29 ��� � r  29 � � � b  27 � � � o  23���� 0 the_list   � m  36 � �  Copy link to clipboard    � o      ���� 0 the_list  ��   �  � � � l :M ��� � Z  :M � ����� � E  :? � � � o  :;���� 0 openapps openApps � m  ;> � �  Quicksilver    � r  BI � � � b  BG � � � o  BC���� 0 the_list   � m  CF � �  Send to Quicksilver    � o      ���� 0 the_list  ��  ��  ��   �  � � � l     ������  ��   �  � � � l NW ��� � r  NW � � � I  NS��������  0 defaultchoices defaultChoices��  ��   � o      ���� 0 default_items  ��   �  � � � l X� ��� � O  X� � � � r  ^� � � � I ^��� 
�� .gtqpchltns    @   @ ns    l 
^_�� o  ^_�� 0 the_list  ��   �~
�~ 
okbt l 	be�} m  be  Paste   �}   �|
�| 
prmp l 	hk	�{	 m  hk

  Pick actions for paste:   �{   �z
�z 
appr l 	nq�y m  nq ! Paste Selection to Pastebin   �y   �x
�x 
inSL o  tw�w�w 0 default_items   �v�u
�v 
mlsl m  z{�t
�t boovtrue�u   � o      �s�s 0 the_choices   � m  X[�null     ߀�� �vTextMate.app�$�"�|?��^���ؐ���P��ۀ�^�����    �[b�B APPLTxTxMt   alis    �  Ladybird                   ���BH+   �vTextMate.app                                                    RW����Q        ����  	                Deployment (ppc)    ���"      ���1     �v Q c�  k�  5Ladybird:Users:duff:Oak:Deployment (ppc):TextMate.app     T e x t M a t e . a p p    L a d y b i r d  ,Users/duff/Oak/Deployment (ppc)/TextMate.app  /    ��  ��   �  l     �r�q�r  �q    l     �p�o�p  �o    l     �n�n   %  ==============================     l     �m�m   %  = PASTE TEXT TO THE PASTEBIN =     l     �l�l   %  ==============================     !  l     �k�j�k  �j  ! "#" l ��$�i$ r  ��%&% m  ��''      & o      �h�h 0 the_url  �i  # ()( l ��*�g* Z  ��+,�f�e+ > ��-.- o  ���d�d 0 the_choices  . m  ���c
�c boovfals, k  ��// 010 I  ���b2�a�b 0 savechoices saveChoices2 3�`3 o  ���_�_ 0 the_choices  �`  �a  1 4�^4 r  ��565 I ���]7�\
�] .sysoexecTEXT���     TEXT7 l 	��8�[8 m  ��99��mkfifo /tmp/cd_tm_pipe
		"$TM_SUPPORT_PATH/bin/CocoaDialog.app/Contents/MacOS/CocoaDialog" progressbar --indeterminate \
		  --title "Paste to Pasting Server�" \
		  --text "Contacting Server �pastie.caboo.se��" < /tmp/cd_tm_pipe &
		exec 4<>/tmp/cd_tm_pipe
		echo -n . >&4
		TM_HTML=$("${TM_RUBY:-ruby}" -rjcode -Ku -r"$TM_BUNDLE_SUPPORT/lib/doctohtml.rb" -e 'print document_to_html(STDIN.read)')
		echo -n "$TM_SELECTED_TEXT"|curl http://pastie.caboo.se/pastes/create \
			-s -L -o /dev/null -w "%{url_effective}" \
			-H "Expect:" \
			-F "paste[body]=<-" \
			-F "paste[textmate_html]=&zwj;$TM_HTML"
		exec 4>&-
		wait
		rm -f /tmp/cd_tm_pipe   �[  �\  6 o      �Z�Z 0 the_url  �^  �f  �e  �g  ) :;: l     �Y�X�Y  �X  ; <=< l     �W>�W  > $  =============================   = ?@? l     �VA�V  A $  = PERFORM REQUESTED OPTIONS =   @ BCB l     �UD�U  D $  =============================   C EFE l     �T�S�T  �S  F GHG l ��I�RI Z  ��JK�Q�PJ > ��LML o  ���O�O 0 the_url  M m  ��NN      K I  ���NO�M�N 0 actonurl actOnURLO PQP o  ���L�L 0 the_url  Q R�KR o  ���J�J 0 the_choices  �K  �M  �Q  �P  �R  H STS l     �I�H�I  �H  T UVU l     �G�F�G  �F  V WXW i     YZY I      �E[�D�E 0 actonurl actOnURL[ \]\ o      �C�C 0 the_url  ] ^�B^ o      �A�A 0 the_choices  �B  �D  Z X     _�@`_ k   aa bcb r    ded c    fgf o    �?�? 0 each_choice  g m    �>
�> 
TEXTe o      �=�= 0 each_choice  c hih l   �<�;�<  �;  i jkj l   �:l�:  l "  send the URL to Quicksilver   k m�9m Z   nop�8n l   q�7q =   rsr o    �6�6 0 each_choice  s m    tt  Send to Quicksilver   �7  o k    .uu vwv O    ,xyx k     +zz {|{ I    %�5�4�3
�5 .miscactvnull��� ��� null�4  �3  | }�2} r   & +~~ o   & '�1�1 0 the_url   1   ' *�0
�0 
sele�2  y m    ���null     ߀��  *Quicksilver.app"�|?��^���ѐ���P��Ԁ�^�����    �[b�  APPLdadaed   alis    T  Ladybird                   ���BH+    *Quicksilver.app                                                 K	-����        ����  	                Applications    ���"      ����      *  %Ladybird:Applications:Quicksilver.app      Q u i c k s i l v e r . a p p    L a d y b i r d  Applications/Quicksilver.app  / ��  w ��� l  - -�/�.�/  �.  � ��-� l  - -�,��,  � $  send the URL to the clipboard   �-  p ��� =  1 4��� o   1 2�+�+ 0 each_choice  � m   2 3��  Copy link to clipboard   � ��� k   7 >�� ��� I  7 <�*��)
�* .JonspClpnull���     ****� o   7 8�(�( 0 the_url  �)  � ��� l  = =�'�&�'  �&  � ��%� l  = =�$��$  � * $ open the URL in the default browser   �%  � ��� =  A D��� o   A B�#�# 0 each_choice  � m   B C��  Open in browser   � ��� k   G N�� ��� I  G L�"��!
�" .GURLGURLnull��� ��� TEXT� o   G H� �  0 the_url  �!  � ��� l  M M���  �  � ��� l  M M���  � * $ paste the URL to the requested chat   �  � ��� I   Q X���� 0 
startswith  � ��� o   R S�� 0 each_choice  � ��� m   S T�� 	 	>    �  �  � ��� k   [ ��� ��� r   [ d��� I   [ b���� 0 striplength  � ��� o   \ ]�� 0 each_choice  � ��� m   ] ^�� �  �  � o      �� 0 each_choice  � ��� O  e ���� l 	 i ���� O  i ���� l 	 � ���� I  � ����
� .AdIMsndMnull���    cobj�  � ���
� 
TO  � l  � ���� b   � ���� m   � ���  pasted    � o   � ��
�
 0 the_url  �  �  �  � n   i ~��� 4   { ~�	�
�	 
cobj� m   | }�� � l  i {��� 6  i {��� 2  i n�
� 
Acht� =  q z��� 1   r v�
� 
AchN� o   w y�� 0 each_choice  �  �  � m   e f �� ��� l  � ����  �  � ��� l  � �� ��   � * $ paste the URL to the requested chat   �  � ��� I   � �������� 0 
startswith  � ��� o   � ����� 0 each_choice  � ���� m   � ���   	   ��  ��  � ��� k   � ��� ��� r   � ���� I   � �������� 0 striplength  � ��� o   � ����� 0 each_choice  � ���� m   � ����� ��  ��  � o      ���� 0 each_choice  � ��� O  � ���� l 	 � ����� I  � �����
�� .ichtsendnull���    obj � l  � ����� b   � ���� m   � ���  pasted    � o   � ����� 0 the_url  ��  � �����
�� 
TO  � l  � ����� 4   � ����
�� 
pres� o   � ����� 0 each_choice  ��  ��  ��  � m   � � �� ��� l  � �������  ��  � ���� l  � ������  � 6 0 paste the URL to the requested IRC channel/chat   ��  � ��� I   � �������� 0 
startswith  � ��� o   � ����� 0 each_choice  � ���� m   � ��� 	 	-    ��  ��  � ���� k   ��� ��� r   � ���� I   � ��� ���� 0 striplength     o   � ����� 0 each_choice   �� m   � ����� ��  ��  � o      ���� 0 each_choice  � �� O   � k   � 	 r   � 

 n   � � 1   � ���
�� 
trgA n   � � 4   � ���
�� 
cobj m   � �����  l  � ��� 6  � � 2  � ���
�� 
chvC =  � � 1   � ���
�� 
pnam o   � ����� 0 each_choice  ��   o      ���� 0 the_channel  	 �� I ��
�� .ccoRsCmXnull���     TEXT l �� b   m    pasted     o  ���� 0 the_url  ��   ��
�� 
sCm1 o  	
���� 0 the_channel   ����
�� 
sCm3 m  ��
�� savoyes ��  ��   m   � � P��  ��  �8  �9  �@ 0 each_choice  ` o    ���� 0 the_choices  X  !  l     ������  ��  ! "#" l     ������  ��  # $%$ l     ��&��  &   load default choices   % '(' i    )*) I      ��������  0 defaultchoices defaultChoices��  ��  * k     8++ ,-, Q     5./0. k    (11 232 r    454 b    676 l   8��8 I   ��9:
�� .earsffdralis        afdr9 m    ��
�� afdmpref: ��;<
�� 
from; m    ��
�� fldmfldu< ��=��
�� 
rtyp= m    ��
�� 
ctxt��  ��  7 m    >> 7 1com.macromates.textmate.paste_to_server.as_record   5 o      ���� 0 
prefs_file  3 ?@? r    ABA I   ��C��
�� .rdwropenshor       fileC o    ���� 0 
prefs_file  ��  B o      ���� 0 f  @ DED r    "FGF I    ��HI
�� .rdwrread****        ****H o    ���� 0 f  I ��J��
�� 
as  J m    ��
�� 
list��  G o      ���� 0 the_list  E K��K I  # (��L��
�� .rdwrclosnull���     ****L o   # $���� 0 f  ��  ��  / R      ������
�� .ascrerr ****      � ****��  ��  0 r   0 5MNM J   0 3OO P��P m   0 1QQ  	- #textmate   ��  N o      ���� 0 the_list  - RSR l  6 6������  ��  S T��T L   6 8UU o   6 7���� 0 the_list  ��  ( VWV l     ������  ��  W XYX l     ������  ��  Y Z[Z l     ��\��  \   save choices   [ ]^] i    _`_ I      ��a���� 0 savechoices saveChoicesa b��b o      ���� 0 the_list  ��  ��  ` k     %cc ded r     fgf b     hih l    	j��j I    	��kl
�� .earsffdralis        afdrk m     ��
�� afdmprefl ��mn
�� 
fromm m    ��
�� fldmfldun ��o��
�� 
rtypo m    ��
�� 
ctxt��  ��  i m   	 
pp 7 1com.macromates.textmate.paste_to_server.as_record   g o      ���� 0 
prefs_file  e qrq r    sts I   ��uv
�� .rdwropenshor       fileu o    ���� 0 
prefs_file  v ��w��
�� 
permw m    ��
�� boovtrue��  t o      ���� 0 f  r xyx I   ��z{
�� .rdwrwritnull���     ****z o    ���� 0 the_list  { ��|��
�� 
refn| o    ���� 0 f  ��  y }��} I    %��~��
�� .rdwrclosnull���     ****~ o     !���� 0 f  ��  ��  ^ � l     ������  ��  � ��� l     ��~�  �~  � ��� l     �}��}  � L F test if 'longstring' starts with 'startstring'.  If not, return false   � ��� i    ��� I      �|��{�| 0 
startswith  � ��� o      �z�z 0 
longstring  � ��y� o      �x�x 0 startstring  �y  �{  � k     8�� ��� Z     ���w�v� ?     ��� n     ��� 1    �u
�u 
leng� o     �t�t 0 startstring  � n    ��� 1    �s
�s 
leng� o    �r�r 0 
longstring  � L   
 �� m   
 �q
�q boovfals�w  �v  � ��� Y    5��p���o� Z    0���n�m� >   '��� l   "��l� n    "��� 4    "�k�
�k 
cha � o     !�j�j 0 i  � o    �i�i 0 startstring  �l  � l  " &��h� n   " &��� 4   # &�g�
�g 
cha � o   $ %�f�f 0 i  � o   " #�e�e 0 
longstring  �h  � L   * ,�� m   * +�d
�d boovfals�n  �m  �p 0 i  � m    �c�c � n    ��� 1    �b
�b 
leng� o    �a�a 0 startstring  �o  � ��`� L   6 8�� m   6 7�_
�_ boovtrue�`  � ��� l     �^�]�^  �]  � ��� l     �\�[�\  �[  � ��� l     �Z��Z  � O I strip the first 'num' characters from 'longstring', returning the result   � ��� i    ��� I      �Y��X�Y 0 striplength  � ��� o      �W�W 0 
longstring  � ��V� o      �U�U 0 num  �V  �X  � L     �� c     ��� l    ��T� n     ��� 7  �S��
�S 
cha � l   	��R� [    	��� o    �Q�Q 0 num  � m    �P�P �R  � l  
 ��O� n   
 ��� 1    �N
�N 
leng� o   
 �M�M 0 
longstring  �O  � o     �L�L 0 
longstring  �T  � m    �K
�K 
TEXT� ��J� l     �I�H�I  �H  �J       �G��������������F'�E�D�C�B�A�@�?�>�=�<�G  � �;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�; 0 actonurl actOnURL�:  0 defaultchoices defaultChoices�9 0 savechoices saveChoices�8 0 
startswith  �7 0 striplength  
�6 .aevtoappnull  �   � ****�5 0 the_list  �4 0 openapps openApps�3 0 colloquy_channels  �2 0 adium_chats  �1 0 ichat_accounts  �0 0 default_items  �/ 0 the_choices  �. 0 the_url  �-  �,  �+  �*  �)  �(  �'  �&  �%  �$  � �#Z�"�!��� �# 0 actonurl actOnURL�" ��� �  ��� 0 the_url  � 0 the_choices  �!  � ����� 0 the_url  � 0 the_choices  � 0 each_choice  � 0 the_channel  � &����t���������� �������� ���
�	� P��������
� 
kocl
� 
cobj
� .corecnte****       ****
� 
TEXT
� .miscactvnull��� ��� null
� 
sele
� .JonspClpnull���     ****
� .GURLGURLnull��� ��� TEXT� 0 
startswith  � 0 striplength  
� 
Acht�  
� 
AchN
� 
TO  
� .AdIMsndMnull���    cobj
�
 
pres
�	 .ichtsendnull���    obj 
� 
chvC
� 
pnam
� 
trgA
� 
sCm1
� 
sCm3
� savoyes � 
� .ccoRsCmXnull���     TEXT� !�[��l kh ��&E�O��  � *j O�*�,FUOPY ��  �j 	OPY ܢ�  �j OPY �*��l+  <*�ml+ E�O� (*a -a [a ,\Z�81�k/ *a a �%l UUOPY �*�a l+  **�ll+ E�Oa  a �%a *a �/l UOPY T*�a l+  G*�ml+ E�Oa  3*a -a [a ,\Z�81�k/a ,E�Oa  �%a !�a "a #a $ %UY h[OY��� � *���������   0 defaultchoices defaultChoices��  ��  � �������� 0 
prefs_file  �� 0 f  �� 0 the_list  � ��������������>��������������Q
�� afdmpref
�� 
from
�� fldmfldu
�� 
rtyp
�� 
ctxt�� 
�� .earsffdralis        afdr
�� .rdwropenshor       file
�� 
as  
�� 
list
�� .rdwrread****        ****
�� .rdwrclosnull���     ****��  ��  �� 9 *������ �%E�O�j E�O���l E�O�j W X  �kvE�O�� ��`���������� 0 savechoices saveChoices�� ����� �  ���� 0 the_list  ��  � �������� 0 the_list  �� 0 
prefs_file  �� 0 f  � ��������������p����������
�� afdmpref
�� 
from
�� fldmfldu
�� 
rtyp
�� 
ctxt�� 
�� .earsffdralis        afdr
�� 
perm
�� .rdwropenshor       file
�� 
refn
�� .rdwrwritnull���     ****
�� .rdwrclosnull���     ****�� &������ �%E�O��el 	E�O��l O�j � ������������� 0 
startswith  �� ����� �  ������ 0 
longstring  �� 0 startstring  ��  � �������� 0 
longstring  �� 0 startstring  �� 0 i  � ����
�� 
leng
�� 
cha �� 9��,��, fY hO #k��,Ekh ��/��/ fY h[OY��Oe� ������������� 0 striplength  �� ����� �  ������ 0 
longstring  �� 0 num  ��  � ������ 0 
longstring  �� 0 num  � ������
�� 
cha 
�� 
leng
�� 
TEXT�� �[�\[Z�k\Z��,2�&� �����������
�� .aevtoappnull  �   � ****� k    ���  ��  '��  9��  p��  ���  ���  ���  ���  ���  ��� "�� (�� G����  ��  ��  � ������ 0 each_channel  �� 0 	each_chat  � 9�� 0������ @ P������ [������ g w ������� � � � ������������ � � � � � ���������
������������'����9��N���� 0 the_list  
�� 
pcap
�� 
pnam�� 0 openapps openApps
�� 
dchM
�� 
crmM�� 0 colloquy_channels  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
Acht
�� 
AchN�� 0 adium_chats  
�� 
pres
�� 
stat
�� pstaoffl
�� pstaunkn�� 0 ichat_accounts  ��  0 defaultchoices defaultChoices�� 0 default_items  
�� 
okbt
�� 
prmp
�� 
appr
�� 
inSL
�� 
mlsl�� 

�� .gtqpchltns    @   @ ns  �� 0 the_choices  �� 0 the_url  �� 0 savechoices saveChoices
�� .sysoexecTEXT���     TEXT�� 0 actonurl actOnURL���jvE�O� 	*�-�,E�UO�� G� *�-�,*�-�,%E�UO�jv 
��%E�Y hO �[��l kh  ��%kv%E�[OY��Y hO�� Qa  *a -a ,E` UO_ jv �a %E�Y hO !_ [��l kh �a �%kv%E�[OY��Y hO�a  la  **a -�,a [[a ,\Za 9\[a ,\Za 9A1E` UO_ jv �a %E�Y hO !_ [��l kh �a �%kv%E�[OY��Y hO�a  %E�O�a !%E�O�a " �a #%E�Y hO*j+ $E` %Oa & )�a 'a (a )a *a +a ,a -_ %a .ea / 0E` 1UOa 2E` 3O_ 1f *_ 1k+ 4Oa 5j 6E` 3Y hO_ 3a 7 *_ 3_ 1l+ 8Y h� ����� �   [���� ��  � � �� % 	- queuetue                  � ! 	- JEG2                  � % 	- nickserv                  � & 	- #textmate                  � &  	James Gray                    %  	nicuramar                   (  	Blake Burris                   )  	drunkenbatman                   *  	eventualbuddha                   )  	Allan Odgaard                  � ����     	
 !"#$% �&&  l o g i n w i n d o w �''  D o c k �((  S y s t e m U I S e r v e r	 �))  F i n d e r
 �**  S S H K e y c h a i n �++  R e m i n d e r M a t e �,,  i T u n e s H e l p e r �--  E y e T V   H e l p e r �..  Q u i c k s i l v e r �//  G e e k T o o l �00  i T u n e s �11  D a s h b o a r d C l i e n t �22  D a s h b o a r d C l i e n t �33  D a s h b o a r d C l i e n t �44  D a s h b o a r d C l i e n t �55  D a s h b o a r d C l i e n t �66   t e x t p a n d e r d a e m o n �77  S y s t e m   E v e n t s �88  M a i l �99  C o l l o q u y �::   N e t N e w s W i r e   L i t e �;;  O m n i W e b �<<  T e r m i n a l �==  T e x t M a t e �>>  D V D   P l a y e r �??  U n i v e r s a l A c c e s s  �@@  S c r i p t   E d i t o r! �AA  i C h a t A g e n t" �BB  A d d r e s s   B o o k# �CC 
 A d i u m$ �DD 
 i C h a t% �EE  o s a s c r i p t� ��F�� F  GHIJG �KK  q u e u e t u eH �LL  J E G 2I �MM  n i c k s e r vJ �NN  # t e x t m a t e� ��O��  O   � ��P�� P  QRSTUVQ �WW  J a m e s   G r a yR �XX  n i c u r a m a rS �YY  B l a k e   B u r r i sT �ZZ  d r u n k e n b a t m a nU �[[  e v e n t u a l b u d d h aV �\\  A l l a n   O d g a a r d� ��]�� ]  ^^ %  	nicuramar                  
�F boovfals�E  �D  �C  �B  �A  �@  �?  �>  �=  �<  ascr  ��ޭ