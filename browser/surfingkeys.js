// Change where little text appears
settings.hintAlign = "left"

// Other removals of defaults
//  -- syntax: 
//  --   api.unmap('key');
//  --:  api.map('new_key', 'old_key');  *this doesn't remove the old keys
//  -- notes:
//  --   1. Keys can't share same prefixes. the shorter ones are always triggered
//  --   2. map the new key first then unmap the old ones. Orders matter.
api.unmap('<Alt-s>');
api.unmap('<Alt-i>');
api.unmap('p');
api.unmap(';ql');
api.unmap(';fs');
api.unmap('<Alt-p>');
api.unmap('<Alt-m>');
api.unmap('g?');
api.unmap('g#');
api.unmap('ZZ');
api.unmap('ZR');
api.unmap('cq');
api.unmap(';pp');
api.unmap(';pj');
api.unmap(';pf');
api.unmap('Q');
api.unmap('<Ctrl-.>');
api.unmap('<Ctrl-,>');
api.unmap('<Ctrl-D>');
api.unmap('<Ctrl-r>');
api.unmap(';e');
api.unmap(';v');
api.unmap('ga');
api.unmap('gb');
api.unmap('gc');
api.unmap('gd');
api.unmap('gh');
api.unmap('gk');
api.unmap('ge');
api.unmap('gn');
api.unmap('gs');
api.unmap(';i');
api.unmap(';j');
api.unmap('cp');
api.unmap(';pa');
api.unmap(';pb');
api.unmap(';pd');
api.unmap(';ps');
api.unmap(';pc');
api.unmap(';cp');
api.unmap(';ap');
api.unmap('gr');
api.unmap(';s');
api.unmap(';ph');
api.unmap(';dh');
api.unmap(';yh');

// bookmarks
api.unmap('ob'); 
api.map('ob', 'b');  // Open bookmarks
api.unmap('b');
api.map('bb', 'ab'); 
api.unmap('ab');
api.map('bd', '<Ctrl-d>'); 
api.unmap('<Ctrl-d>');

// tab opening
api.unmap('oi');
api.unmap('og');  // search alias
api.unmap('od');
api.unmap('oe');
api.unmap('ow');
api.unmap('oy');
api.unmap('ox');
api.map('oo', 't');
api.unmap('t');
api.map('of', 'gf');  // open in background
api.unmap('F');
api.map('F', 'gf');
api.map('oaf', 'af'); // open in active
api.unmap('gf');
api.unmap('C'); // == gf
api.unmap('af');
api.map('oF', 'cf'); // multiple open
api.unmap('cf');
api.unmap('[[');
api.unmap(']]');
api.map('ot', 'O'); // try detecting url in text and open
api.unmap('O');
api.map('oy', 'yT');  // duplicate tab in background
api.map('oay', 'yt'); // duplicate tab in active
api.unmap('yt');
api.unmap('yT');
api.map('oc', 'cc');  // Open selected or from clipboard
api.unmap('cc');
api.map('ou', ';u');  // edit current url and open new
api.unmap(';u'); 
api.map('og', 'sg');  // open with google search
api.unmap('sg');
api.unmap('sd');
api.unmap('sb');
api.unmap('se');
api.unmap('sw');
api.unmap('ss');
api.unmap('sh'); 
api.unmap('sy'); 
api.unmap('H');

// mouse
api.unmap(';m');
api.map(';min', '<Ctrl-h>');  // mouse-in elements
api.unmap('<Ctrl-h>');
api.map(';mout', '<Ctrl-j');  // mouse-out elements
api.unmap('<Ctrl-j>'); 
api.unmap('q'); // click on an image or a button

// typing box
api.map('ii', 'I'); // go to textbox and enter vim
api.unmap('<Ctrl-Alt-i>'); // neovim
api.unmap('i');
api.unmap('I');

// scrolling & zoom
api.map('<Ctrl-w>', 'cs'); 
api.unmap('cs'); 
api.unmap('cS'); 
api.map('<Ctrl-u>', 'u'); 
api.unmap('u');  
api.unmap('e'); // == u
api.map('<Ctrl-d>', 'd');
api.unmap('d');
api.map('<Ctrl-b>', 'U');
api.unmap('U');
api.map('<Ctrl-f>', 'P');
api.unmap('P');
api.unmap('%'); // scroll percentage
api.unmap(';w');
api.unmap('w');
api.unmap('zr');
api.unmap('zi');
api.unmap('zo');

// go-to another page using current tab
api.map('H', 'S'); 
api.unmap('S'); 
api.map('L', 'D'); 
api.unmap('D');
api.unmap('B');
api.unmap('r');
api.unmap('<Ctrl-6'); 
api.map('gh', 'gu');  // go 'one-up' in terms of url
api.unmap('gu');
api.map('gu', 'go'); 
api.unmap('go'); 
api.map('gi', ';U');  // edit current url and visit 
api.unmap(';U'); 

// Clip-board
api.unmap('yS');
api.map('yt', 'yv');
api.map('yT', 'ymv');
api.unmap('yv');
api.unmap('ymv');
api.map('yu', 'ya');
api.map('yU', 'yma');
api.unmap('ya');
api.unmap('yma'); 
api.unmap('yc');
api.unmap('ymc');
api.unmap('yq');
api.unmap('ys');
api.unmap('yj');
api.unmap('yh');
api.unmap('yQ');
api.unmap('yf');
api.unmap('yp');

// going-to tab
api.unmap('g0');
api.unmap('g$');
api.map('zgh', 'E');
api.unmap('E');
api.map('zgl', 'R');
api.unmap('R');
api.map('zgg', 'T');
api.unmap('T');
api.unmap(';gt');
api.unmap(';gw');
api.map('zg0', 'gT');  // go to first activated
api.unmap('gT');
api.map('zg$', 'gt');  // go to last activated
api.unmap('gt');
api.map('zgp', 'gp');  // go to tab with aound
api.unmap('gp');

// cloing tabs
api.map('dd', 'x');
api.unmap('x');
api.unmap('X'); // restore closed
api.map('dh', 'gxt');
api.unmap('gxt');
api.map('dl', 'gxT');
api.unmap('gxT');
api.map('d0', 'gx0');
api.unmap('gx0');
api.map('d$', 'gx$');
api.unmap('gx$');
api.map('dp', 'gxp'); // close tab with sound
api.unmap('gxp');

// convinient utils
api.map(';di', ';di'); // download image
api.map(';move', 'W'); // move tab to another window
api.unmap('W');
api.map(';md', ';pm'); // preview markdown
api.unmap(';pm');
