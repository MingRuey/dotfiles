api.unmap('H');
api.unmap('L');
api.map('S', 'H');
api.map('D', 'L'); // forward backward in history

// Other removals of defaults
api.unmap('<Alt-s>');
api.unmap('<Alt-i>');
api.unmap('p');
api.unmap(';ql');

api.unmap('[[');
api.unmap(']]');
api.unmap(';fs');
api.unmap('q');

api.unmap(';w');
api.unmap('w');

api.unmap('gx0'); 
api.unmap('gxt'); 
api.unmap('gxT'); 
api.unmap('gxx'); 
api.unmap('gx$'); // Various closing tabs. Can be useful
api.unmap(';gt'); 
api.unmap(';gw'); // Tab filter & gatherings. Can be useful.

api.unmap('<Alt-p>'); 
api.unmap('<Alt-m>'); 

api.unmap('g?');
api.unmap('g#');

api.unmap('r');

api.unmap('ZZ');
api.unmap('ZR');

api.unmap('cq');
api.unmap('cc');
api.unmap(';pp');
api.unmap(';pj');
api.unmap(';pf');

api.unmap('go');
api.unmap('Q');
api.unmap('oi');
api.unmap('oe');
api.unmap('ox');
api.unmap('H');
api.unmap('<Ctrl+i>');
api.unmap('<Ctrl+j>');
api.unmap('<Ctrl+.>');
api.unmap('<Ctrl+,>');
api.unmap('<Ctrl+i>');
api.unmap('<Ctrl+c>');
api.unmap('<Ctrl+D>');
api.unmap('<Ctrl+r>');
api.unmap('<Ctrl+m>');
api.unmap('<Ctrl+\'>');

api.unmap(';pm');
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

api.unmap('<Ctrl-f>');

// Replace and/or remove defaults
api.unmap('cf');
api.unmap('gf');
api.unmap('C');
api.map('of', 'of');  // cf, gf, of are originally binded to the same :|
api.map('O', 'ot'); // open text as url...maybe
api.map(';U', 'ovim'); // edit current url with vim and open
 
api.map(';di', 'di'); // download image

api.unmap(';m');
api.map('<Ctrl-h>', ';min');  // mouse-in
api.map('<Ctrl-j', ';mout');  // mouse-out

api.unmap('i');
api.unmap('I');
api.unmap('<Ctrl-Alt-i>'); // neovim
// api.map('<Ctrl-i>', '<Ctrl-i>'); // edit in vim (must select textbox first)

// api.unmap('cS');
// api.unmap('cs'); 
api.map('cs', '<Ctrl-w>'); // 'cs' was the same -- switch scroll
api.unmap('u'); 
api.map('e', '<Ctrl-o>');  // 'u', 'e' are originally the same :|
api.map('d', '<Ctrl-d>');
api.map('U', '<Ctrl-b>');
api.map('P', '<Ctrl-f>');

api.unmap('yT'); 
api.map('yt', ';pp'); // duplicate tab
api.map('T', 'gtt'); // go to tab
api.map('gxp', 'xp'); // close playing tab
api.map('gp', 'gtp'); // go to playing tab
api.map(';u', 'gvi'); // edit current url with vim and go
api.unmap('Move');
api.map('W', ';mo'); // move tab to another window
api.unmap('<Ctrl-6>');
api.unmap('<Ctrl-o>');
api.map('gT', '<Ctrl+i>'); 
api.map('gt', '<Ctrl+o>'); // previous/last active tabs

api.unmap('og'); 
api.map('sg', 'sg');  // search selected with Google
api.map('se', 'sw');  // search selected with Wiki
// api.map('sh', 'sh');  // search selected with GitHub

api.unmap('yG');
api.unmap('yg');
api.unmap('yc');
api.unmap('yq');
api.unmap('yi');
api.unmap('yh');
api.unmap('yS');
api.unmap('yQ');
api.unmap('yf');
api.unmap('yp');
api.unmap('yj');
api.unmap('Y');  // various yanks, might be useful
api.unmap('yv');
api.map('ye', 'ye'); // yv & ye wereare the same -- yank text of an element
api.map('ymv', 'yE'); // yank texts of multiple elements
api.map('yl', 'yn'); // yank title of tab

api.unmap('<Ctrl+d>'); // delete from bookmark or history

// Not working remap -- don't know why

// api.unmap('b'); 
// api.unmap('oq'); 
// api.map('ab', 'bb'); // bookmark current page
// api.map('ob', 'ob'); // oq & ob were the same -- open bookmark

// api.map(';db', 'db'); // Remove bookmark for current page 
// api.map(';t', ';translate');

// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #24272e;
    color: #abb2bf;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .url {
    color: #61afef;
}
.sk_theme .annotation {
    color: #56b6c2;
}
.sk_theme .omnibar_highlight {
    color: #528bff;
}
.sk_theme .omnibar_timestamp {
    color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #3e4452;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;
